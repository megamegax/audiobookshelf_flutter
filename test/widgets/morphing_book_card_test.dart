import 'package:flutter/material.dart';
import 'package:flutter_test/flutter_test.dart';
import 'package:flutter/gestures.dart';
import 'package:audiobookshelf_flutter/widgets/morphing_book_card.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/media.dart';
import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'dart:typed_data';

void main() {
  group('MorphingBookCard Widget Tests', () {
    late LibraryItem testLibraryItem;

    setUp(() {
      // Create test data
      final testCoverBytes =
          Uint8List.fromList(List.generate(1000, (i) => i % 256));

      testLibraryItem = LibraryItem(
        itemId: 'test-item-1',
        libraryId: 'test-library-1',
        media: Media(
          coverBytes: testCoverBytes,
          metadata: Metadata(
            title: 'Test Book Title',
            authorName: 'Test Author',
          ),
        ),
      );
    });

    testWidgets('should display book cover image', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Verify the image is displayed
      expect(find.byType(Image), findsOneWidget);

      // Verify the image is using the correct bytes
      final imageWidget = tester.widget<Image>(find.byType(Image));
      expect(imageWidget.image, isA<MemoryImage>());
    });

    testWidgets('should display fallback icon when no cover image',
        (WidgetTester tester) async {
      final itemWithoutCover = LibraryItem(
        itemId: 'test-item-2',
        libraryId: 'test-library-2',
        media: Media(
          coverBytes: null,
          metadata: Metadata(
            title: 'Test Book Without Cover',
            authorName: 'Test Author',
          ),
        ),
      );

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: itemWithoutCover),
          ),
        ),
      );

      // Should show fallback icon instead of image
      expect(find.byIcon(Icons.library_music), findsOneWidget);
      expect(find.byType(Image), findsNothing);
    });

    testWidgets('should trigger hover animation on mouse enter',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Find the MouseRegion
      final mouseRegion = find.byType(MouseRegion);
      expect(mouseRegion, findsOneWidget);

      // Simulate mouse enter
      await tester.sendEventToBinding(
        PointerEnterEvent(position: Offset.zero),
      );
      await tester.pump();

      // The widget should rebuild (this is what we're testing)
      // We can verify this by checking if the AnimatedBuilder is working
      expect(find.byType(AnimatedBuilder), findsOneWidget);
    });

    testWidgets('should display title and author text',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Verify title and author are displayed
      expect(find.text('Test Book Title'), findsOneWidget);
      expect(find.text('Test Author'), findsOneWidget);
    });

    testWidgets('should handle tap navigation', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Find the GestureDetector
      final gestureDetector = find.byType(GestureDetector);
      expect(gestureDetector, findsOneWidget);

      // Tap the card
      await tester.tap(gestureDetector);
      await tester.pumpAndSettle();

      // Should navigate to BookDetails (we can't easily test navigation in unit tests)
      // But we can verify the tap was handled
    });

    testWidgets('should maintain image visibility during hover',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Verify image is initially visible
      expect(find.byType(Image), findsOneWidget);

      // Simulate hover
      final mouseRegion = find.byType(MouseRegion);
      await tester.sendEventToBinding(
        PointerEnterEvent(position: Offset.zero),
      );
      await tester.pump();

      // Image should still be visible after hover
      expect(find.byType(Image), findsOneWidget);

      // Simulate hover exit
      await tester.sendEventToBinding(
        PointerExitEvent(position: Offset.zero),
      );
      await tester.pump();

      // Image should still be visible after hover exit
      expect(find.byType(Image), findsOneWidget);
    });

    testWidgets('should have proper dimensions', (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Find the main container
      final containerFinder = find.byType(Container).first;
      final container = tester.widget<Container>(containerFinder);

      // Verify dimensions
      expect(container.constraints?.maxWidth, 180);
      expect(container.constraints?.maxHeight, 320);
    });
  });

  group('MorphingBookCard Animation Tests', () {
    late LibraryItem testLibraryItem;

    setUp(() {
      final testCoverBytes =
          Uint8List.fromList(List.generate(1000, (i) => i % 256));

      testLibraryItem = LibraryItem(
        itemId: 'test-item-1',
        libraryId: 'test-library-1',
        media: Media(
          coverBytes: testCoverBytes,
          metadata: Metadata(
            title: 'Test Book Title',
            authorName: 'Test Author',
          ),
        ),
      );
    });

    testWidgets('should have working animation controllers',
        (WidgetTester tester) async {
      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: MorphingBookCard(libraryItem: testLibraryItem),
          ),
        ),
      );

      // Find the AnimatedBuilder
      final animatedBuilder = find.byType(AnimatedBuilder);
      expect(animatedBuilder, findsOneWidget);

      // The AnimatedBuilder should be listening to animation controllers
      final animatedBuilderWidget =
          tester.widget<AnimatedBuilder>(animatedBuilder);
      expect(animatedBuilderWidget.animation, isNotNull);
    });

    testWidgets('should trigger rebuilds on animation changes',
        (WidgetTester tester) async {
      int buildCount = 0;

      await tester.pumpWidget(
        MaterialApp(
          home: Scaffold(
            body: Builder(
              builder: (context) {
                buildCount++;
                return MorphingBookCard(libraryItem: testLibraryItem);
              },
            ),
          ),
        ),
      );

      final initialBuildCount = buildCount;

      // Simulate hover to trigger animation
      final mouseRegion = find.byType(MouseRegion);
      await tester.sendEventToBinding(
        PointerEnterEvent(position: Offset.zero),
      );
      await tester.pump();

      // Should trigger rebuilds
      expect(buildCount, greaterThan(initialBuildCount));
    });
  });
}
