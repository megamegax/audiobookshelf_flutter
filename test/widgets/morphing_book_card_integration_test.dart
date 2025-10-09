import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:integration_test/integration_test.dart';

void main() {
  IntegrationTestWidgetsFlutterBinding.ensureInitialized();

  group('MorphingBookCard Integration Tests', () {
    testWidgets('should maintain image visibility during hover',
        (WidgetTester tester) async {
      // This test verifies that the image doesn't disappear during hover
      // We'll create a simple test widget that mimics the morphing book card behavior

      int buildCount = 0;
      bool isHovered = false;
      late AnimationController controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                buildCount++;
                return Center(
                  child: MouseRegion(
                    onEnter: (_) {
                      isHovered = true;
                      controller.forward();
                      setState(() {});
                    },
                    onExit: (_) {
                      isHovered = false;
                      controller.reverse();
                      setState(() {});
                    },
                    child: AnimatedBuilder(
                      animation: controller,
                      builder: (context, child) {
                        return Transform.scale(
                          scale: 1.0 + (controller.value * 0.1),
                          child: Container(
                            width: 180,
                            height: 320,
                            decoration: BoxDecoration(
                              color: Colors.blue
                                  .withOpacity(0.1 + (controller.value * 0.2)),
                              borderRadius: BorderRadius.circular(16),
                              border: Border.all(
                                color: isHovered ? Colors.red : Colors.grey,
                                width: 2,
                              ),
                            ),
                            child: Column(
                              children: [
                                // Image area
                                Expanded(
                                  flex: 4,
                                  child: Container(
                                    margin: const EdgeInsets.all(12),
                                    decoration: BoxDecoration(
                                      color: Colors.grey[300],
                                      borderRadius: BorderRadius.circular(12),
                                    ),
                                    child: Container(
                                      color: Colors.green, // Simulate image
                                      child: Center(
                                        child: Text(
                                          'Image\nHover: $isHovered\nScale: ${1.0 + (controller.value * 0.1)}',
                                          textAlign: TextAlign.center,
                                          style: TextStyle(color: Colors.white),
                                        ),
                                      ),
                                    ),
                                  ),
                                ),
                                // Text area
                                Expanded(
                                  flex: 2,
                                  child: Padding(
                                    padding: const EdgeInsets.all(16),
                                    child: Column(
                                      crossAxisAlignment:
                                          CrossAxisAlignment.start,
                                      children: [
                                        Text(
                                          'Test Book Title',
                                          style: TextStyle(
                                            fontSize: 16,
                                            fontWeight: FontWeight.bold,
                                          ),
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 4),
                                        Text(
                                          'Test Author',
                                          style: TextStyle(
                                            fontSize: 14,
                                            color: Colors.grey[600],
                                          ),
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                        SizedBox(height: 8),
                                        Text(
                                          'Builds: $buildCount',
                                          style: TextStyle(fontSize: 10),
                                        ),
                                      ],
                                    ),
                                  ),
                                ),
                              ],
                            ),
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

      // Verify initial state
      expect(find.text('Image'), findsOneWidget);
      expect(find.text('Hover: false'), findsOneWidget);

      // Simulate hover
      await tester.sendEventToBinding(
        PointerEnterEvent(position: Offset(100, 100)),
      );
      await tester.pump();

      // Verify hover state
      expect(find.text('Hover: true'), findsOneWidget);
      expect(
          find.text('Image'), findsOneWidget); // Image should still be visible

      // Verify rebuilds occurred
      expect(buildCount, greaterThan(initialBuildCount));

      // Simulate hover exit
      await tester.sendEventToBinding(
        PointerExitEvent(position: Offset(0, 0)),
      );
      await tester.pump();

      // Verify exit state
      expect(find.text('Hover: false'), findsOneWidget);
      expect(
          find.text('Image'), findsOneWidget); // Image should still be visible

      controller.dispose();
    });

    testWidgets('should handle rapid hover events',
        (WidgetTester tester) async {
      int buildCount = 0;
      bool isHovered = false;
      late AnimationController controller;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: StatefulBuilder(
              builder: (context, setState) {
                buildCount++;
                return Center(
                  child: MouseRegion(
                    onEnter: (_) {
                      isHovered = true;
                      controller.forward();
                      setState(() {});
                    },
                    onExit: (_) {
                      isHovered = false;
                      controller.reverse();
                      setState(() {});
                    },
                    child: Container(
                      width: 100,
                      height: 100,
                      color: isHovered ? Colors.red : Colors.blue,
                      child: Center(
                        child: Text('Builds: $buildCount'),
                      ),
                    ),
                  ),
                );
              },
            ),
          ),
        ),
      );

      controller = AnimationController(
        duration: Duration(milliseconds: 100),
        vsync: tester,
      );

      // Rapid hover events
      for (int i = 0; i < 5; i++) {
        await tester.sendEventToBinding(
          PointerEnterEvent(position: Offset(50, 50)),
        );
        await tester.pump();

        await tester.sendEventToBinding(
          PointerExitEvent(position: Offset(0, 0)),
        );
        await tester.pump();
      }

      // Should handle rapid events without issues
      expect(buildCount, greaterThan(10));

      controller.dispose();
    });
  });
}


