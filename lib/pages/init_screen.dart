import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

// ignore: must_be_immutable
class InitScreen extends ConsumerStatefulWidget {
  const InitScreen({super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() {
    return InitScreenState();
  }
}

class InitScreenState extends ConsumerState<InitScreen> {
  late String serverAddress;
  late TextEditingController controller;
  @override
  void initState() {
    serverAddress = ref.read(serverAddressLoaderProvider);
    controller = TextEditingController(text: serverAddress);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
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
              decoration: InputDecoration(
                labelText: AppLocalizations.of(context)!.labelServerAddress,
                helperText:
                    AppLocalizations.of(context)!.labelServerAddressDescription,
              ),
            ),
            const SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                final address = controller.text;
                if (address.isNotEmpty) {
                  await saveServerAddress(ref, address);
                  if (kDebugMode) {
                    print('Server address saved: $serverAddress');
                  }
                  ref
                      .read(loginStateProvider.notifier)
                      .updateState(const LoginState.login());
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
