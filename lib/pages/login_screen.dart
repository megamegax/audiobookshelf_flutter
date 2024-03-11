import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.labelLoginScreen),
      ),
      body: Padding(
          padding: const EdgeInsets.all(16.0),
          child: _buildInitialState(context, ref)),
    );
  }

  Widget _buildInitialState(BuildContext context, WidgetRef ref) {
    final serverAddress = ref.read(serverAddressProvider);
    final usernameController = useTextEditingController.fromValue(
        TextEditingValue(text: ref.watch(usernameLoaderProvider).toString()));
    final passwordController = useTextEditingController();
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Row(
          children: [
            Expanded(
              child: Text(
                'Szerver cím: $serverAddress',
                style: Theme.of(context).textTheme.bodyLarge,
              ),
            ),
            IconButton(
              icon: const Icon(Icons.edit),
              onPressed: () {
                ref
                    .read(loginStateProvider.notifier)
                    .updateState(const LoginState.initial());
              },
            ),
          ],
        ),
        const SizedBox(height: 20),
        TextField(
          controller: usernameController,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.labelUsername,
          ),
        ),
        const SizedBox(height: 10),
        TextField(
          controller: passwordController,
          decoration: InputDecoration(
            labelText: AppLocalizations.of(context)!.labelPassword,
          ),
          obscureText: true,
        ),
        const SizedBox(height: 20),
        ElevatedButton(
          onPressed: () {
            saveUsername(ref, usernameController.text);
            savePassword(ref, passwordController.text);
          },
          child: Text(AppLocalizations.of(context)!.buttonLogin),
        ),
      ],
    );
  }
}
