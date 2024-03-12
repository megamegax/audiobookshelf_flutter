import 'package:audiobookshelf_flutter/database/collapsed_series_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/media_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/metadata_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/login/media_progress.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final libraryItemsRepositoryProvider =
    FutureProvider<LibraryRepository>((ref) async {
  return LibraryRepository(await ref.watch(databaseProvider.future));
});

class LibraryRepository {
  final Isar _isar;

  LibraryRepository(this._isar);
  Future<List<LibraryItemEntity>> getBooks(String libraryId) async {
    final List<LibraryItemEntity> libraryItems = await _isar.libraryItemEntitys
        .where()
        .filter()
        .libraryIdEqualTo(libraryId)
        .mediaTypeEqualTo("book")
        .findAll();

    return libraryItems;
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

  Future<void> saveLibraryItems(List<LibraryItem> libraryItems) async {
    for (int i = 0; i < libraryItems.length; i++) {
      final fetchedLibrary = libraryItems[i];
      LibraryItemEntity? cachedLibraryItem = await _isar.libraryItemEntitys
          .where()
          .filter()
          .itemIdEqualTo(fetchedLibrary.id)
          .findFirst();
      if (cachedLibraryItem != null) {
        if (cachedLibraryItem.updatedAt != null &&
            fetchedLibrary.updatedAt > (cachedLibraryItem.updatedAt!)) {
          cachedLibraryItem
            ..birthtimeMs = fetchedLibrary.birthtimeMs
            ..ctimeMs = fetchedLibrary.ctimeMs
            ..mtimeMs = fetchedLibrary.mtimeMs
            ..ino = fetchedLibrary.ino
            ..isFile = fetchedLibrary.isFile
            ..isMissing = fetchedLibrary.isMissing
            ..updatedAt = fetchedLibrary.updatedAt
            ..media = cachedLibraryItem.media
            ..birthtimeMs = fetchedLibrary.birthtimeMs
            ..ctimeMs = fetchedLibrary.ctimeMs
            ..mtimeMs = fetchedLibrary.mtimeMs
            ..numFiles = fetchedLibrary.numFiles
            ..size = fetchedLibrary.size
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
        }
      } else {
        _isar.writeTxn(() {
          final libraryEntity = LibraryItemEntity(
              itemId: fetchedLibrary.id,
              ino: fetchedLibrary.ino,
              libraryId: fetchedLibrary.libraryId,
              folderId: fetchedLibrary.folderId,
              path: fetchedLibrary.path,
              relPath: fetchedLibrary.relPath,
              isFile: fetchedLibrary.isFile,
              mtimeMs: fetchedLibrary.mtimeMs,
              ctimeMs: fetchedLibrary.ctimeMs,
              birthtimeMs: fetchedLibrary.birthtimeMs,
              addedAt: fetchedLibrary.addedAt,
              updatedAt: fetchedLibrary.updatedAt,
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
                      publishedDate:
                          fetchedLibrary.media.metadata.publishedDate,
                      publishedYear:
                          fetchedLibrary.media.metadata.publishedYear,
                      publisher: fetchedLibrary.media.metadata.publisher,
                      subtitle: fetchedLibrary.media.metadata.subtitle,
                      titleIgnorePrefix:
                          fetchedLibrary.media.metadata.titleIgnorePrefix,
                      explicit: fetchedLibrary.media.metadata.explicit),
                  numAudioFiles: fetchedLibrary.media.numAudioFiles,
                  numChapters: fetchedLibrary.media.numChapters,
                  numInvalidAudioFiles:
                      fetchedLibrary.media.numInvalidAudioFiles,
                  numMissingParts: fetchedLibrary.media.numMissingParts,
                  numTracks: fetchedLibrary.media.numTracks,
                  size: fetchedLibrary.media.size,
                  tags: fetchedLibrary.media.tags,
                  progress: null),
              numFiles: fetchedLibrary.numFiles,
              size: fetchedLibrary.size,
              collapsedSeries: fetchedLibrary.collapsedSeries == null
                  ? null
                  : CollapsedSeriesEntity(
                      name: fetchedLibrary.collapsedSeries!.name,
                      numBooks: fetchedLibrary.collapsedSeries!.numBooks,
                      nameIgnorePrefix:
                          fetchedLibrary.collapsedSeries!.nameIgnorePrefix,
                      id: cachedLibraryItem?.collapsedSeries!.id ?? "0",
                    ));
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
          .itemIdEqualTo(element.libraryItemId)
          .findFirst();
      if (cachedLibraryItem == null) break;
      if (cachedLibraryItem!.media.progress == null) {
        await _isar.writeTxn(() async {
          _isar.libraryItemEntitys.put(cachedLibraryItem
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
                finishedAt: element.finishedAt));
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
}
