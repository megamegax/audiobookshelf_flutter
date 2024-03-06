import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/pages/bookshelf_screen.dart';
import 'package:audiobookshelf_flutter/pages/init_screen.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:audiobookshelf_flutter/pages/splash_screen.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final initializationProvider = FutureProvider.autoDispose<Widget>((ref) async {
  final serverAddress = ref.watch(serverAddressProvider);

  if (serverAddress.isNotEmpty) {
    final isLoggedIn = checkCredentials(ref);
    final username = ref.watch(usernameLoaderProvider);
    final password = ref.watch(passwordLoaderProvider);
    LoginState loginState = await login(ref, username, password);
    ref.read(loginNotifierProvider.notifier).handleLogin(loginState);

    return loginState.when(initial: () {
      return const SplashScreen();
    }, loading: () {
      return const SplashScreen();
    }, success: ((loginResponse) {
      if (loginResponse.user.id == null) {
        return const LoginScreen();
      } else {
        ref
            .read(serverSettingsNotifierProvider.notifier)
            .updateServerSettings(loginResponse.serverSettings);
        ref
            .read(userModelNotifierProvider.notifier)
            .updateUserModel(loginResponse.user);
        fetchLibraries(ref, loginResponse.user);

        return BookshelfScreen();
      }
    }), error: (error) {
      return const LoginScreen();
    });
  } else {
    return InitScreen();
  }
});

bool checkCredentials(FutureProviderRef ref) {
  final username = ref.watch(usernameLoaderProvider);
  final password = ref.watch(passwordLoaderProvider);
  final serverAddress = ref.watch(serverAddressProvider);
  return serverAddress.isNotEmpty && username.isNotEmpty && password.isNotEmpty;
}
