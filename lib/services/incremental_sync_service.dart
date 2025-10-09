import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the incremental sync service
final incrementalSyncServiceProvider = Provider<IncrementalSyncService>((ref) {
  return IncrementalSyncService(
    ref.watch(libraryServiceProvider),
    ref.read(libraryItemsRepositoryProvider.future),
  );
});

/// Service responsible for incremental synchronization of library data
/// Uses createdAt ordering from the backend to determine what needs to be updated
class IncrementalSyncService {
  final LibraryService _libraryService;
  final Future<LibraryItemsRepository> _repository;

  IncrementalSyncService(this._libraryService, this._repository);

  /// Performs incremental sync for a library
  /// Returns sync result with statistics
  Future<IncrementalSyncResult> syncLibrary(
    UserModel userModel,
    Library library,
  ) async {
    if (kDebugMode) {
      print(
          '[INCREMENTAL_SYNC] Starting incremental sync for library: ${library.name}');
    }

    final repository = await _repository;
    final libraryId = library.id;

    try {
      // Get the last sync timestamp for this library
      final lastSyncTimestamp = await _getLastSyncTimestamp(libraryId);

      if (kDebugMode) {
        print('[INCREMENTAL_SYNC] Last sync timestamp: $lastSyncTimestamp');
      }

      // Fetch library items from backend
      final libraryItems =
          await _libraryService.fetchLibraryItems(userModel, libraryId);

      if (kDebugMode) {
        print(
            '[INCREMENTAL_SYNC] Fetched ${libraryItems.length} items from backend');
      }

      // Get existing items from local database
      final existingItems = await repository.getBooksByLibraryId(libraryId);

      if (kDebugMode) {
        print(
            '[INCREMENTAL_SYNC] Found ${existingItems.length} existing items in local database');
      }

      // Perform incremental update
      final syncResult = await _performIncrementalUpdate(
        libraryItems,
        existingItems,
        lastSyncTimestamp,
        repository,
      );

      // Update last sync timestamp
      await _updateLastSyncTimestamp(
          libraryId, DateTime.now().millisecondsSinceEpoch);

      if (kDebugMode) {
        print('[INCREMENTAL_SYNC] Sync completed: ${syncResult.toString()}');
      }

      return syncResult;
    } catch (e) {
      if (kDebugMode) {
        print('[INCREMENTAL_SYNC] Sync failed: $e');
      }
      return IncrementalSyncResult.error(e.toString());
    }
  }

  /// Performs the actual incremental update logic
  Future<IncrementalSyncResult> _performIncrementalUpdate(
    List<LibraryItemNew> backendItems,
    List<LibraryItemEntity> existingItems,
    int? lastSyncTimestamp,
    LibraryItemsRepository repository,
  ) async {
    int newItems = 0;
    int updatedItems = 0;
    int skippedItems = 0;
    int deletedItems = 0;

    // Create maps for efficient lookup
    final existingItemsMap = <String, LibraryItemEntity>{};
    for (final item in existingItems) {
      existingItemsMap[item.itemId] = item;
    }

    final backendItemsMap = <String, LibraryItemNew>{};
    for (final item in backendItems) {
      backendItemsMap[item.id] = item;
    }

    // Find new and updated items
    final itemsToSave = <LibraryItemNew>[];

    for (final backendItem in backendItems) {
      final itemId = backendItem.id;
      final existingItem = existingItemsMap[itemId];

      if (existingItem == null) {
        // New item
        newItems++;
        itemsToSave.add(backendItem);

        if (kDebugMode) {
          print(
              '[INCREMENTAL_SYNC] New item: ${backendItem.media.metadata.title}');
        }
      } else {
        // Check if item needs updating
        final needsUpdate =
            _itemNeedsUpdate(backendItem, existingItem, lastSyncTimestamp);

        if (needsUpdate) {
          updatedItems++;
          itemsToSave.add(backendItem);

          if (kDebugMode) {
            print(
                '[INCREMENTAL_SYNC] Updated item: ${backendItem.media.metadata.title}');
          }
        } else {
          skippedItems++;
        }
      }
    }

    // Find deleted items (items that exist locally but not in backend)
    for (final existingItemId in existingItemsMap.keys) {
      if (!backendItemsMap.containsKey(existingItemId)) {
        deletedItems++;

        if (kDebugMode) {
          print('[INCREMENTAL_SYNC] Deleted item: $existingItemId');
        }

        // Remove from local database
        await repository.deleteBook(existingItemId);
      }
    }

    // Save new and updated items
    if (itemsToSave.isNotEmpty) {
      await repository.saveLibraryItems(itemsToSave);
    }

    return IncrementalSyncResult(
      newItems: newItems,
      updatedItems: updatedItems,
      skippedItems: skippedItems,
      deletedItems: deletedItems,
      totalProcessed: backendItems.length,
    );
  }

