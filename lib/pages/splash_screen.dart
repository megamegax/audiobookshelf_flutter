import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class SplashScreen extends ConsumerWidget {
  const SplashScreen({super.key});
  @override
  Widget build(BuildContext context, WidgetRef ref) {
    return const Center(
        child: SizedBox(
      width: 64,
      height: 64,
      child: CircularProgressIndicator(),
    ));
  }
}