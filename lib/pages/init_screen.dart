import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class InitScreen extends HookConsumerWidget {
  InitScreen({super.key});
  bool onceFilled = false;
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverAddress = ref.read(serverAddressProvider);
    final serverAddressState = ref.watch(serverAddressLoaderProvider);
    final TextEditingController controller = useTextEditingController();
    useEffect(() {
      void updateController() {
        if (!onceFilled && serverAddress.isNotEmpty) {
          controller.text = serverAddress;
          onceFilled = true;
        }
      }

      updateController();
      return null;
    }, [serverAddressState]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.labelSetServerAddress),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          children: [
            TextField(
              controller: controller,
              onChanged: (value) =>
                  ref.read(serverAddressProvider.notifier).state = value,
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.labelServerAddress,
                helperText:
                    AppLocalizations.of(context)!.labelServerAddressDescription,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final address = ref.read(serverAddressProvider);
                if (address.isNotEmpty) {
                  await saveServerAddress(ref, address);
                  if (kDebugMode) {
                    print('Server address saved: $serverAddress');
                  }

                  Navigator.push(
                    // ignore: use_build_context_synchronously
                    context,
                    MaterialPageRoute(
                        builder: (context) => const LoginScreen()),
                  );
                } else {
                  ScaffoldMessenger.of(context).showSnackBar(
                    const SnackBar(
                        content: Text('Kérlek, add meg a szerver címet!')),
                  );
                }
              },
              child: Text(AppLocalizations.of(context)!.buttonSave),
            ),
          ],
        ),
      ),
    );
  }
}
