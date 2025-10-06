import 'package:audiobookshelf_flutter/provider/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final usernameProvider = StateNotifierProvider<UsernameNotifier, String>((ref) {
  return UsernameNotifier();
});

final passwordProvider = StateNotifierProvider<PasswordNotifier, String>((ref) {
  return PasswordNotifier();
});

class UsernameNotifier extends StateNotifier<String> {
  UsernameNotifier() : super('');

  void updateUsername(String username) {
    state = username;
  }
}

class PasswordNotifier extends StateNotifier<String> {
  PasswordNotifier() : super('');

  void updatePassword(String password) {
    state = password;
  }
}

final usernameLoaderProvider = FutureProvider<String>((ref) async {
  SharedPreferences sharedPrefs =
      await ref.watch(sharedPreferencesProvider.future);
  final username = sharedPrefs.getString('username') ?? '';
  if (username.isNotEmpty) {
    ref.read(usernameProvider.notifier).state = username;
  }

  return ref.watch(usernameProvider);
});
final passwordLoaderProvider = FutureProvider<String>((ref) async {
  SharedPreferences sharedPrefs =
      await ref.watch(sharedPreferencesProvider.future);
  final password = sharedPrefs.getString('password') ?? '';
  if (password.isNotEmpty) {
    ref.read(passwordProvider.notifier).state = password;
  }

  return ref.watch(passwordProvider);
});

Future<void> saveUsername(WidgetRef ref, String username) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  await sharedPreferences.setString('username', username);
  ref.read(usernameProvider.notifier).state = username;
}

Future<void> savePassword(WidgetRef ref, String password) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  await sharedPreferences.setString('password', password);
  ref.read(passwordProvider.notifier).state = password;
}
