import 'package:audiobookshelf_flutter/services/initialization_service.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/pages/login_screen.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the user model to see if it's loaded from storage
    final userModel = ref.watch(userModelProvider);

    // If user model is loaded, proceed with initialization
    if (userModel != null) {
      if (kDebugMode) {
        print(
          '[SPLASH_SCREEN] User model found, proceeding with initialization',
        );
      }

      final initializationServiceAsync = ref.watch(
        initializationServiceProvider,
      );

      initializationServiceAsync.whenData((initializationService) {
        initializationService.initialization(context);
      });
    } else {
      // Wait a bit for the user model to load from storage
      Future.delayed(const Duration(milliseconds: 500), () {
        if (context.mounted) {
          final userModelAfterDelay = ref.read(userModelProvider);
          if (userModelAfterDelay == null) {
            if (kDebugMode) {
              print(
                '[SPLASH_SCREEN] No user model found after delay, navigating to login',
              );
            }
            Navigator.of(context).pushReplacement(
              MaterialPageRoute(builder: (context) => const LoginScreen()),
            );
          }
        }
      });
    }

    return const Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            SizedBox(width: 64, height: 64, child: CircularProgressIndicator()),
            SizedBox(height: 16),
            Text('Loading...'),
          ],
        ),
      ),
    );
  }
}
