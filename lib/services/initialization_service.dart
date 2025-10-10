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
import 'package:audiobookshelf_flutter/services/optimized_background_loading_service.dart';
import 'package:audiobookshelf_flutter/provider/optimized_background_loading_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/repositories/library_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/login_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationServiceProvider = FutureProvider<InitializationService>((
  ref,
) async {
  return InitializationService(
    ref: ref,
    serverAddress: await ref.watch(serverAddressLoaderProvider.future),
    loginService: await ref.watch(loginServiceProvider.future),
    libraryService: ref.watch(libraryServiceProvider),
    libraryRepository: await ref.watch(libraryRepositoryProvider.future),
    libraryItemsRepository: await ref.watch(
      libraryItemsRepositoryProvider.future,
    ),
    loginState: ref.watch(loginStateProvider),
    backgroundLoadingNotifier: ref.read(
      optimizedBackgroundLoadingProvider.notifier,
    ),
    username: await ref.watch(usernameLoaderProvider.future),
    password: await ref.watch(passwordLoaderProvider.future),
  );
});

class InitializationService {
  final Ref ref;
  final String serverAddress;
  final LoginService loginService;
  final LibraryService libraryService;
  final LibraryRepository libraryRepository;
  final LibraryItemsRepository libraryItemsRepository;
  final LoginState loginState;
  final OptimizedBackgroundLoadingNotifier backgroundLoadingNotifier;
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
            '[INITIALIZATION] Felhasználónév és jelszó megvan, bejelentkezés...',
          );
        }
        Response<LoginResponse?> rawLoginResponse = await loginService.login(
          username,
          password,
        );
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
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          } else {
            if (kDebugMode) {
              print(
                '[INITIALIZATION] User ID: ${loginResponse!.user.id}, HomeScreen-re navigálás',
              );
            }
            try {
              if (kDebugMode) {
                print('[INITIALIZATION] Adatok mentése kezdődik...');
              }

              ref
                  .read(serverSettingsProvider.notifier)
                  .updateServerSettings(loginResponse!.serverSettings);
              ref
                  .read(userModelProvider.notifier)
                  .updateUserModel(loginResponse.user);

              if (kDebugMode) {
                print('[INITIALIZATION] Könyvtárak betöltése...');
              }
              List<Library> libraries = await libraryService.fetchLibraries(
                loginResponse.user,
              );

              if (kDebugMode) {
                print('[INITIALIZATION] ${libraries.length} könyvtár betöltve');
                for (final library in libraries) {
                  print(
                    '[INITIALIZATION] Library: ${library.name} (ID: ${library.id})',
                  );
                }
              }

              if (libraries.isNotEmpty) {
                // Save libraries to database first
                libraryRepository.saveLibraries(libraries);

                if (kDebugMode) {
                  print(
                    '[INITIALIZATION] Starting background loading for all libraries...',
                  );
                }

                // Start background loading for all libraries
                // This will load the selected library first, then others in background
                final backgroundLoadingService = ref.read(
                  optimizedBackgroundLoadingServiceProvider,
                );

                if (kDebugMode) {
                  print(
                    '[INITIALIZATION] Starting background loading service...',
                  );
                }

                await backgroundLoadingService.loadAllLibrariesInBackground(
                  loginResponse.user,
                  libraries,
                  libraries.first.id, // Use first library as selected
                );

                if (kDebugMode) {
                  print('[INITIALIZATION] Background loading service started');
                }
              }

              if (kDebugMode) {
                print('[INITIALIZATION] HomeScreen-re navigálás...');
              }
              Navigator.of(
                context,
              ).pushReplacement(FadePageRoute(page: const HomeScreen()));
            } catch (e) {
              if (kDebugMode) {
                print('[INITIALIZATION] Hiba történt: $e');
                print('[INITIALIZATION] Stack trace: ${StackTrace.current}');
              }
              // Ha hiba történik, akkor is navigáljunk a HomeScreen-re
              Navigator.of(
                context,
              ).pushReplacement(FadePageRoute(page: const HomeScreen()));
            }
          }
        } else if (rawLoginResponse.statusCode == 500) {
          if (kDebugMode) {
            print('[INITIALIZATION] Server error 500, offline mód');
          }
          //todo set offline state, disable syncing etc...
          Navigator.of(
            context,
          ).pushReplacement(FadePageRoute(page: const HomeScreen()));
        } else {
          if (kDebugMode) {
            print(
              '[INITIALIZATION] Bejelentkezés sikertelen, LoginScreen-re navigálás',
            );
          }
          Navigator.of(
            context,
          ).pushReplacement(FadePageRoute(page: const LoginScreen()));
        }
      } else {
        if (kDebugMode) {
          print(
            '[INITIALIZATION] Felhasználónév vagy jelszó hiányzik, LoginScreen-re navigálás',
          );
        }
        Navigator.of(
          context,
        ).pushReplacement(FadePageRoute(page: const LoginScreen()));
      }
    } else {
      if (kDebugMode) {
        print('[INITIALIZATION] Szerver cím hiányzik, InitScreen-re navigálás');
      }
      Navigator.of(
        context,
      ).pushReplacement(FadePageRoute(page: const InitScreen()));
    }
  }
}
