import 'dart:async';

import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final backgroundLibraryLoadingServiceProvider =
    Provider<BackgroundLibraryLoadingService>((ref) {
  return BackgroundLibraryLoadingService(
    ref.watch(libraryServiceProvider),
    ref.read(libraryRepositoryProvider.future),
    ref.read(libraryItemsRepositoryProvider.future),
  );
});

class BackgroundLibraryLoadingService {
  final LibraryService libraryService;
  final Future<LibraryRepository> libraryRepository;
  final Future<LibraryItemsRepository> libraryItemsRepository;

  // Track loading progress for each library
  final Map<String, LibraryLoadingProgress> _loadingProgress = {};
  final Map<String, StreamController<LibraryLoadingProgress>>
      _progressControllers = {};

  BackgroundLibraryLoadingService(
    this.libraryService,
    this.libraryRepository,
    this.libraryItemsRepository,
  );

  /// Get loading progress for a specific library
  LibraryLoadingProgress? getLoadingProgress(String libraryId) {
    return _loadingProgress[libraryId];
  }

  /// Get progress stream for a specific library
  Stream<LibraryLoadingProgress>? getProgressStream(String libraryId) {
    return _progressControllers[libraryId]?.stream;
  }

  /// Check if a library is currently being loaded
  bool isLibraryLoading(String libraryId) {
    final progress = _loadingProgress[libraryId];
    return progress != null && progress.status == LibraryLoadingStatus.loading;
  }

  /// Check if a library has been loaded
  bool isLibraryLoaded(String libraryId) {
    final progress = _loadingProgress[libraryId];
    return progress != null &&
        progress.status == LibraryLoadingStatus.completed;
  }

  /// Load all libraries in background after the selected one
  Future<void> loadAllLibrariesInBackground(
    UserModel userModel,
    List<Library> libraries,
    String selectedLibraryId,
  ) async {
    if (kDebugMode) {
      print(
          '[BACKGROUND_LOADING] Starting background loading for ${libraries.length} libraries');
    }

    // Load selected library first (highest priority)
    final selectedLibrary = libraries.firstWhere(
      (lib) => lib.id == selectedLibraryId,
      orElse: () => libraries.first,
    );

    await _loadLibraryWithPriority(userModel, selectedLibrary, true);

    // Load other libraries in background with lower priority
    final otherLibraries =
        libraries.where((lib) => lib.id != selectedLibraryId).toList();

    // Process other libraries with delay to avoid overwhelming the server
    for (int i = 0; i < otherLibraries.length; i++) {
      final library = otherLibraries[i];

      // Add delay between libraries to be gentle on the server
      if (i > 0) {
        await Future.delayed(const Duration(seconds: 2));
      }

      // Load library in background
      _loadLibraryWithPriority(userModel, library, false);
    }
  }

