import 'package:audiobookshelf_flutter/database/folder_entity.dart';
import 'package:audiobookshelf_flutter/database/library_entity.dart';
import 'package:audiobookshelf_flutter/database/library_settings_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/series_item.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final libraryRepositoryProvider =
    FutureProvider<LibraryRepository>((ref) async {
  return LibraryRepository(await ref.watch(databaseProvider.future));
});

class LibraryRepository {
  final Isar _isar;

  LibraryRepository(this._isar);

  Future<List<LibraryEntity>> getLibrary() async {
    final List<LibraryEntity> libraryItems =
        await _isar.libraryEntitys.where().findAll();

    return libraryItems;
  }

  Future<void> saveLibraries(List<Library> libraries) async {
    for (int i = 0; i < libraries.length; i++) {
      final fetchedLibrary = libraries[i];
      LibraryEntity? existingLibrary = await _isar.libraryEntitys
          .where()
          .filter()
          .libraryIdEqualTo(fetchedLibrary.id)
          .findFirst();
      if (existingLibrary == null) {
        _isar.writeTxn(() {
          return _isar.libraryEntitys.put(LibraryEntity(
              libraryId: fetchedLibrary.id,
              name: fetchedLibrary.name,
              displayOrder: fetchedLibrary.displayOrder,
              icon: fetchedLibrary.icon,
              mediaType: fetchedLibrary.mediaType,
              folders: fetchedLibrary.folders
                  .map((folder) => FolderEntity(
                      folderId: folder.id,
                      addedAt:
                          DateTime.fromMillisecondsSinceEpoch(folder.addedAt),
                      fullPath: folder.fullPath,
                      libraryId: folder.libraryId))
                  .toList(),
              provider: fetchedLibrary.provider,
              settings: LibrarySettingsEntity()
                ..audiobooksOnly = fetchedLibrary.settings.audiobooksOnly
                ..autoScanCronExpression =
                    fetchedLibrary.settings.autoScanCronExpression
                ..coverAspectRatio = fetchedLibrary.settings.coverAspectRatio
                ..lastScan = fetchedLibrary.settings.lastScan
                ..lastUpdate = fetchedLibrary.settings.lastUpdate
                ..lastScanVersion = fetchedLibrary.settings.lastScanVersion
                ..hideSingleBookSeries =
                    fetchedLibrary.settings.hideSingleBookSeries
                ..disableWatcher = fetchedLibrary.settings.disableWatcher
                ..metadataPrecedence =
                    fetchedLibrary.settings.metadataPrecedence
                ..skipMatchingMediaWithAsin =
                    fetchedLibrary.settings.skipMatchingMediaWithAsin
                ..skipMatchingMediaWithIsbn =
                    fetchedLibrary.settings.skipMatchingMediaWithIsbn));
        });
      } else {
        if (fetchedLibrary.settings.lastUpdate != null &&
            fetchedLibrary.settings.lastUpdate! >
                (existingLibrary.settings?.lastUpdate ?? 0)) {
          existingLibrary.settings = LibrarySettingsEntity()
            ..coverAspectRatio = fetchedLibrary.settings.coverAspectRatio
            ..disableWatcher = fetchedLibrary.settings.disableWatcher
            ..skipMatchingMediaWithAsin =
                fetchedLibrary.settings.skipMatchingMediaWithAsin
            ..skipMatchingMediaWithIsbn =
                fetchedLibrary.settings.skipMatchingMediaWithIsbn
            ..autoScanCronExpression =
                fetchedLibrary.settings.autoScanCronExpression
            ..audiobooksOnly = fetchedLibrary.settings.audiobooksOnly
            ..hideSingleBookSeries =
                fetchedLibrary.settings.hideSingleBookSeries
            ..metadataPrecedence = fetchedLibrary.settings.metadataPrecedence
            ..lastScan = fetchedLibrary.settings.lastScan
            ..lastScanVersion = fetchedLibrary.settings.lastScanVersion
            ..createdAt = fetchedLibrary.settings.createdAt
            ..lastUpdate = fetchedLibrary.settings.lastUpdate;
          existingLibrary.folders = fetchedLibrary.folders
              .map((folder) => FolderEntity(
                  folderId: folder.id,
                  addedAt: DateTime.fromMillisecondsSinceEpoch(folder.addedAt),
                  fullPath: folder.fullPath,
                  libraryId: folder.libraryId))
              .toList();
          existingLibrary.icon = fetchedLibrary.icon;
          existingLibrary.mediaType = fetchedLibrary.mediaType;
          existingLibrary.name = fetchedLibrary.name;
          existingLibrary.provider = fetchedLibrary.provider;
          existingLibrary.displayOrder = fetchedLibrary.displayOrder;
          _isar.writeTxn(() => _isar.libraryEntitys.put(existingLibrary));
        }
      }
    }
  }
}
