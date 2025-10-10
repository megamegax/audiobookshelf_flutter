import 'package:audiobookshelf_flutter/database/collapsed_series_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/media_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/metadata_entity.dart';
import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:audiobookshelf_flutter/database/series_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/model/libraries/series_item.dart';
import 'package:audiobookshelf_flutter/model/login/media_progress.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar_community/isar.dart';

final libraryItemsRepositoryProvider = FutureProvider<LibraryItemsRepository>((
  ref,
) async {
  return LibraryItemsRepository(await ref.watch(databaseProvider.future));
});

class LibraryItemsRepository {
  final Isar _isar;

  LibraryItemsRepository(this._isar);
  Future<List<LibraryItemEntity>> getBooks(String libraryId) async {
    final List<LibraryItemEntity> libraryItems = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    return libraryItems;
  }

  /// Gets all books by library ID (for incremental sync)
  Future<List<LibraryItemEntity>> getBooksByLibraryId(String libraryId) async {
    final List<LibraryItemEntity> libraryItems = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .findAll();

    return libraryItems;
  }

  Future<LibraryItemEntity?> getBook(String itemId) async {
    final LibraryItemEntity? item = await _isar.libraryItemEntitys
        .where()
        .filter()
        .itemIdEqualTo(itemId)
        .findFirst();

    return item;
  }

  /// Generic method to get any library item by ID and library ID (works for books, podcasts, etc.)
  Future<LibraryItemEntity?> getBookByLibrary(
    String itemId,
    String libraryId,
  ) async {
    final LibraryItemEntity? item = await _isar.libraryItemEntitys
        .where()
        .filter()
        .itemIdEqualTo(itemId)
        .libraryIdEqualTo(libraryId)
        .findFirst();

    return item;
  }

  Future<List<LibraryItemEntity>> getPodcasts(String libraryId) async {
    final List<LibraryItemEntity> libraryItems = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("podcast")
        .findAll();

    return libraryItems;
  }

