import 'dart:convert';

import 'package:audiobookshelf_flutter/database/folder_entity.dart';
import 'package:audiobookshelf_flutter/database/library_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/library_settings_entity.dart';
import 'package:audiobookshelf_flutter/login_repository.dart';
import 'package:audiobookshelf_flutter/model/libraries/libraries_response.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_items_response.dart';
import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login/server_settings.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/database_provider.dart';
import 'package:audiobookshelf_flutter/provider/http_client_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final loginRepositoryProvider = Provider<LoginRepository>((ref) {
  return LoginRepository(
      ref.watch(httpClientProvider), ref.watch(serverAddressProvider));
});
final loginStateProvider =
    StateNotifierProvider<LoginStateNotifier, LoginState>((ref) {
  return LoginStateNotifier();
});

class LoginStateNotifier extends StateNotifier<LoginState> {
  LoginStateNotifier() : super(const LoginState.initial());
  void updateState(LoginState loginState) {
    state = loginState;
  }
}

final serverSettingsNotifierProvider =
    StateNotifierProvider<ServerSettingsNotifier, ServerSettings?>((ref) {
  return ServerSettingsNotifier(ref);
});

class ServerSettingsNotifier extends StateNotifier<ServerSettings?> {
  final Ref ref;

  ServerSettingsNotifier(this.ref) : super(null);
  ServerSettings loadServerSettings() {
    //todo load server settings from database
    return state!;
  }

  void updateServerSettings(ServerSettings serverSettings) {
    //todo save server settings to database
    state = serverSettings;
  }
}

final userModelNotifierProvider =
    StateNotifierProvider<UserModelNotifier, UserModel?>((ref) {
  return UserModelNotifier(ref);
});

class UserModelNotifier extends StateNotifier<UserModel?> {
  final Ref ref;

  UserModelNotifier(this.ref) : super(null);
  UserModel loadUserModel() {
    //todo load user model from database
    return state!;
  }

  void updateUserModel(UserModel userModel) async {
    //todo save user model to database
    state = userModel;
  }
}

Future<List<Library>> fetchLibraries(WidgetRef ref, UserModel userModel) async {
  final token = userModel.token;
  final fetchLibrariesResponse = await ref.read(httpClientProvider).get(
      Uri.parse(
          '${ref.read(serverAddressProvider)}/api/libraries?token=$token'));
  final responseBody = jsonDecode(fetchLibrariesResponse.body);
  final List<Library> libraries =
      LibrariesResponse.fromJson(responseBody).libraries;
  await _cacheLibraries(ref, libraries);
  int limit = 100;
  int offset = 0;
  LibraryItemsResponse library;
  do {
    library =
        await fetchLibrary(ref, userModel, libraries[0].id, limit, offset);
    offset += limit;
    await _cacheLibrary(ref, library);
  } while (library.results.length == limit);

  await _cacheMediaProgress(ref, userModel);
  return libraries;
}

Future<void> _cacheMediaProgress(WidgetRef ref, UserModel userModel) async {
  final Isar isar = await ref.read(databaseProvider.future);

  userModel.mediaProgress?.forEach((element) async {
    final LibraryItemEntity? cachedLibraryItem = await isar.libraryItemEntitys
        .where()
        .filter()
        .itemIdEqualTo(element.libraryItemId)
        .findFirst();

    if (cachedLibraryItem!.mediaProgress == null) {
      await isar.writeTxn(() async {
        isar.libraryItemEntitys.put(cachedLibraryItem
          ..mediaProgress = MediaProgressEntity(
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
              coverBytes: null));
      });
    } else {
      if ((element.lastUpdate ?? 0) >
          (cachedLibraryItem.mediaProgress?.lastUpdate ?? 0)) {
        final cachedMediaProgress = cachedLibraryItem.mediaProgress!;
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
        cachedLibraryItem.mediaProgress = cachedMediaProgress;
        isar.writeTxn(() => isar.libraryItemEntitys.put(cachedLibraryItem));
      }
    }
  });
}

Future<LibraryItemsResponse> fetchLibrary(WidgetRef ref, UserModel userModel,
    String libraryId, int limit, int offset) async {
  final token = userModel.token;
  final fetchLibraryItemsResponse = await ref.read(httpClientProvider).get(
      Uri.parse(
          '${ref.read(serverAddressProvider)}/api/libraries/$libraryId/items?limit=$limit&offset=$offset&minified=1&token=$token'));
  final responseBody = jsonDecode(fetchLibraryItemsResponse.body);
  final LibraryItemsResponse librariesResponse =
      LibraryItemsResponse.fromJson(responseBody);
  return librariesResponse;
}

