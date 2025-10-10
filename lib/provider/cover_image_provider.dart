import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/services/cover_image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'cover_image_provider.g.dart';

/// Provider for cover image state management
@riverpod
class CoverImageNotifier extends _$CoverImageNotifier {
  @override
  CoverImageState build() => const CoverImageState.initial();

  Future<CoverImageService> get _coverService =>
      ref.read(coverImageServiceProvider.future);

  /// Downloads cover for a specific item
  Future<void> downloadCover(String itemId) async {
    final userModel = ref.read(userModelProvider);
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
        'Item not provided - use downloadCoverForItem instead',
      );
    } catch (e) {
      state = CoverImageState.error('Failed to download cover: $e');
    }
  }

  /// Downloads cover for a specific library item
  Future<void> downloadCoverForItem(LibraryItemNew item) async {
    final userModel = ref.read(userModelProvider);
    if (kDebugMode) {
      print('[COVER_IMAGE_PROVIDER] User model: ${userModel?.username}');
    }
    if (userModel == null) {
      if (kDebugMode) {
        print(
          '[COVER_IMAGE_PROVIDER] User model is null, cannot download cover',
        );
      }
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
      final coverService = await _coverService;
      final coverBytes = await coverService.downloadAndCacheCover(
        item,
        userModel,
      );

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
    final coverService = await _coverService;
    return await coverService.isCoverCached(itemId);
  }

  /// Resets the state
  void reset() {
    state = const CoverImageState.initial();
  }

  /// Clears download cache
  Future<void> clearCache() async {
    final coverService = await _coverService;
    coverService.clearDownloadCache();
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
