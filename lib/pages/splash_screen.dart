import 'package:audiobookshelf_flutter/services/initialization_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    ref.read(initializationProvider.future).then((initializationService) {
      initializationService.initialization(context);
    });

    return const Scaffold(
      body: Center(
          child: SizedBox(
        width: 64,
        height: 64,
        child: CircularProgressIndicator(),
      )),
    );
  }
}
