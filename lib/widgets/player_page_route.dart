import 'package:flutter/material.dart';

class PlayerPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  PlayerPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation,
              child: child,
            );
          },
        );
}
