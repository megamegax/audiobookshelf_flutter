import 'package:audiobookshelf_flutter/model/libraries/library.dart';
import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login/response.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/pages/home_screen.dart';
import 'package:audiobookshelf_flutter/pages/init_screen.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/provider/background_library_loading_provider.dart';
import 'package:audiobookshelf_flutter/services/optimized_background_loading_service.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationProvider =
    FutureProvider<InitializationService>((ref) async {
  final serverAddress = await ref.read(serverAddressLoaderProvider.future);
  final libraryService = ref.read(libraryServiceProvider);
  final libraryRepository = await ref.read(libraryRepositoryProvider.future);
  final libraryItemsRepository =
      await ref.read(libraryItemsRepositoryProvider.future);
  final username = await ref.read(usernameLoaderProvider.future);
  final password = await ref.read(passwordLoaderProvider.future);
  final loginState = ref.read(loginStateProvider);
  final loginService = ref.read(loginServiceProvider);
  final backgroundLoadingNotifier =
      ref.read(backgroundLibraryLoadingStateProvider.notifier);
  return InitializationService(
      ref: ref,
      serverAddress: serverAddress,
      loginService: loginService,
      libraryService: libraryService,
      libraryRepository: libraryRepository,
      libraryItemsRepository: libraryItemsRepository,
      loginState: loginState,
      userModelNotifier: ref.read(userModelNotifierProvider.notifier),
      serverSettingsNotifier: ref.read(serverSettingsNotifierProvider.notifier),
      backgroundLoadingNotifier: backgroundLoadingNotifier,
      username: username,
      password: password);
});

class InitializationService {
  final Ref ref;
  final String serverAddress;
  final LoginService loginService;
  final LibraryService libraryService;
  final LibraryRepository libraryRepository;
  final LibraryItemsRepository libraryItemsRepository;
  final LoginState loginState;
  final UserModelNotifier userModelNotifier;
  final ServerSettingsNotifier serverSettingsNotifier;
  final BackgroundLibraryLoadingStateNotifier backgroundLoadingNotifier;
  final String username;
  final String password;
  InitializationService({
    required this.ref,
    required this.serverAddress,
    required this.loginService,
    required this.libraryService,
    required this.libraryRepository,
    required this.libraryItemsRepository,
    required this.loginState,
    required this.userModelNotifier,
    required this.serverSettingsNotifier,
    required this.backgroundLoadingNotifier,
    required this.username,
    required this.password,
  });
  initialization(BuildContext context) async {
    if (kDebugMode) {
      print('[INITIALIZATION] Initialization kezdődik...');
      print('[INITIALIZATION] Server address: $serverAddress');
      print('[INITIALIZATION] Username: $username');
      print('[INITIALIZATION] Password length: ${password.length}');
    }

    if (serverAddress.isNotEmpty) {
      if (kDebugMode) {
        print('[INITIALIZATION] Szerver cím megvan');
      }
      if (username.isNotEmpty && password.isNotEmpty) {
        if (kDebugMode) {
          print(
              '[INITIALIZATION] Felhasználónév és jelszó megvan, bejelentkezés...');
        }
        Response<LoginResponse?> rawLoginResponse =
            await loginService.login(username, password);
        LoginResponse? loginResponse = rawLoginResponse.data;
        if (rawLoginResponse.success) {
          if (kDebugMode) {
            print('[INITIALIZATION] Bejelentkezés sikeres');
          }
          if (loginResponse?.user.id == null) {
            if (kDebugMode) {
              print('[INITIALIZATION] User ID null, LoginScreen-re navigálás');
            }
            Navigator.of(context).pushReplacement(
                MaterialPageRoute(builder: (context) => const LoginScreen()));
          } else {
            if (kDebugMode) {
              print(
                  '[INITIALIZATION] User ID: ${loginResponse!.user.id}, HomeScreen-re navigálás');
            }
            Future.delayed(const Duration(milliseconds: 10), () async {
              try {
                if (kDebugMode) {
                  print('[INITIALIZATION] Adatok mentése kezdődik...');
                }

                serverSettingsNotifier
                    .updateServerSettings(loginResponse!.serverSettings);
                userModelNotifier.updateUserModel(loginResponse.user);

                if (kDebugMode) {
                  print('[INITIALIZATION] Könyvtárak betöltése...');
                }
                List<Library> libraries =
                    await libraryService.fetchLibraries(loginResponse.user);

                if (kDebugMode) {
                  print(
                      '[INITIALIZATION] ${libraries.length} könyvtár betöltve');
                }

                if (libraries.isNotEmpty) {
                  // Save libraries to database first
                  libraryRepository.saveLibraries(libraries);

                  if (kDebugMode) {
                    print(
                        '[INITIALIZATION] Starting background loading for all libraries...');
                  }

                  // Start background loading for all libraries
                  // This will load the selected library first, then others in background
                  final backgroundLoadingService =
                      ref.read(optimizedBackgroundLoadingServiceProvider);
                  await backgroundLoadingService.loadAllLibrariesInBackground(
                    loginResponse.user,
                    libraries,
                    libraries.first.id, // Use first library as selected
                  );
                }

                if (kDebugMode) {
                  print('[INITIALIZATION] HomeScreen-re navigálás...');
                }
                Navigator.of(context)
                    .pushReplacement(FadePageRoute(page: const HomeScreen()));
              } catch (e) {
                if (kDebugMode) {
                  print('[INITIALIZATION] Hiba történt: $e');
                  print('[INITIALIZATION] Stack trace: ${StackTrace.current}');
                }
                // Ha hiba történik, akkor is navigáljunk a HomeScreen-re
                Navigator.of(context)
                    .pushReplacement(FadePageRoute(page: const HomeScreen()));
              }
            });
          }
        } else if (rawLoginResponse.statusCode == 500) {
          if (kDebugMode) {
            print('[INITIALIZATION] Server error 500, offline mód');
          }
          //todo set offline state, disable syncing etc...
          Navigator.of(context)
              .pushReplacement(FadePageRoute(page: const HomeScreen()));
        } else {
          if (kDebugMode) {
            print(
                '[INITIALIZATION] Bejelentkezés sikertelen, LoginScreen-re navigálás');
          }
          Navigator.of(context)
              .pushReplacement(FadePageRoute(page: const LoginScreen()));
        }
      } else {
        if (kDebugMode) {
          print(
              '[INITIALIZATION] Felhasználónév vagy jelszó hiányzik, LoginScreen-re navigálás');
        }
        Navigator.of(context)
            .pushReplacement(FadePageRoute(page: const LoginScreen()));
      }
    } else {
      if (kDebugMode) {
        print('[INITIALIZATION] Szerver cím hiányzik, InitScreen-re navigálás');
      }
      Navigator.of(context)
          .pushReplacement(FadePageRoute(page: const InitScreen()));
    }
  }
}