  /// Determines if an item needs updating based on timestamps and content
  bool _itemNeedsUpdate(
    LibraryItemNew backendItem,
    LibraryItemEntity existingItem,
    int? lastSyncTimestamp,
  ) {
    // If no last sync timestamp, update everything
    if (lastSyncTimestamp == null) {
      return true;
    }

    // Check if item was updated since last sync
    final itemUpdatedAt = backendItem.updatedAt ?? backendItem.addedAt ?? 0;
    if (itemUpdatedAt > lastSyncTimestamp) {
      return true;
    }

    // Check if local item is missing cover bytes
    if (existingItem.media.coverBytes?.isEmpty == true) {
      return true;
    }

    return false;
  }

  /// Gets the last sync timestamp for a library
  Future<int?> _getLastSyncTimestamp(String libraryId) async {
    final repository = await _repository;
    return await repository.getLastSyncTimestamp(libraryId);
  }

  /// Updates the last sync timestamp for a library
  Future<void> _updateLastSyncTimestamp(String libraryId, int timestamp) async {
    final repository = await _repository;
    await repository.updateLastSyncTimestamp(libraryId, timestamp);
  }

  /// Gets sync statistics for a library
  Future<SyncStatistics> getSyncStatistics(String libraryId) async {
    final repository = await _repository;
    final localItems = await repository.getBooksByLibraryId(libraryId);

    return SyncStatistics(
      localItemCount: localItems.length,
      lastSyncTimestamp: await _getLastSyncTimestamp(libraryId),
    );
  }
}

/// Result of an incremental sync operation
class IncrementalSyncResult {
  final int newItems;
  final int updatedItems;
  final int skippedItems;
  final int deletedItems;
  final int totalProcessed;
  final String? error;

  IncrementalSyncResult({
    required this.newItems,
    required this.updatedItems,
    required this.skippedItems,
    required this.deletedItems,
    required this.totalProcessed,
    this.error,
  });

  factory IncrementalSyncResult.error(String error) {
    return IncrementalSyncResult(
      newItems: 0,
      updatedItems: 0,
      skippedItems: 0,
      deletedItems: 0,
      totalProcessed: 0,
      error: error,
    );
  }

  bool get isSuccess => error == null;

  int get totalChanges => newItems + updatedItems + deletedItems;

  @override
  String toString() {
    if (error != null) {
      return 'IncrementalSyncResult(error: $error)';
    }
    return 'IncrementalSyncResult(new: $newItems, updated: $updatedItems, skipped: $skippedItems, deleted: $deletedItems, total: $totalProcessed)';
  }
}

/// Statistics about sync state
class SyncStatistics {
  final int localItemCount;
  final int? lastSyncTimestamp;

  SyncStatistics({
    required this.localItemCount,
    this.lastSyncTimestamp,
  });

  DateTime? get lastSyncDate {
    if (lastSyncTimestamp == null) return null;
    return DateTime.fromMillisecondsSinceEpoch(lastSyncTimestamp!);
  }
}