  Future<void> saveLibraryItems(List<LibraryItemNew> libraryItems) async {
    for (int i = 0; i < libraryItems.length; i++) {
      final fetchedLibrary = libraryItems[i];
      LibraryItemEntity? cachedLibraryItem = await _isar.libraryItemEntitys
          .where()
          .filter()
          .itemIdEqualTo(fetchedLibrary.id)
          .findFirst();
      if (cachedLibraryItem != null) {
        if (cachedLibraryItem.updatedAt != null &&
            (cachedLibraryItem.media.coverBytes == null ||
                (fetchedLibrary.updatedAt != null &&
                    fetchedLibrary.updatedAt! >
                        (cachedLibraryItem.updatedAt!)))) {
          cachedLibraryItem
            ..birthtimeMs = fetchedLibrary.birthtimeMs ?? 0
            ..ctimeMs = fetchedLibrary.ctimeMs ?? 0
            ..mtimeMs = fetchedLibrary.mtimeMs ?? 0
            ..ino = fetchedLibrary.ino ?? ''
            ..isFile = fetchedLibrary.isFile
            ..isMissing = fetchedLibrary.isMissing
            ..updatedAt = fetchedLibrary.updatedAt ?? 0
            ..media = MediaEntity(
              coverBytes: fetchedLibrary.media.coverBytes,
              coverPath: fetchedLibrary.media.coverPath,
              duration: fetchedLibrary.media.duration,
              ebookFileFormat: fetchedLibrary.media.ebookFileFormat,
              metadata: MetadataEntity(
                title: fetchedLibrary.media.metadata.title,
                authorName: fetchedLibrary.media.metadata.authorName,
                seriesName: fetchedLibrary.media.metadata.seriesName,
                asin: fetchedLibrary.media.metadata.asin,
                description: fetchedLibrary.media.metadata.description,
                genres: fetchedLibrary.media.metadata.genres,
                isbn: fetchedLibrary.media.metadata.isbn,
                language: fetchedLibrary.media.metadata.language,
                narratorName: fetchedLibrary.media.metadata.narratorName,
                publishedDate: fetchedLibrary.media.metadata.publishedDate,
                publishedYear: fetchedLibrary.media.metadata.publishedYear
                    ?.toString(),
                publisher: fetchedLibrary.media.metadata.publisher,
                subtitle: fetchedLibrary.media.metadata.subtitle,
                titleIgnorePrefix:
                    fetchedLibrary.media.metadata.titleIgnorePrefix,
                explicit: fetchedLibrary.media.metadata.explicit,
              ),
              numAudioFiles: fetchedLibrary.media.numAudioFiles,
              numChapters: fetchedLibrary.media.numChapters,
              numInvalidAudioFiles: fetchedLibrary.media.numInvalidAudioFiles,
              numMissingParts: fetchedLibrary.media.numMissingParts,
              numTracks: fetchedLibrary.media.numTracks,
              size: fetchedLibrary.media.size,
              tags: fetchedLibrary.media.tags,
              progress: null,
            )
            ..birthtimeMs = fetchedLibrary.birthtimeMs ?? 0
            ..ctimeMs = fetchedLibrary.ctimeMs ?? 0
            ..mtimeMs = fetchedLibrary.mtimeMs ?? 0
            ..numFiles = fetchedLibrary.numFiles ?? 0
            ..size = fetchedLibrary.size ?? 0
            ..isInvalid = fetchedLibrary.isInvalid
            ..mediaType = fetchedLibrary.mediaType
            ..path = fetchedLibrary.path
            ..relPath = fetchedLibrary.relPath
            ..folderId = fetchedLibrary.folderId
            ..libraryId = fetchedLibrary.libraryId
            ..itemId = fetchedLibrary.id
            ..collapsedSeries = fetchedLibrary.collapsedSeries == null
                ? null
                : CollapsedSeriesEntity(
                    name: fetchedLibrary.collapsedSeries!.name,
                    numBooks: fetchedLibrary.collapsedSeries!.numBooks,
                    nameIgnorePrefix:
                        fetchedLibrary.collapsedSeries!.nameIgnorePrefix,
                    id: cachedLibraryItem.collapsedSeries!.id ?? "0",
                  );
          _isar.writeTxn(() => _isar.libraryItemEntitys.put(cachedLibraryItem));
        }
      } else {
        _isar.writeTxn(() {
          final libraryEntity = LibraryItemEntity(
            itemId: fetchedLibrary.id,
            ino: fetchedLibrary.ino ?? '',
            libraryId: fetchedLibrary.libraryId,
            folderId: fetchedLibrary.folderId,
            path: fetchedLibrary.path,
            relPath: fetchedLibrary.relPath,
            isFile: fetchedLibrary.isFile,
            mtimeMs: fetchedLibrary.mtimeMs ?? 0,
            ctimeMs: fetchedLibrary.ctimeMs ?? 0,
            birthtimeMs: fetchedLibrary.birthtimeMs ?? 0,
            addedAt: fetchedLibrary.addedAt ?? 0,
            updatedAt: fetchedLibrary.updatedAt ?? 0,
            isMissing: fetchedLibrary.isMissing,
            isInvalid: fetchedLibrary.isInvalid,
            mediaType: fetchedLibrary.mediaType,
            media: MediaEntity(
              coverBytes: null,
              coverPath: fetchedLibrary.media.coverPath,
              duration: fetchedLibrary.media.duration,
              ebookFileFormat: fetchedLibrary.media.ebookFileFormat,
              metadata: MetadataEntity(
                title: fetchedLibrary.media.metadata.title,
                authorName: fetchedLibrary.media.metadata.authorName,
                seriesName: fetchedLibrary.media.metadata.seriesName,
                asin: fetchedLibrary.media.metadata.asin,
                description: fetchedLibrary.media.metadata.description,
                genres: fetchedLibrary.media.metadata.genres,
                isbn: fetchedLibrary.media.metadata.isbn,
                language: fetchedLibrary.media.metadata.language,
                narratorName: fetchedLibrary.media.metadata.narratorName,
                publishedDate: fetchedLibrary.media.metadata.publishedDate,
                publishedYear: fetchedLibrary.media.metadata.publishedYear
                    ?.toString(),
                publisher: fetchedLibrary.media.metadata.publisher,
                subtitle: fetchedLibrary.media.metadata.subtitle,
                titleIgnorePrefix:
                    fetchedLibrary.media.metadata.titleIgnorePrefix,
                explicit: fetchedLibrary.media.metadata.explicit,
              ),
              numAudioFiles: fetchedLibrary.media.numAudioFiles,
              numChapters: fetchedLibrary.media.numChapters,
              numInvalidAudioFiles: fetchedLibrary.media.numInvalidAudioFiles,
              numMissingParts: fetchedLibrary.media.numMissingParts,
              numTracks: fetchedLibrary.media.numTracks,
              size: fetchedLibrary.media.size,
              tags: fetchedLibrary.media.tags,
              progress: null,
            ),
            numFiles: fetchedLibrary.numFiles ?? 0,
            size: fetchedLibrary.size ?? 0,
            collapsedSeries: fetchedLibrary.collapsedSeries == null
                ? null
                : CollapsedSeriesEntity(
                    name: fetchedLibrary.collapsedSeries!.name,
                    numBooks: fetchedLibrary.collapsedSeries!.numBooks,
                    nameIgnorePrefix:
                        fetchedLibrary.collapsedSeries!.nameIgnorePrefix,
                    id: cachedLibraryItem?.collapsedSeries!.id ?? "0",
                  ),
          );
          return _isar.libraryItemEntitys.put(libraryEntity);
        });
      }
    }
  }