Future<void> _cacheLibrary(WidgetRef ref, LibraryItemsResponse library) async {
  final Isar isar = await ref.read(databaseProvider.future);
  for (int i = 0; i < library.results.length; i++) {
    final fetchedLibrary = library.results[i];
    LibraryItemEntity? cachedLibraryItem = await isar.libraryItemEntitys
        .where()
        .filter()
        .itemIdEqualTo(fetchedLibrary.id)
        .findFirst();
    if (cachedLibraryItem != null) {
      if (cachedLibraryItem.updatedAt != null &&
          cachedLibraryItem.updatedAt! > (cachedLibraryItem.updatedAt ?? 0)) {
        cachedLibraryItem
          ..birthtimeMs = fetchedLibrary.birthtimeMs
          ..ctimeMs = fetchedLibrary.ctimeMs
          ..mtimeMs = fetchedLibrary.mtimeMs
          ..ino = fetchedLibrary.ino
          ..isFile = fetchedLibrary.isFile
          ..isMissing = fetchedLibrary.isMissing
          ..updatedAt = fetchedLibrary.updatedAt;
      }
    } else {
      isar.writeTxn(() {
        final libraryEntity = LibraryItemEntity(
            itemId: fetchedLibrary.id,
            mediaProgress: null,
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
            isMissing: fetchedLibrary.isMissing);
        return isar.libraryItemEntitys.put(libraryEntity);
      });
    }
  }
}

Future<void> _cacheLibraries(WidgetRef ref, List<Library> libraries) async {
  final Isar isar = await ref.read(databaseProvider.future);
  for (int i = 0; i < libraries.length; i++) {
    final fetchedLibrary = libraries[i];
    LibraryEntity? lib = await isar.libraryEntitys
        .where()
        .filter()
        .libraryIdEqualTo(fetchedLibrary.id)
        .findFirst();
    if (lib == null) {
      isar.writeTxn(() {
        return isar.libraryEntitys.put(LibraryEntity(
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
              ..metadataPrecedence = fetchedLibrary.settings.metadataPrecedence
              ..skipMatchingMediaWithAsin =
                  fetchedLibrary.settings.skipMatchingMediaWithAsin
              ..skipMatchingMediaWithIsbn =
                  fetchedLibrary.settings.skipMatchingMediaWithIsbn));
      });
    } else {
      if (fetchedLibrary.settings.lastUpdate != null &&
          fetchedLibrary.settings.lastUpdate! >
              (lib.settings?.lastUpdate ?? 0)) {
        lib.settings = LibrarySettingsEntity()
          ..coverAspectRatio = fetchedLibrary.settings.coverAspectRatio
          ..disableWatcher = fetchedLibrary.settings.disableWatcher
          ..skipMatchingMediaWithAsin =
              fetchedLibrary.settings.skipMatchingMediaWithAsin
          ..skipMatchingMediaWithIsbn =
              fetchedLibrary.settings.skipMatchingMediaWithIsbn
          ..autoScanCronExpression =
              fetchedLibrary.settings.autoScanCronExpression
          ..audiobooksOnly = fetchedLibrary.settings.audiobooksOnly
          ..hideSingleBookSeries = fetchedLibrary.settings.hideSingleBookSeries
          ..metadataPrecedence = fetchedLibrary.settings.metadataPrecedence
          ..lastScan = fetchedLibrary.settings.lastScan
          ..lastScanVersion = fetchedLibrary.settings.lastScanVersion
          ..createdAt = fetchedLibrary.settings.createdAt
          ..lastUpdate = fetchedLibrary.settings.lastUpdate;
        lib.folders = fetchedLibrary.folders
            .map((folder) => FolderEntity(
                folderId: folder.id,
                addedAt: DateTime.fromMillisecondsSinceEpoch(folder.addedAt),
                fullPath: folder.fullPath,
                libraryId: folder.libraryId))
            .toList();
        lib.icon = fetchedLibrary.icon;
        lib.mediaType = fetchedLibrary.mediaType;
        lib.name = fetchedLibrary.name;
        lib.provider = fetchedLibrary.provider;
        lib.displayOrder = fetchedLibrary.displayOrder;
        isar.writeTxn(() => isar.libraryEntitys.put(lib));
      }
    }
  }
}
