import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

class AuthorsRepository {
  final Isar _isar;

  AuthorsRepository(this._isar);

  Future<void> saveAuthor(AuthorEntity author) async {
    await _isar.writeTxn(() async {
      await _isar.authorEntitys.put(author);
    });
  }

  Future<void> saveAuthors(List<AuthorEntity> authors) async {
    await _isar.writeTxn(() async {
      for (final author in authors) {
        // Check if author already exists
        final existingAuthor = await _isar.authorEntitys
            .filter()
            .authorIdEqualTo(author.authorId)
            .findFirst();
        
        if (existingAuthor != null) {
          // Update existing author with new data
          existingAuthor.name = author.name;
          existingAuthor.nameIgnorePrefix = author.nameIgnorePrefix;
          existingAuthor.description = author.description;
          existingAuthor.imagePath = author.imagePath;
          existingAuthor.addedAt = author.addedAt;
          existingAuthor.updatedAt = author.updatedAt;
          existingAuthor.bookCount = author.bookCount;
          existingAuthor.seriesCount = author.seriesCount;
          // Keep existing imageBytes if new one is null/empty
          if (author.imageBytes != null && author.imageBytes!.isNotEmpty) {
            existingAuthor.imageBytes = author.imageBytes;
          }
          await _isar.authorEntitys.put(existingAuthor);
        } else {
          // Insert new author
          await _isar.authorEntitys.put(author);
        }
      }
    });
  }

  Future<List<AuthorEntity>> getAllAuthors() async {
    return await _isar.authorEntitys.where().findAll();
  }

  Future<AuthorEntity?> getAuthorById(String authorId) async {
    return await _isar.authorEntitys
        .filter()
        .authorIdEqualTo(authorId)
        .findFirst();
  }

  Future<List<AuthorEntity>> getAuthorsByLibraryId(String libraryId) async {
    // For now, we'll get all authors since the API doesn't filter by library
    // In the future, we might need to add a libraryId field to AuthorEntity
    return await _isar.authorEntitys.where().findAll();
  }

  Future<void> saveAuthorImage(String authorId, List<int> imageBytes) async {
    await _isar.writeTxn(() async {
      final author = await _isar.authorEntitys
          .filter()
          .authorIdEqualTo(authorId)
          .findFirst();
      if (author != null) {
        author.imageBytes = imageBytes;
        await _isar.authorEntitys.put(author);
      }
    });
  }

  Future<void> deleteAuthor(String authorId) async {
    await _isar.writeTxn(() async {
      await _isar.authorEntitys
          .filter()
          .authorIdEqualTo(authorId)
          .deleteFirst();
    });
  }

  Future<void> clearAllAuthors() async {
    await _isar.writeTxn(() async {
      await _isar.authorEntitys.clear();
    });
  }
}

final authorsRepositoryProvider =
    FutureProvider<AuthorsRepository>((ref) async {
  return AuthorsRepository(await ref.watch(databaseProvider.future));
});