  /// Load a single library with specified priority
  Future<void> _loadLibraryWithPriority(
    UserModel userModel,
    Library library,
    bool isHighPriority,
  ) async {
    final libraryId = library.id;

    if (kDebugMode) {
      print(
          '[BACKGROUND_LOADING] Loading library: ${library.name} (Priority: ${isHighPriority ? 'HIGH' : 'LOW'})');
    }

    // Initialize progress tracking
    _loadingProgress[libraryId] = LibraryLoadingProgress(
      libraryId: libraryId,
      libraryName: library.name,
      status: LibraryLoadingStatus.loading,
      progress: 0.0,
      itemsLoaded: 0,
      totalItems: 0,
      isHighPriority: isHighPriority,
    );

    // Create progress controller if it doesn't exist
    if (!_progressControllers.containsKey(libraryId)) {
      _progressControllers[libraryId] =
          StreamController<LibraryLoadingProgress>.broadcast();
    }

    try {
      // Update progress: Starting
      _updateProgress(libraryId, 0.1, LibraryLoadingStatus.loading, 0, 0);

      // Load library items
      final libraryItems =
          await libraryService.fetchLibraryItems(userModel, libraryId);

      if (kDebugMode) {
        print(
            '[BACKGROUND_LOADING] ${library.name}: ${libraryItems.length} items found');
      }

      // Update progress: Items found
      _updateProgress(
          libraryId, 0.3, LibraryLoadingStatus.loading, 0, libraryItems.length);

      // Load series
      final seriesItems =
          await libraryService.fetchSeries(userModel, libraryId);

      if (kDebugMode) {
        print(
            '[BACKGROUND_LOADING] ${library.name}: ${seriesItems.length} series found');
      }

      // Update progress: Series loaded
      _updateProgress(
          libraryId, 0.5, LibraryLoadingStatus.loading, 0, libraryItems.length);

      // Load covers for items (this is the most time-consuming part)
      final libraryItemsWithCover = <LibraryItem>[];
      final repository = await libraryItemsRepository;

      for (int i = 0; i < libraryItems.length; i++) {
        final libraryItem = libraryItems[i];

        // Check if we already have a cached version with cover
        final cachedLibraryItem = await repository.getBook(libraryItem.id);
        if (cachedLibraryItem?.media.coverBytes == null ||
            libraryItem.updatedAt > (cachedLibraryItem?.updatedAt ?? 0)) {
          try {
            final cover =
                await libraryService.fetchCover(libraryItem, userModel);
            if (cover != null) {
              final mediaWithCover =
                  libraryItem.media.copyWith(coverBytes: cover);
              libraryItemsWithCover
                  .add(libraryItem.copyWith(media: mediaWithCover));
            }
          } catch (e) {
            if (kDebugMode) {
              print(
                  '[BACKGROUND_LOADING] Failed to fetch cover for ${libraryItem.media.metadata?.title ?? 'Unknown'}: $e');
            }
            // Continue without cover
            libraryItemsWithCover.add(libraryItem);
          }
        } else {
          // Use cached version
          libraryItemsWithCover.add(libraryItem);
        }

        // Update progress
        final progress = 0.5 + (0.4 * (i + 1) / libraryItems.length);
        _updateProgress(libraryId, progress, LibraryLoadingStatus.loading,
            i + 1, libraryItems.length);
      }

      // Save to database
      await repository.saveLibraryItems(libraryItemsWithCover);
      repository.saveSeriesItems(seriesItems);

      // Update progress: Completed
      _updateProgress(libraryId, 1.0, LibraryLoadingStatus.completed,
          libraryItems.length, libraryItems.length);

      if (kDebugMode) {
        print(
            '[BACKGROUND_LOADING] ${library.name}: Loading completed successfully');
      }
    } catch (e) {
      if (kDebugMode) {
        print('[BACKGROUND_LOADING] ${library.name}: Loading failed: $e');
      }

      // Update progress: Failed
      _updateProgress(libraryId, 0.0, LibraryLoadingStatus.failed, 0, 0);
    }
  }

  /// Update loading progress for a library
  void _updateProgress(
    String libraryId,
    double progress,
    LibraryLoadingStatus status,
    int itemsLoaded,
    int totalItems,
  ) {
    final currentProgress = _loadingProgress[libraryId];
    if (currentProgress != null) {
      _loadingProgress[libraryId] = currentProgress.copyWith(
        status: status,
        progress: progress,
        itemsLoaded: itemsLoaded,
        totalItems: totalItems,
      );

      // Emit progress update
      _progressControllers[libraryId]?.add(_loadingProgress[libraryId]!);
    }
  }

  /// Cancel loading for a specific library
  void cancelLoading(String libraryId) {
    _progressControllers[libraryId]?.close();
    _progressControllers.remove(libraryId);
    _loadingProgress.remove(libraryId);
  }

  /// Cancel all background loading
  void cancelAllLoading() {
    for (final controller in _progressControllers.values) {
      controller.close();
    }
    _progressControllers.clear();
    _loadingProgress.clear();
  }

  /// Dispose resources
  void dispose() {
    cancelAllLoading();
  }
}

/// Status of library loading
enum LibraryLoadingStatus {
  loading,
  completed,
  failed,
}

/// Progress information for library loading
class LibraryLoadingProgress {
  final String libraryId;
  final String libraryName;
  final LibraryLoadingStatus status;
  final double progress; // 0.0 to 1.0
  final int itemsLoaded;
  final int totalItems;
  final bool isHighPriority;

  LibraryLoadingProgress({
    required this.libraryId,
    required this.libraryName,
    required this.status,
    required this.progress,
    required this.itemsLoaded,
    required this.totalItems,
    required this.isHighPriority,
  });

  LibraryLoadingProgress copyWith({
    String? libraryId,
    String? libraryName,
    LibraryLoadingStatus? status,
    double? progress,
    int? itemsLoaded,
    int? totalItems,
    bool? isHighPriority,
  }) {
    return LibraryLoadingProgress(
      libraryId: libraryId ?? this.libraryId,
      libraryName: libraryName ?? this.libraryName,
      status: status ?? this.status,
      progress: progress ?? this.progress,
      itemsLoaded: itemsLoaded ?? this.itemsLoaded,
      totalItems: totalItems ?? this.totalItems,
      isHighPriority: isHighPriority ?? this.isHighPriority,
    );
  }
}
