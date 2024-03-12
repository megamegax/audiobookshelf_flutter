import 'package:audiobookshelf_flutter/provider/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:shared_preferences/shared_preferences.dart';

final usernameProvider = StateProvider<String>((ref) {
  return '';
});
final passwordProvider = StateProvider<String>((ref) {
  return '';
});

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
