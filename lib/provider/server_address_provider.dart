import 'package:audiobookshelf_flutter/provider/shared_preferences_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:shared_preferences/shared_preferences.dart';

part 'server_address_provider.g.dart';

@riverpod
class ServerAddressNotifier extends _$ServerAddressNotifier {
  @override
  String build() => '';

  void updateServerAddress(String address) {
    state = address;
  }
}

final serverAddressLoaderProvider = FutureProvider<String>((ref) async {
  if (kDebugMode) {
    print('[SERVER_ADDRESS_PROVIDER] Szerver cím betöltése...');
  }

  final SharedPreferences sharedPrefs = await ref.watch(
    sharedPreferencesProvider.future,
  );
  final serverAddress = sharedPrefs.getString('serverAddress') ?? '';

  if (kDebugMode) {
    print(
      '[SERVER_ADDRESS_PROVIDER] SharedPreferences szerver cím: $serverAddress',
    );
  }

  if (serverAddress.isNotEmpty) {
    ref.read(serverAddressProvider.notifier).updateServerAddress(serverAddress);
    if (kDebugMode) {
      print('[SERVER_ADDRESS_PROVIDER] Szerver cím beállítva a provider-ben');
    }
  }

  final currentAddress = ref.watch(serverAddressProvider);
  if (kDebugMode) {
    print('[SERVER_ADDRESS_PROVIDER] Visszaadott szerver cím: $currentAddress');
  }

  return currentAddress;
});

Future<void> saveServerAddress(WidgetRef ref, String address) async {
  final sharedPreferences = await ref.read(sharedPreferencesProvider.future);
  await sharedPreferences.setString('serverAddress', address);
  ref.read(serverAddressProvider.notifier).updateServerAddress(address);
}
