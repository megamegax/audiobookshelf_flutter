import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/cover_image_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

/// Provider for cover image state management
final coverImageProvider =
    StateNotifierProvider<CoverImageNotifier, CoverImageState>((ref) {
  return CoverImageNotifier(ref);
});

/// State notifier for managing cover image downloads and state
class CoverImageNotifier extends StateNotifier<CoverImageState> {
  final Ref _ref;
  final CoverImageService _coverService;

  CoverImageNotifier(this._ref)
      : _coverService = _ref.read(coverImageServiceProvider),
        super(const CoverImageState.initial());

  /// Downloads cover for a specific item
  Future<void> downloadCover(String itemId) async {
    final userModel = _ref.read(userModelNotifierProvider);
    if (userModel == null) {
      state = const CoverImageState.error('User not logged in');
      return;
    }

    // Check if already downloading
    if (state is _Downloading && (state as _Downloading).itemId == itemId) {
      return;
    }

    state = CoverImageState.downloading(itemId);

    try {
      // We need to get the item from somewhere - this is a limitation
      // In practice, this would be called from BookCard with the full item
      state = const CoverImageState.error(
          'Item not provided - use downloadCoverForItem instead');
    } catch (e) {
      state = CoverImageState.error('Failed to download cover: $e');
    }
  }

  /// Downloads cover for a specific library item
  Future<void> downloadCoverForItem(LibraryItemNew item) async {
    final userModel = _ref.read(userModelNotifierProvider);
    if (userModel == null) {
      state = const CoverImageState.error('User not logged in');
      return;
    }

    final itemId = item.id;

    // Check if already downloading this item
    if (state is _Downloading && (state as _Downloading).itemId == itemId) {
      return;
    }

    state = CoverImageState.downloading(itemId);

    try {
      final coverBytes =
          await _coverService.downloadAndCacheCover(item, userModel);

      if (coverBytes != null && coverBytes.isNotEmpty) {
        state = CoverImageState.completed(itemId, coverBytes);
      } else {
        state = CoverImageState.error('No cover data received');
      }
    } catch (e) {
      state = CoverImageState.error('Failed to download cover: $e');
    }
  }

  /// Checks if cover is cached for an item
  Future<bool> isCoverCached(String itemId) async {
    return await _coverService.isCoverCached(itemId);
  }

  /// Resets the state
  void reset() {
    state = const CoverImageState.initial();
  }

  /// Clears download cache
  void clearCache() {
    _coverService.clearDownloadCache();
  }
}

/// State for cover image operations
sealed class CoverImageState {
  const CoverImageState();

  const factory CoverImageState.initial() = _Initial;
  const factory CoverImageState.downloading(String itemId) = _Downloading;
  const factory CoverImageState.completed(String itemId, Uint8List coverBytes) =
      _Completed;
  const factory CoverImageState.error(String message) = _Error;

  /// Gets the item ID if available
  String? get itemId {
    return switch (this) {
      _Downloading(itemId: final id) => id,
      _Completed(itemId: final id, coverBytes: _) => id,
      _ => null,
    };
  }

  /// Gets the cover bytes if available
  Uint8List? get coverBytes {
    return switch (this) {
      _Completed(itemId: _, coverBytes: final bytes) => bytes,
      _ => null,
    };
  }

  /// Checks if the state is completed
  bool get isCompleted => this is _Completed;

  /// Checks if the state is downloading
  bool get isDownloading => this is _Downloading;

  /// Checks if the state has an error
  bool get hasError => this is _Error;
}

class _Initial extends CoverImageState {
  const _Initial();
}

class _Downloading extends CoverImageState {
  final String itemId;
  const _Downloading(this.itemId);
}

class _Completed extends CoverImageState {
  final String itemId;
  final Uint8List coverBytes;
  const _Completed(this.itemId, this.coverBytes);
}

class _Error extends CoverImageState {
  final String message;
  const _Error(this.message);
}
