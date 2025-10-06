import 'package:audiobookshelf_flutter/l10n-generated/app_localizations.dart';
import 'package:audiobookshelf_flutter/model/login/login_response.dart';
import 'package:audiobookshelf_flutter/model/login/response.dart';
import 'package:audiobookshelf_flutter/model/login_state.dart';
import 'package:audiobookshelf_flutter/pages/splash_screen.dart';
import 'package:audiobookshelf_flutter/pages/init_screen.dart';
import 'package:audiobookshelf_flutter/provider/credential_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_hooks/flutter_hooks.dart';
import 'package:flutter/material.dart';
import 'package:hooks_riverpod/hooks_riverpod.dart';

class LoginScreen extends HookConsumerWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final serverAddress = ref.watch(serverAddressProvider);
    final usernameFuture = ref.watch(usernameLoaderProvider.future);
    final loginState = ref.watch(loginStateProvider);

    final usernameController = useTextEditingController();
    final passwordController = useTextEditingController();
    final isLoggingIn = useState(false);

    // useEffect to load username and server address asynchronously when the widget is built
    useEffect(() {
      usernameFuture.then((username) {
        usernameController.text = username.toString();
      });

      // Load server address
      ref.read(serverAddressLoaderProvider.future).then((address) {
        if (kDebugMode) {
          print('[LOGIN] Szerver cím betöltve: $address');
        }
        if (address.isEmpty) {
          if (kDebugMode) {
            print('[LOGIN] Szerver cím üres, hibaüzenet megjelenítése');
          }
          // If no server address is set, show error
          ref.read(loginStateProvider.notifier).updateState(const LoginState
              .error(
              'Nincs szerver cím beállítva. Kérlek, add meg a szerver címet!'));
        }
      });

      return null;
    }, [usernameFuture]);

    return Scaffold(
      appBar: AppBar(
        title: Text(AppLocalizations.of(context)!.labelLoginScreen),
      ),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
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
                    // Navigate back to init screen to edit server address
                    Navigator.of(context).pushReplacement(MaterialPageRoute(
                        builder: (context) => const InitScreen()));
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
            // Error message display
            if (loginState.when(
              initial: () => false,
              login: () => false,
              loading: () => false,
              success: (_) => false,
              error: (_) => true,
            ))
              Container(
                padding: const EdgeInsets.all(12),
                margin: const EdgeInsets.only(bottom: 16),
                decoration: BoxDecoration(
                  color: Theme.of(context).colorScheme.errorContainer,
                  borderRadius: BorderRadius.circular(8),
                ),
                child: Row(
                  children: [
                    Icon(
                      Icons.error_outline,
                      color: Theme.of(context).colorScheme.onErrorContainer,
                    ),
                    const SizedBox(width: 8),
                    Expanded(
                      child: Text(
                        loginState.when(
                          initial: () => '',
                          login: () => '',
                          loading: () => '',
                          success: (_) => '',
                          error: (message) => message,
                        ),
                        style: TextStyle(
                          color: Theme.of(context).colorScheme.onErrorContainer,
                        ),
                      ),
                    ),
                  ],
                ),
              ),
            // Login button
            SizedBox(
              width: double.infinity,
              child: ElevatedButton(
                onPressed: (loginState.when(
                          initial: () => true,
                          login: () => true,
                          loading: () => false,
                          success: (_) => true,
                          error: (_) => true,
                        ) &&
                        !isLoggingIn.value)
                    ? () async {
                        if (kDebugMode) {
                          print('[LOGIN] Bejelentkezési folyamat kezdődik...');
                          print('[LOGIN] Szerver cím: $serverAddress');
                          print(
                              '[LOGIN] Felhasználónév: ${usernameController.text}');
                          print(
                              '[LOGIN] Jelszó hossza: ${passwordController.text.length}');
                        }

                        // Prevent double login
                        isLoggingIn.value = true;

                        // Set loading state
                        ref
                            .read(loginStateProvider.notifier)
                            .updateState(const LoginState.loading());
                        if (kDebugMode) {
                          print('[LOGIN] Loading state beállítva');
                        }

                        try {
                          if (kDebugMode) {
                            print(
                                '[LOGIN] Felhasználónév és jelszó mentése...');
                          }
                          saveUsername(ref, usernameController.text);
                          savePassword(ref, passwordController.text);

                          if (kDebugMode) {
                            print('[LOGIN] LoginService hívása...');
                          }
                          final Response<LoginResponse?> response = await ref
                              .read(loginServiceProvider)
                              .login(usernameController.text,
                                  passwordController.text);

                          if (kDebugMode) {
                            print('[LOGIN] LoginService válasz érkezett');
                            print(
                                '[LOGIN] Response success: ${response.success}');
                            print(
                                '[LOGIN] Response statusCode: ${response.statusCode}');
                            print(
                                '[LOGIN] Response message: ${response.message}');
                            print(
                                '[LOGIN] Response data null: ${response.data == null}');
                          }

                          if (response.data != null &&
                              response.data!.user.id != null) {
                            if (kDebugMode) {
                              print('[LOGIN] Sikeres bejelentkezés!');
                              print(
                                  '[LOGIN] User ID: ${response.data!.user.id}');
                              print(
                                  '[LOGIN] User name: ${response.data!.user.username}');
                            }

                            ref
                                .read(userModelNotifierProvider.notifier)
                                .updateUserModel(response.data!.user);

                            if (kDebugMode) {
                              print(
                                  '[LOGIN] UserModel frissítve, navigáció SplashScreen-re...');
                            }

                            Navigator.of(context).pushReplacement(
                                MaterialPageRoute(
                                    builder: (context) =>
                                        const SplashScreen()));
                          } else {
                            if (kDebugMode) {
                              print('[LOGIN] Bejelentkezés sikertelen');
                              print(
                                  '[LOGIN] Error message: ${response.message}');
                            }
                            // Show error message
                            ref.read(loginStateProvider.notifier).updateState(
                                LoginState.error(response.message));
                          }
                        } catch (e) {
                          if (kDebugMode) {
                            print('[LOGIN] Exception történt: ${e.toString()}');
                            print('[LOGIN] Exception type: ${e.runtimeType}');
                          }
                          // Show error message
                          ref.read(loginStateProvider.notifier).updateState(
                              LoginState.error(
                                  'Hiba történt: ${e.toString()}'));
                        } finally {
                          // Reset login flag
                          isLoggingIn.value = false;
                        }
                      }
                    : null,
                child: loginState.when(
                  initial: () =>
                      Text(AppLocalizations.of(context)!.buttonLogin),
                  login: () => Text(AppLocalizations.of(context)!.buttonLogin),
                  loading: () => const Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      SizedBox(
                        width: 20,
                        height: 20,
                        child: CircularProgressIndicator(strokeWidth: 2),
                      ),
                      SizedBox(width: 8),
                      Text('Bejelentkezés...'),
                    ],
                  ),
                  success: (_) =>
                      Text(AppLocalizations.of(context)!.buttonLogin),
                  error: (_) => Text(AppLocalizations.of(context)!.buttonLogin),
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
