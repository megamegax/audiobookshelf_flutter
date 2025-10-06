import 'package:flutter/material.dart';
import 'package:flutter/services.dart';

/// Navigation service that provides different types of transitions
/// to create a thoughtful ("átgondolt") navigation experience
class NavigationService {
  /// Navigate to a page hierarchically (push from left)
  /// Used for: Home -> Library -> Book Details
  static Future<T?> pushHierarchical<T extends Object?>(
    BuildContext context,
    Widget page, {
    String? heroTag,
  }) {
    HapticFeedback.lightImpact();
    return Navigator.of(context).push<T>(
      HierarchicalPageRoute<T>(
        page: page,
        heroTag: heroTag,
      ),
    );
  }

  /// Navigate to a modal page (push from bottom)
  /// Used for: Settings, Download Queue, Player
  static Future<T?> pushModal<T extends Object?>(
    BuildContext context,
    Widget page, {
    bool fullscreen = false,
  }) {
    HapticFeedback.lightImpact();
    return Navigator.of(context).push<T>(
      ModalPageRoute<T>(
        page: page,
        fullscreen: fullscreen,
      ),
    );
  }

  /// Replace current page (fade transition)
  /// Used for: Main navigation (Home, Library, Downloads)
  static Future<T?> replace<T extends Object?>(
    BuildContext context,
    Widget page,
  ) {
    HapticFeedback.selectionClick();
    return Navigator.of(context).pushReplacement<T, void>(
      ReplacementPageRoute<T>(page: page),
    );
  }

  /// Pop with haptic feedback
  static void pop<T extends Object?>(BuildContext context, [T? result]) {
    HapticFeedback.lightImpact();
    Navigator.of(context).pop<T>(result);
  }

  /// Navigate to a detail page with hero animation
  /// Used for: Book cards -> Book details
  static Future<T?> pushWithHero<T extends Object?>(
    BuildContext context,
    Widget page,
    String heroTag,
  ) {
    HapticFeedback.lightImpact();
    return Navigator.of(context).push<T>(
      HeroPageRoute<T>(
        page: page,
        heroTag: heroTag,
      ),
    );
  }
}

/// Hierarchical navigation - slides in from right
/// Indicates moving deeper into the app hierarchy
class HierarchicalPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final String? heroTag;

  HierarchicalPageRoute({
    required this.page,
    this.heroTag,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(1.0, 0.0); // Slide from right
            const end = Offset.zero;
            const curve = Curves.easeInOutCubic;

            final slideAnimation = animation.drive(
              Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              ),
            );

            // Add scale animation to current page
            final scaleAnimation = secondaryAnimation.drive(
              Tween(begin: 1.0, end: 0.95).chain(
                CurveTween(curve: curve),
              ),
            );

            return SlideTransition(
              position: slideAnimation,
              child: ScaleTransition(
                scale: scaleAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 350),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );

  @override
  Widget buildTransitions(
    BuildContext context,
    Animation<double> animation,
    Animation<double> secondaryAnimation,
    Widget child,
  ) {
    if (heroTag != null) {
      return Hero(
        tag: heroTag!,
        child: super
            .buildTransitions(context, animation, secondaryAnimation, child),
      );
    }
    return super
        .buildTransitions(context, animation, secondaryAnimation, child);
  }
}

/// Modal navigation - slides up from bottom
/// Indicates a modal or overlay interaction
class ModalPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final bool fullscreen;

  ModalPageRoute({
    required this.page,
    this.fullscreen = false,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 1.0); // Slide from bottom
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;

            final slideAnimation = animation.drive(
              Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              ),
            );

            // Fade out background slightly
            final fadeAnimation = secondaryAnimation.drive(
              Tween(begin: 1.0, end: 0.8).chain(
                CurveTween(curve: curve),
              ),
            );

            return SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 350),
          opaque: fullscreen,
        );
}

/// Replacement navigation - cross-fade
/// Used for main navigation tabs
class ReplacementPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;

  ReplacementPageRoute({required this.page})
      : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            return FadeTransition(
              opacity: animation.drive(
                CurveTween(curve: Curves.easeInOut),
              ),
              child: child,
            );
          },
          transitionDuration: const Duration(milliseconds: 250),
          reverseTransitionDuration: const Duration(milliseconds: 200),
        );
}

/// Hero-enhanced navigation for detail views
/// Provides smooth hero transitions for cards -> details
class HeroPageRoute<T> extends PageRouteBuilder<T> {
  final Widget page;
  final String heroTag;

  HeroPageRoute({
    required this.page,
    required this.heroTag,
  }) : super(
          pageBuilder: (context, animation, secondaryAnimation) => page,
          transitionsBuilder: (context, animation, secondaryAnimation, child) {
            const begin = Offset(0.0, 0.1); // Slight upward movement
            const end = Offset.zero;
            const curve = Curves.easeOutCubic;

            final slideAnimation = animation.drive(
              Tween(begin: begin, end: end).chain(
                CurveTween(curve: curve),
              ),
            );

            final fadeAnimation = animation.drive(
              CurveTween(curve: Curves.easeOut),
            );

            return SlideTransition(
              position: slideAnimation,
              child: FadeTransition(
                opacity: fadeAnimation,
                child: child,
              ),
            );
          },
          transitionDuration: const Duration(milliseconds: 400),
          reverseTransitionDuration: const Duration(milliseconds: 300),
        );
}