  Future<void> saveMediaProgresses(UserModel userModel) async {
    for (int i = 0; i < userModel.mediaProgress!.length; i++) {
      final MediaProgress element = userModel.mediaProgress![i];
      final LibraryItemEntity? cachedLibraryItem = await _isar
          .libraryItemEntitys
          .where()
          .filter()
          .itemIdEqualTo(element.libraryItemId!)
          .findFirst();
      if (cachedLibraryItem == null) {
        continue;
      }
      if (cachedLibraryItem.media.progress == null) {
        await _isar.writeTxn(() async {
          _isar.libraryItemEntitys.put(
            cachedLibraryItem
              ..media.progress = MediaProgressEntity(
                itemId: element.libraryItemId,
                progress: element.progress,
                duration: element.duration,
                currentTime: element.currentTime,
                mediaItemType: element.mediaItemType,
                isFinished: element.isFinished,
                hideFromContinueListening: element.hideFromContinueListening,
                ebookProgress: element.ebookProgress,
                lastUpdate: element.lastUpdate,
                startedAt: element.startedAt,
                finishedAt: element.finishedAt,
              ),
          );
        });
      } else {
        if ((element.lastUpdate ?? 0) >
            (cachedLibraryItem.media.progress?.lastUpdate ?? 0)) {
          final cachedMediaProgress = cachedLibraryItem.media.progress!;
          cachedMediaProgress.progress = element.progress;
          cachedMediaProgress.duration = element.duration;
          cachedMediaProgress.currentTime = element.currentTime;
          cachedMediaProgress.mediaItemType = element.mediaItemType;
          cachedMediaProgress.isFinished = element.isFinished;
          cachedMediaProgress.hideFromContinueListening =
              element.hideFromContinueListening;
          cachedMediaProgress.ebookProgress = element.ebookProgress;
          cachedMediaProgress.lastUpdate = element.lastUpdate;
          cachedMediaProgress.startedAt = element.startedAt;
          cachedMediaProgress.finishedAt = element.finishedAt;
          cachedLibraryItem.media.progress = cachedMediaProgress;
          _isar.writeTxn(() => _isar.libraryItemEntitys.put(cachedLibraryItem));
        }
      }
    }
  }

  //todo handle series
  Future<Series?> getSeriesItem(String seriesId) async {
    final SeriesItemEntity? series = await _isar.seriesItemEntitys
        .where()
        .filter()
        .seriesIdEqualTo(seriesId)
        .findFirst();
    if (series == null) return null;
    return Series(
      addedAt: series.addedAt,
      description: series.description,
      id: series.id,
      name: series.name,
      nameIgnorePrefix: series.nameIgnorePrefix,
      updatedAt: series.updatedAt,
      seriesId: series.seriesId!,
      bookIds: series.books,
    );
  }

  Future<List<Series>> getSeries(String libraryId) async {
    // Get all series items
    final List<SeriesItemEntity> allSeriesItems = await _isar.seriesItemEntitys
        .where()
        .findAll();

    // Filter series that have books in the specified library
    final List<Series> series = [];
    for (final seriesItem in allSeriesItems) {
      // Get books for this series
      final books = await Future.wait(
        seriesItem.books.map((bookId) async => await getBook(bookId)),
      );

      // Filter out null books and check if any book belongs to the library
      final validBooks = books
          .where((book) => book != null)
          .cast<LibraryItemEntity>();
      final booksInLibrary = validBooks.where(
        (book) => book.libraryId == libraryId,
      );

      if (booksInLibrary.isNotEmpty) {
        series.add(
          Series(
            addedAt: seriesItem.addedAt,
            description: seriesItem.description,
            id: seriesItem.id,
            name: seriesItem.name,
            nameIgnorePrefix: seriesItem.nameIgnorePrefix,
            updatedAt: seriesItem.updatedAt,
            seriesId: seriesItem.seriesId!,
            bookIds: booksInLibrary.map((book) => book.id.toString()).toList(),
          ),
        );
      }
    }

    return series;
  }

  /// Gets all series items from the database (for debugging)
  Future<List<SeriesItemEntity>> getAllSeriesItems() async {
    return await _isar.seriesItemEntitys.where().findAll();
  }

