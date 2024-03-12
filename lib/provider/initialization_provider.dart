import 'package:audiobookshelf_flutter/main.dart';
import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/init_screen.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:audiobookshelf_flutter/pages/splash_screen.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

Future<Widget> initialization(WidgetRef ref) async {
  final serverAddress = ref.watch(serverAddressProvider);
  final loginRepository = ref.watch(loginServiceProvider);
  final libraryService = ref.watch(libraryServiceProvider);
  final libraryRepository = await ref.watch(libraryRepositoryProvider.future);
  final libraryItemsRepository =
      await ref.watch(libraryItemsRepositoryProvider.future);
  final loginState = ref.watch(loginStateProvider);
  final BuildContext? context = ref.watch(navigatorKeyProvider).currentContext;
  if (serverAddress.isNotEmpty) {
    final username = ref.watch(usernameLoaderProvider);
    final password = ref.watch(passwordLoaderProvider);

    loginState.when(initial: () {
      if (username.isNotEmpty && password.isNotEmpty) {
        loginRepository.login(ref, username, password);
      }
      Navigator.of(context!).pushReplacement(
          MaterialPageRoute(builder: (context) => const InitScreen()));
    }, loading: () {
      if (username.isNotEmpty && password.isNotEmpty) {
        loginRepository.login(ref, username, password);
      }
      return const SplashScreen();
    }, success: ((loginResponse) {
      if (loginResponse.user.id == null) {
        Navigator.of(context!).pushReplacement(
            MaterialPageRoute(builder: (context) => const LoginScreen()));
      } else {
        Future.delayed(Duration(milliseconds: 10), () async {
          ref
              .read(serverSettingsNotifierProvider.notifier)
              .updateServerSettings(loginResponse.serverSettings);
          ref
              .read(userModelNotifierProvider.notifier)
              .updateUserModel(loginResponse.user);
          List<Library> libraries =
              await libraryService.fetchLibraries(loginResponse.user);
          List<LibraryItem> libraryItems = await libraryService
              .fetchLibraryItems(loginResponse.user, libraries[0].id);
          libraryRepository.saveLibraries(libraries);
          await libraryItemsRepository.saveLibraryItems(libraryItems);
          libraryItemsRepository.saveMediaProgresses(loginResponse.user);
          Navigator.of(context!).pushReplacement(
              MaterialPageRoute(builder: (context) => const BookshelfScreen()));
        });
      }
    }), error: (error) {
      ScaffoldMessenger.of(context!)
          .showSnackBar(SnackBar(content: Text(error.toString())));

      return const LoginScreen();
    }, login: () {
      return const LoginScreen();
    });
  }
  return const InitScreen();
}

bool checkCredentials(FutureProviderRef ref) {
  final username = ref.watch(usernameLoaderProvider);
  final password = ref.watch(passwordLoaderProvider);
  final serverAddress = ref.watch(serverAddressProvider);
  return serverAddress.isNotEmpty && username.isNotEmpty && password.isNotEmpty;
}
