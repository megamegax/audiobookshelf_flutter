import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for the cover image service
final coverImageServiceProvider = Provider<CoverImageService>((ref) {
  return CoverImageService(
    ref.watch(libraryServiceProvider),
    ref.read(libraryItemsRepositoryProvider.future),
  );
});

/// Service responsible for managing cover image downloads and caching
class CoverImageService {
  final LibraryService _libraryService;
  final Future<LibraryItemsRepository> _repository;

  // Cache for ongoing downloads to prevent duplicate requests
  final Map<String, Future<Uint8List?>> _downloadCache = {};

  CoverImageService(this._libraryService, this._repository);

  /// Downloads cover image for a library item and stores it in the database
  /// Returns the cover bytes if successful, null otherwise
  Future<Uint8List?> downloadAndCacheCover(
    LibraryItemNew item,
    UserModel userModel,
  ) async {
    final itemId = item.id;

    // Check if we already have a download in progress
    if (_downloadCache.containsKey(itemId)) {
      if (kDebugMode) {
        print('[COVER_SERVICE] Cover download already in progress for $itemId');
      }
      return await _downloadCache[itemId];
    }

    // Check if we already have the cover cached
    final repository = await _repository;
    final cachedItem = await repository.getBook(itemId);
    if (cachedItem?.media.coverBytes?.isNotEmpty == true) {
      if (kDebugMode) {
        print('[COVER_SERVICE] Cover already cached for $itemId');
      }
      return Uint8List.fromList(cachedItem!.media.coverBytes!);
    }

    // Start download
    final downloadFuture = _performCoverDownload(item, userModel);
    _downloadCache[itemId] = downloadFuture;

    try {
      final coverBytes = await downloadFuture;

      if (coverBytes != null && coverBytes.isNotEmpty) {
        // Update the item in database with cover bytes
        await _updateItemWithCover(item, coverBytes);

        if (kDebugMode) {
          print(
              '[COVER_SERVICE] Successfully downloaded and cached cover for ${item.media.metadata.title}');
        }
      }

      return coverBytes;
    } finally {
      // Remove from cache when done
      _downloadCache.remove(itemId);
    }
  }

  /// Performs the actual cover download
  Future<Uint8List?> _performCoverDownload(
    LibraryItemNew item,
    UserModel userModel,
  ) async {
    try {
      if (kDebugMode) {
        print(
            '[COVER_SERVICE] Downloading cover for ${item.media.metadata.title}');
      }

      final coverBytes = await _libraryService.fetchCover(item, userModel);

      if (coverBytes != null && coverBytes.isNotEmpty) {
        if (kDebugMode) {
          print(
              '[COVER_SERVICE] Downloaded ${coverBytes.length} bytes for ${item.media.metadata.title}');
        }
        return coverBytes;
      } else {
        if (kDebugMode) {
          print(
              '[COVER_SERVICE] No cover data received for ${item.media.metadata.title}');
        }
        return null;
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            '[COVER_SERVICE] Failed to download cover for ${item.media.metadata.title}: $e');
      }
      return null;
    }
  }

  /// Updates the library item in the database with the downloaded cover
  Future<void> _updateItemWithCover(
    LibraryItemNew item,
    Uint8List coverBytes,
  ) async {
    try {
      final repository = await _repository;

      // Create updated media with cover bytes
      final updatedMedia = item.media.copyWith(coverBytes: coverBytes);

      // Create updated item with new media
      final updatedItem = item.when(
        book: (id,
                ino,
                libraryId,
                folderId,
                path,
                relPath,
                isFile,
                mtimeMs,
                ctimeMs,
                birthtimeMs,
                addedAt,
                updatedAt,
                isMissing,
                isInvalid,
                mediaType,
                media,
                numFiles,
                size,
                collapsedSeries) =>
            LibraryItemNew.book(
          id: id,
          ino: ino,
          libraryId: libraryId,
          folderId: folderId,
          path: path,
          relPath: relPath,
          isFile: isFile,
          mtimeMs: mtimeMs,
          ctimeMs: ctimeMs,
          birthtimeMs: birthtimeMs,
          addedAt: addedAt,
          updatedAt: updatedAt,
          isMissing: isMissing,
          isInvalid: isInvalid,
          mediaType: mediaType,
          media: updatedMedia,
          numFiles: numFiles,
          size: size,
          collapsedSeries: collapsedSeries,
        ),
        podcast: (id,
                ino,
                libraryId,
                folderId,
                path,
                relPath,
                isFile,
                mtimeMs,
                ctimeMs,
                birthtimeMs,
                addedAt,
                updatedAt,
                isMissing,
                isInvalid,
                mediaType,
                media,
                numFiles,
                size,
                collapsedSeries) =>
            LibraryItemNew.podcast(
          id: id,
          ino: ino,
          libraryId: libraryId,
          folderId: folderId,
          path: path,
          relPath: relPath,
          isFile: isFile,
          mtimeMs: mtimeMs,
          ctimeMs: ctimeMs,
          birthtimeMs: birthtimeMs,
          addedAt: addedAt,
          updatedAt: updatedAt,
          isMissing: isMissing,
          isInvalid: isInvalid,
          mediaType: mediaType,
          media: updatedMedia,
          numFiles: numFiles,
          size: size,
          collapsedSeries: collapsedSeries,
        ),
      );

      // Save the updated item
      await repository.saveLibraryItems([updatedItem]);

      if (kDebugMode) {
        print(
            '[COVER_SERVICE] Updated database with cover for ${item.media.metadata.title}');
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            '[COVER_SERVICE] Failed to update database with cover for ${item.media.metadata.title}: $e');
      }
    }
  }

  /// Checks if a cover is already cached for the given item
  Future<bool> isCoverCached(String itemId) async {
    final repository = await _repository;
    final cachedItem = await repository.getBook(itemId);
    return cachedItem?.media.coverBytes?.isNotEmpty == true;
  }

  /// Clears the download cache (useful for cleanup)
  void clearDownloadCache() {
    _downloadCache.clear();
  }

  /// Gets the number of ongoing downloads
  int get ongoingDownloadsCount => _downloadCache.length;
}

