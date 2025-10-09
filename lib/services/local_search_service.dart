import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final localSearchServiceProvider = Provider<LocalSearchService>((ref) {
  return LocalSearchService();
});

class LocalSearchService {
  /// Search books by author name in local database
  Future<List<LibraryItemEntity>> searchBooksByAuthor(
      LibraryItemsRepository repository,
      String libraryId,
      String authorName) async {
    return await repository.searchBooksByAuthor(libraryId, authorName);
  }

  /// Search books by title in local database
  Future<List<LibraryItemEntity>> searchBooksByTitle(
      LibraryItemsRepository repository, String libraryId, String title) async {
    return await repository.searchBooksByTitle(libraryId, title);
  }

  /// Search books by narrator name in local database
  Future<List<LibraryItemEntity>> searchBooksByNarrator(
      LibraryItemsRepository repository,
      String libraryId,
      String narratorName) async {
    return await repository.searchBooksByNarrator(libraryId, narratorName);
  }

  /// Search books by series name in local database
  Future<List<LibraryItemEntity>> searchBooksBySeries(
      LibraryItemsRepository repository,
      String libraryId,
      String seriesName) async {
    return await repository.searchBooksBySeries(libraryId, seriesName);
  }

  /// General search in local database
  Future<List<LibraryItemEntity>> searchBooks(
      LibraryItemsRepository repository, String libraryId, String query) async {
    return await repository.searchBooks(libraryId, query);
  }

  /// Advanced search with multiple filters
  Future<List<LibraryItemEntity>> advancedSearch({
    required LibraryItemsRepository repository,
    required String libraryId,
    String? query,
    List<String>? authors,
    List<String>? narrators,
    List<String>? series,
    List<String>? genres,
    int? limit,
  }) async {
    List<LibraryItemEntity> results = [];

    // If specific authors are provided, search by authors
    if (authors != null && authors.isNotEmpty) {
      for (final author in authors) {
        final authorBooks =
            await repository.searchBooksByAuthor(libraryId, author);
        results.addAll(authorBooks);
      }
    }
    // If specific narrators are provided, search by narrators
    else if (narrators != null && narrators.isNotEmpty) {
      for (final narrator in narrators) {
        final narratorBooks =
            await repository.searchBooksByNarrator(libraryId, narrator);
        results.addAll(narratorBooks);
      }
    }
    // If specific series are provided, search by series
    else if (series != null && series.isNotEmpty) {
      for (final seriesName in series) {
        final seriesBooks =
            await repository.searchBooksBySeries(libraryId, seriesName);
        results.addAll(seriesBooks);
      }
    }
    // If query is provided, do general search
    else if (query != null && query.isNotEmpty) {
      results = await repository.searchBooks(libraryId, query);
    }
    // If no specific filters, get all books
    else {
      results = await repository.getBooks(libraryId);
    }

    // Remove duplicates based on itemId
    final uniqueResults = <String, LibraryItemEntity>{};
    for (final book in results) {
      uniqueResults[book.itemId] = book;
    }

    final finalResults = uniqueResults.values.toList();

    // Apply limit if specified
    if (limit != null && limit > 0) {
      return finalResults.take(limit).toList();
    }

    return finalResults;
  }
}
