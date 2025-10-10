import 'dart:typed_data';
import 'package:audiobookshelf_flutter/services/author_image_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';

part 'author_image_provider.freezed.dart';
part 'author_image_provider.g.dart';

// State for author image loading
@freezed
sealed class AuthorImageState with _$AuthorImageState {
  const factory AuthorImageState.initial() = _Initial;
  const factory AuthorImageState.downloading() = _Downloading;
  const factory AuthorImageState.completed(Uint8List imageBytes) = _Completed;
  const factory AuthorImageState.error(String message) = _Error;
}

// Notifier for managing author image state
@riverpod
class AuthorImageNotifier extends _$AuthorImageNotifier {
  @override
  AuthorImageState build(String authorId) {
    // Watch the author image service
    final authorImageServiceAsync = ref.watch(authorImageServiceProvider);

    // Automatically check for cached image when service becomes available
    authorImageServiceAsync.whenData((authorImageService) {
      if (authorImageService != null) {
        WidgetsBinding.instance.addPostFrameCallback((_) {
          checkCachedImage(authorId);
        });
      }
    });

    return const AuthorImageState.initial();
  }

  // authorId is provided by the generated code
  Uint8List? get imageBytes =>
      state.maybeWhen(completed: (bytes) => bytes, orElse: () => null);
  bool get isCompleted => state is _Completed;
  bool get isDownloading => state is _Downloading;
  bool get hasError => state is _Error;

  /// Trigger image download
  Future<void> downloadImage() async {
    if (state is _Downloading) return; // Already downloading

    final authorImageServiceAsync = ref.read(authorImageServiceProvider);
    final authorImageService = authorImageServiceAsync.value;

    if (authorImageService == null) {
      return; // Don't set error state, just skip
    }

    state = const AuthorImageState.downloading();

    try {
      final imageBytes = await authorImageService.downloadAuthorImage(authorId);
      if (imageBytes != null) {
        state = AuthorImageState.completed(imageBytes);
      } else {
        state = const AuthorImageState.error('No image available');
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          '[AUTHOR_IMAGE_PROVIDER] Error downloading image for author $authorId: $e',
        );
      }
      state = AuthorImageState.error('Failed to download image: $e');
    }
  }

  /// Check if image is already cached
  Future<void> checkCachedImage(String authorId) async {
    final authorImageServiceAsync = ref.read(authorImageServiceProvider);
    final authorImageService = authorImageServiceAsync.value;

    if (authorImageService == null) {
      return;
    }

    try {
      final cachedBytes = await authorImageService.getCachedAuthorImage(
        authorId,
      );
      if (cachedBytes != null) {
        state = AuthorImageState.completed(cachedBytes);
      } else {
        // If no cached image, trigger download
        downloadImage();
      }
    } catch (e) {
      if (kDebugMode) {
        print(
          '[AUTHOR_IMAGE_PROVIDER] Error checking cached image for author $authorId: $e',
        );
      }
    }
  }
}

// Optimized provider for just the image bytes (autoDispose)
@riverpod
Uint8List? authorImageBytes(Ref ref, String authorId) {
  final state = ref.watch(authorImageProvider(authorId));
  return state.maybeWhen(completed: (bytes) => bytes, orElse: () => null);
}

// Optimized provider for image loading state
@riverpod
bool isAuthorImageLoading(Ref ref, String authorId) {
  final state = ref.watch(authorImageProvider(authorId));
  return state is _Downloading;
}

// Optimized provider for image error state
@riverpod
String? authorImageError(Ref ref, String authorId) {
  final state = ref.watch(authorImageProvider(authorId));
  return state.maybeWhen(error: (message) => message, orElse: () => null);
}
