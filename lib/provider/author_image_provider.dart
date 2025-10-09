import 'package:audiobookshelf_flutter/services/author_image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'author_image_provider.freezed.dart';

// State for author image loading
@freezed
class AuthorImageState with _$AuthorImageState {
  const factory AuthorImageState.initial() = _Initial;
  const factory AuthorImageState.downloading() = _Downloading;
  const factory AuthorImageState.completed(Uint8List imageBytes) = _Completed;
  const factory AuthorImageState.error(String message) = _Error;
}

// Notifier for managing author image state
class AuthorImageNotifier extends StateNotifier<AuthorImageState> {
  final AuthorImageService? _authorImageService;
  final String _authorId;

  AuthorImageNotifier(this._authorImageService, this._authorId)
      : super(const AuthorImageState.initial());

  String get authorId => _authorId;
  Uint8List? get imageBytes => state.maybeWhen(
        completed: (bytes) => bytes,
        orElse: () => null,
      );
  bool get isCompleted => state is _Completed;
  bool get isDownloading => state is _Downloading;
  bool get hasError => state is _Error;

  /// Trigger image download
  Future<void> downloadImage() async {
    if (state is _Downloading) return; // Already downloading
    if (_authorImageService == null) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_PROVIDER] Service not available for author $_authorId, skipping download');
      }
      return; // Don't set error state, just skip
    }

    state = const AuthorImageState.downloading();

    try {
      final imageBytes =
          await _authorImageService.downloadAuthorImage(_authorId);
      if (imageBytes != null) {
        state = AuthorImageState.completed(imageBytes);
      } else {
        state = const AuthorImageState.error('No image available');
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_PROVIDER] Error downloading image for author $_authorId: $e');
      }
      state = AuthorImageState.error('Failed to download image: $e');
    }
  }

  /// Check if image is already cached
  Future<void> checkCachedImage() async {
    if (_authorImageService == null) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_PROVIDER] Service not available for author $_authorId, skipping cache check');
      }
      return;
    }

    try {
      final cachedBytes =
          await _authorImageService.getCachedAuthorImage(_authorId);
      if (cachedBytes != null) {
        state = AuthorImageState.completed(cachedBytes);
      } else {
        // If no cached image, trigger download
        downloadImage();
      }
    } catch (e) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_PROVIDER] Error checking cached image for author $_authorId: $e');
      }
    }
  }
}

// Provider for author image state
final authorImageProvider =
    StateNotifierProvider.family<AuthorImageNotifier, AuthorImageState, String>(
        (ref, authorId) {
  final authorImageServiceAsync = ref.watch(authorImageServiceProvider);
  return authorImageServiceAsync.when(
    data: (authorImageService) {
      final notifier = AuthorImageNotifier(authorImageService, authorId);
      // Automatically check for cached image when service becomes available
      WidgetsBinding.instance.addPostFrameCallback((_) {
        notifier.checkCachedImage();
      });
      return notifier;
    },
    loading: () => AuthorImageNotifier(null, authorId),
    error: (_, __) => AuthorImageNotifier(null, authorId),
  );
});
