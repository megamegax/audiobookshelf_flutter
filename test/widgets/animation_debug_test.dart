import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/gestures.dart';

void main() {
  group('Animation Debug Tests', () {
    testWidgets('should trigger rebuilds when animation controllers change',
        (WidgetTester tester) async {
      int buildCount = 0;
      late AnimationController controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                buildCount++;
                return GestureDetector(
                  onTap: () {
                    controller.forward();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + controller.value * 0.5,
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Create animation controller
      controller = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: tester,
      );

      final initialBuildCount = buildCount;

      // Tap to trigger animation
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      // Should trigger rebuilds
      expect(buildCount, greaterThan(initialBuildCount));

      controller.dispose();
    });

    testWidgets('should work with Listenable.merge',
        (WidgetTester tester) async {
      int buildCount = 0;
      late AnimationController controller1;
      late AnimationController controller2;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                buildCount++;
                return GestureDetector(
                  onTap: () {
                    controller1.forward();
                  },
                  child: Container(
                    width: 100,
                    height: 100,
                    color: Colors.blue,
                    child: AnimatedBuilder(
                      animation: Listenable.merge([controller1, controller2]),
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + controller1.value * 0.5,
                          child: Container(
                            width: 50,
                            height: 50,
                            color: Colors.red,
                          ),
                        );
                      },
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

      // Create animation controllers
      controller1 = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: tester,
      );
      controller2 = AnimationController(
        duration: Duration(milliseconds: 300),
        vsync: tester,
      );

      final initialBuildCount = buildCount;

      // Tap to trigger animation
      await tester.tap(find.byType(GestureDetector));
      await tester.pump();

      // Should trigger rebuilds
      expect(buildCount, greaterThan(initialBuildCount));

      controller1.dispose();
      controller2.dispose();
    });
  });
}
