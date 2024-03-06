import 'dart:convert';

import 'package:audiobookshelf_flutter/database/folder_entity.dart';
import 'package:audiobookshelf_flutter/database/library_entity.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/library_settings_entity.dart';
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
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:isar/isar.dart';

final serverSettingsNotifierProvider =
    StateNotifierProvider<ServerSettingsNotifier, ServerSettings?>((ref) {
  return ServerSettingsNotifier(ref);
});

class ServerSettingsNotifier extends StateNotifier<ServerSettings?> {
  final Ref ref;

  ServerSettingsNotifier(this.ref) : super(null);

  void updateServerSettings(ServerSettings serverSettings) {
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

  void updateUserModel(UserModel userModel) async {
    state = userModel;
  }
}

Future<LibraryItemEntity?> checkCache(Isar isar, String itemId) async {
  return await isar.libraryItemEntitys
      .where()
      .filter()
      .itemIdEqualTo(itemId)
      .findFirst();
}

final loginNotifierProvider =
    StateNotifierProvider<LoginNotifier, LoginState>((ref) {
  return LoginNotifier(ref);
});

class LoginNotifier extends StateNotifier<LoginState> {
  final Ref ref;

  LoginNotifier(this.ref) : super(const LoginState.initial());

  void handleLogin(LoginState loginState) {
    state = loginState;
  }
}

Future<LoginState> login(
    AutoDisposeFutureProviderRef ref, String username, String password) async {
  if (username.isEmpty || password.isEmpty) {
    return LoginState.error('Username and password must not be empty');
  }
  try {
    final response = await ref.read(httpClientProvider).post(
      Uri.parse('${ref.read(serverAddressProvider)}/login'),
      body: {
        "username": username,
        "password": password,
      },
    );
    final responseBody = jsonDecode(response.body);
    final loginResponse = LoginResponse.fromJson(responseBody);
    return LoginState.success(loginResponse);
  } catch (e) {
    return LoginState.error(e.toString());
  }
}

Future<List<Library>> fetchLibraries(Ref ref, UserModel userModel) async {
  final token = userModel.token;
  final fetchLibrariesResponse = await ref.read(httpClientProvider).get(
      Uri.parse(
          '${ref.read(serverAddressProvider)}/api/libraries?token=$token'));
  final responseBody = jsonDecode(fetchLibrariesResponse.body);
  final List<Library> libraries =
      LibrariesResponse.fromJson(responseBody).libraries;
  await _cacheLibraries(ref, libraries);
  final LibraryItemsResponse library =
      await fetchLibrary(ref, userModel, libraries[0].id);
  await _cacheLibrary(ref, library);
  await _cacheMediaProgress(ref, userModel);
  return libraries;
}

Future<void> _cacheMediaProgress(Ref<Object?> ref, UserModel userModel) async {
  final Isar isar = await ref.read(databaseProvider.future);

  userModel.mediaProgress?.forEach((element) async {
    final LibraryItemEntity? cachedLibraryItem =
        await checkCache(isar, element.libraryItemId!);
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

Future<LibraryItemsResponse> fetchLibrary(
    Ref ref, UserModel userModel, String libraryId) async {
  final token = userModel.token;
  final fetchLibraryItemsResponse = await ref.read(httpClientProvider).get(
      Uri.parse(
          '${ref.read(serverAddressProvider)}/api/libraries/$libraryId/items?limit=100&minified=1&token=$token'));
  final responseBody = jsonDecode(fetchLibraryItemsResponse.body);
  final LibraryItemsResponse librariesResponse =
      LibraryItemsResponse.fromJson(responseBody);
  return librariesResponse;
}

Future<void> _cacheLibrary(Ref ref, LibraryItemsResponse library) async {
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

Future<void> _cacheLibraries(Ref ref, List<Library> libraries) async {
  final Isar isar = await ref.read(databaseProvider.future);
  libraries.forEach((fetchedLibrary) async {
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
  });
}