  void saveSeriesItems(List<SeriesItem> seriesItems) async {
    for (int i = 0; i < seriesItems.length; i++) {
      SeriesItem seriesItem = seriesItems[i];
      SeriesItemEntity? existingSeriesItem = await _isar.seriesItemEntitys
          .where()
          .filter()
          .seriesIdEqualTo(seriesItem.id)
          .findFirst();

      if (existingSeriesItem == null) {
        _isar.writeTxn(() {
          return _isar.seriesItemEntitys.put(
            SeriesItemEntity(
              seriesId: seriesItem.id,
              name: seriesItem.name,
              nameIgnorePrefix: seriesItem.nameIgnorePrefix,
              addedAt: seriesItem.addedAt,
              updatedAt: seriesItem.updatedAt,
              description: seriesItem.description,
              books: seriesItem.books.map((e) => e.id).toList(),
            ),
          );
        });
      } else {
        if ((seriesItem.updatedAt ?? 0) > (existingSeriesItem.updatedAt ?? 0)) {
          existingSeriesItem
            ..name = seriesItem.name
            ..nameIgnorePrefix = seriesItem.nameIgnorePrefix
            ..addedAt = seriesItem.addedAt
            ..updatedAt = seriesItem.updatedAt
            ..description = seriesItem.description
            ..books = seriesItem.books.map((e) => e.id).toList();
          _isar.writeTxn(() => _isar.seriesItemEntitys.put(existingSeriesItem));
        }
      }
    }
  }

  /// Deletes a book by item ID
  Future<void> deleteBook(String itemId) async {
    await _isar.writeTxn(() async {
      await _isar.libraryItemEntitys
          .where()
          .filter()
          .itemIdEqualTo(itemId)
          .deleteAll();
    });
  }

  /// Gets the last sync timestamp for a library
  Future<int?> getLastSyncTimestamp(String libraryId) async {
    // For now, we'll use a simple approach by getting the latest updatedAt
    // In a real implementation, you'd have a separate sync tracking table
    final latestItem = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .sortByUpdatedAtDesc()
        .findFirst();

    return latestItem?.updatedAt;
  }

  /// Updates the last sync timestamp for a library
  Future<void> updateLastSyncTimestamp(String libraryId, int timestamp) async {
    // For now, this is a placeholder
    // In a real implementation, you'd store this in a separate sync tracking table
  }

  /// Search books by author name in local database
  Future<List<LibraryItemEntity>> searchBooksByAuthor(
    String libraryId,
    String authorName,
  ) async {
    final List<LibraryItemEntity> books = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    // Filter by author name (case-insensitive)
    return books.where((book) {
      final metadata = book.media.metadata;
      if (metadata == null) return false;

      final author = metadata.authorName?.toLowerCase() ?? '';
      final searchAuthor = authorName.toLowerCase();

      return author.contains(searchAuthor);
    }).toList();
  }

  /// Search books by title in local database
  Future<List<LibraryItemEntity>> searchBooksByTitle(
    String libraryId,
    String title,
  ) async {
    final List<LibraryItemEntity> books = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    // Filter by title (case-insensitive)
    return books.where((book) {
      final metadata = book.media.metadata;
      if (metadata == null) return false;

      final bookTitle = metadata.title?.toLowerCase() ?? '';
      final searchTitle = title.toLowerCase();

      return bookTitle.contains(searchTitle);
    }).toList();
  }

  /// Search books by narrator name in local database
  Future<List<LibraryItemEntity>> searchBooksByNarrator(
    String libraryId,
    String narratorName,
  ) async {
    final List<LibraryItemEntity> books = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    // Filter by narrator name (case-insensitive)
    return books.where((book) {
      final metadata = book.media.metadata;
      if (metadata == null) return false;

      final narrator = metadata.narratorName?.toLowerCase() ?? '';
      final searchNarrator = narratorName.toLowerCase();

      return narrator.contains(searchNarrator);
    }).toList();
  }

  /// Search books by series name in local database
  Future<List<LibraryItemEntity>> searchBooksBySeries(
    String libraryId,
    String seriesName,
  ) async {
    final List<LibraryItemEntity> books = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    // Filter by series name (case-insensitive)
    return books.where((book) {
      final metadata = book.media.metadata;
      if (metadata == null) return false;

      final series = metadata.seriesName?.toLowerCase() ?? '';
      final searchSeries = seriesName.toLowerCase();

      return series.contains(searchSeries);
    }).toList();
  }

  /// General search in local database
  Future<List<LibraryItemEntity>> searchBooks(
    String libraryId,
    String query,
  ) async {
    final List<LibraryItemEntity> books = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    if (query.isEmpty) return books;

    final searchQuery = query.toLowerCase();

    // Filter by title, author, narrator, or series (case-insensitive)
    return books.where((book) {
      final metadata = book.media.metadata;
      if (metadata == null) return false;

      final title = metadata.title?.toLowerCase() ?? '';
      final author = metadata.authorName?.toLowerCase() ?? '';
      final narrator = metadata.narratorName?.toLowerCase() ?? '';
      final series = metadata.seriesName?.toLowerCase() ?? '';

      return title.contains(searchQuery) ||
          author.contains(searchQuery) ||
          narrator.contains(searchQuery) ||
          series.contains(searchQuery);
    }).toList();
  }
}
