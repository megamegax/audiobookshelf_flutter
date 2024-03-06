import 'package:audiobookshelf_flutter/provider/shared_preferences_provider.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

final serverAddressProvider = StateProvider<String>((ref) {
  return '';
});

final serverAddressLoaderProvider = StateProvider<String>((ref) {
  ref.watch(sharedPreferencesProvider.future).then((sharedPrefs) {
    final serverAddress = sharedPrefs.getString('serverAddress') ?? '';
    if (serverAddress.isNotEmpty) {
      ref.read(serverAddressProvider.notifier).state = serverAddress;
    }
  });
  return ref.watch(serverAddressProvider);
});

Future<void> saveServerAddress(WidgetRef ref, String address) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  await sharedPreferences.setString('serverAddress', address);
  ref.read(serverAddressProvider.notifier).state = address;
}
