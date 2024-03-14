import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/series_item.dart';
import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:audiobookshelf_flutter/pages/init_screen.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationProvider =
    FutureProvider<InitializationService>((ref) async {
  final serverAddress = await ref.read(serverAddressLoaderProvider.future);
  final loginRepository = ref.read(loginServiceProvider);
  final libraryService = ref.read(libraryServiceProvider);
  final libraryRepository = await ref.read(libraryRepositoryProvider.future);
  final libraryItemsRepository =
      await ref.read(libraryItemsRepositoryProvider.future);
  final username = await ref.read(usernameLoaderProvider.future);
  final password = await ref.read(passwordLoaderProvider.future);
  final loginState = ref.read(loginStateProvider);
  return InitializationService(
      serverAddress: serverAddress,
      loginService: loginRepository,
      libraryService: libraryService,
      libraryRepository: libraryRepository,
      libraryItemsRepository: libraryItemsRepository,
      loginState: loginState,
      userModelNotifier: ref.read(userModelNotifierProvider.notifier),
      serverSettingsNotifier: ref.read(serverSettingsNotifierProvider.notifier),
      username: username,
      password: password);
});

class InitializationService {
  final String serverAddress;
  final LoginService loginService;
  final LibraryService libraryService;
  final LibraryRepository libraryRepository;
  final LibraryItemsRepository libraryItemsRepository;
  final LoginState loginState;
  final UserModelNotifier userModelNotifier;
  final ServerSettingsNotifier serverSettingsNotifier;
  final String username;
  final String password;
  InitializationService({
    required this.serverAddress,
    required this.loginService,
    required this.libraryService,
    required this.libraryRepository,
    required this.libraryItemsRepository,
    required this.loginState,
    required this.userModelNotifier,
    required this.serverSettingsNotifier,
    required this.username,
    required this.password,
  });
  initialization(BuildContext context) async {
    if (serverAddress.isNotEmpty) {
      if (username.isNotEmpty && password.isNotEmpty) {
        LoginResponse? loginResponse =
            await loginService.login(username, password);
        if (loginResponse?.user.id == null) {
          Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()));
        } else {
          Future.delayed(const Duration(milliseconds: 10), () async {
            serverSettingsNotifier
                .updateServerSettings(loginResponse!.serverSettings);
            userModelNotifier.updateUserModel(loginResponse.user);
            List<Library> libraries =
                await libraryService.fetchLibraries(loginResponse.user);
            libraryService
                .fetchSeries(loginResponse.user, libraries[0].id)
                .then((seriesItems) {
              libraryItemsRepository.saveSeriesItems(seriesItems);
            });
            final List<LibraryItem> libraryItems = await libraryService
                .fetchLibraryItems(loginResponse.user, libraries[0].id);
            List<LibraryItem> libraryItemsWithCover = [];
            for (int i = 0; i < libraryItems.length; i++) {
              LibraryItem libraryItem = libraryItems[i];
              LibraryItemEntity? cachedLibraryItem =
                  await libraryItemsRepository.getBook(libraryItem.id);
              if (libraryItem.updatedAt > (cachedLibraryItem?.updatedAt ?? 0)) {
                final cover = await libraryService.fetchCover(
                    libraryItem, loginResponse.user);
                final mediaWithCover =
                    libraryItem.media.copyWith(coverBytes: cover!);
                libraryItemsWithCover
                    .add(libraryItem.copyWith(media: mediaWithCover));
              }
            }

            libraryRepository.saveLibraries(libraries);
            await libraryItemsRepository
                .saveLibraryItems(libraryItemsWithCover);
            libraryItemsRepository.saveMediaProgresses(loginResponse.user);
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const HomeScreen()));
          });
        }
      } else {
        Navigator.of(context).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      }
    } else {
      Navigator.of(context).pushReplacement(
          MaterialPageRoute(builder: (context) => const InitScreen()));
    }
  }
}
