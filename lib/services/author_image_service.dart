import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/repositories/authors_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorImageService {
  final LibraryService _libraryService;
  final AuthorsRepository _authorsRepository;
  final UserModel _userModel;

  AuthorImageService({
    required LibraryService libraryService,
    required AuthorsRepository authorsRepository,
    required UserModel userModel,
  })  : _libraryService = libraryService,
        _authorsRepository = authorsRepository,
        _userModel = userModel;

  /// Download and cache author image
  Future<Uint8List?> downloadAuthorImage(String authorId) async {
    try {
      if (kDebugMode) {
        print('[AUTHOR_IMAGE_SERVICE] Downloading image for author: $authorId');
      }

      // Check if image is already cached
      final author = await _authorsRepository.getAuthorById(authorId);
      if (author?.imageBytes?.isNotEmpty == true) {
        if (kDebugMode) {
          print(
              '[AUTHOR_IMAGE_SERVICE] Image already cached for author: $authorId');
        }
        return Uint8List.fromList(author!.imageBytes!);
      }

      // Check if author has an imagePath
      if (author?.imagePath == null || author!.imagePath!.isEmpty) {
        if (kDebugMode) {
          print('[AUTHOR_IMAGE_SERVICE] Author $authorId has no imagePath');
        }
        return null;
      }

      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_SERVICE] Author $authorId has imagePath: ${author.imagePath}');
      }

      // Download image from server
      final imageBytes =
          await _libraryService.fetchAuthorImage(authorId, _userModel);
      if (imageBytes != null && imageBytes.isNotEmpty) {
        // Validate image bytes before saving
        try {
          // Try to create a MemoryImage to validate the bytes
          MemoryImage(imageBytes);

          // Save to database
          await _authorsRepository.saveAuthorImage(authorId, imageBytes);
          if (kDebugMode) {
            print(
                '[AUTHOR_IMAGE_SERVICE] Downloaded and cached image for author: $authorId');
          }
          return imageBytes;
        } catch (e) {
          if (kDebugMode) {
            print(
                '[AUTHOR_IMAGE_SERVICE] Invalid image bytes for author $authorId: $e');
          }
          return null;
        }
      }

      if (kDebugMode) {
        print('[AUTHOR_IMAGE_SERVICE] No image found for author: $authorId');
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_SERVICE] Error downloading image for author $authorId: $e');
      }
      return null;
    }
  }

  /// Get cached author image
  Future<Uint8List?> getCachedAuthorImage(String authorId) async {
    try {
      final author = await _authorsRepository.getAuthorById(authorId);
      if (author?.imageBytes?.isNotEmpty == true) {
        final imageBytes = Uint8List.fromList(author!.imageBytes!);

        // Validate the cached image bytes
        try {
          MemoryImage(imageBytes);
          return imageBytes;
        } catch (e) {
          if (kDebugMode) {
            print(
                '[AUTHOR_IMAGE_SERVICE] Corrupted cached image for author $authorId: $e');
          }
          // Clear the corrupted image from database
          await _authorsRepository.saveAuthorImage(authorId, []);
          return null;
        }
      }
      return null;
    } catch (e) {
      if (kDebugMode) {
        print(
            '[AUTHOR_IMAGE_SERVICE] Error getting cached image for author $authorId: $e');
      }
      return null;
    }
  }
}

// Provider for AuthorImageService
final authorImageServiceProvider =
    FutureProvider<AuthorImageService>((ref) async {
  final libraryService = ref.read(libraryServiceProvider);
  final authorsRepository = await ref.read(authorsRepositoryProvider.future);
  final userModel = ref.read(userModelNotifierProvider)!;

  return AuthorImageService(
    libraryService: libraryService,
    authorsRepository: authorsRepository,
    userModel: userModel,
  );
});
