import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:flutter/material.dart';

class SeriesCoverWidget extends StatelessWidget {
  final Series series;
  final double width;
  final double height;
  final double bookCoverAspectRatio;

  const SeriesCoverWidget({
    super.key,
    required this.series,
    required this.width,
    required this.height,
    this.bookCoverAspectRatio = 1.6, // Default aspect ratio for books
  });

  @override
  Widget build(BuildContext context) {
    // Get books with valid cover images
    final booksWithCovers = series.books
        .where((book) => book.media.coverBytes != null)
        .take(10) // Limit to 10 books maximum like the official app
        .toList();

    if (booksWithCovers.isEmpty) {
      // Fallback to series name text when no covers available
      return _buildFallbackCover(context);
    }

    if (booksWithCovers.length == 1) {
      // Single book - show just that cover
      return _buildSingleBookCover(booksWithCovers.first);
    }

    // Multiple books - create composite cover
    return _buildCompositeCover(booksWithCovers);
  }

  Widget _buildFallbackCover(BuildContext context) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.surfaceContainerHighest,
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.2),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: Center(
        child: Padding(
          padding: EdgeInsets.all(width * 0.1),
          child: Text(
            series.name,
            textAlign: TextAlign.center,
            style: TextStyle(
              fontSize: width * 0.08,
              fontWeight: FontWeight.w600,
              color: Theme.of(context).colorScheme.onSurfaceVariant,
            ),
            maxLines: 3,
            overflow: TextOverflow.ellipsis,
          ),
        ),
      ),
    );
  }

  Widget _buildSingleBookCover(dynamic book) {
    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(8),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 8,
            offset: const Offset(2, 4),
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(8),
        child: Image.memory(
          Uint8List.fromList(book.media.coverBytes!.cast<int>()),
          width: width,
          height: height,
          fit: BoxFit.cover,
        ),
      ),
    );
  }

  Widget _buildCompositeCover(List<dynamic> booksWithCovers) {
    // Calculate cover dimensions similar to GroupCover.vue
    final coverWidth = height / bookCoverAspectRatio;
    final widthPer = (width - coverWidth) / (booksWithCovers.length - 1);

    return SizedBox(
      width: width,
      height: height,
      child: Stack(
        children: [
          // Build each book cover with proper positioning and z-index
          for (int i = 0; i < booksWithCovers.length; i++)
            Positioned(
              left: widthPer * i,
              top: 0,
              child: _buildBookCoverLayer(
                booksWithCovers[i],
                coverWidth,
                height,
                booksWithCovers.length -
                    i, // Higher z-index for books on the left
              ),
            ),
        ],
      ),
    );
  }

  Widget _buildBookCoverLayer(
      dynamic book, double coverWidth, double coverHeight, int zIndex) {
    return Container(
      width: coverWidth,
      height: coverHeight,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.4),
            blurRadius: 4,
            offset: const Offset(2, 0), // Shadow to the right for depth effect
          ),
        ],
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(4),
        child: Stack(
          children: [
            // Background cover for aspect ratio differences (like coverBg in Vue)
            if (_shouldShowCoverBackground(book))
              Container(
                width: coverWidth,
                height: coverHeight,
                decoration: BoxDecoration(
                  image: DecorationImage(
                    image: MemoryImage(
                        Uint8List.fromList(book.media.coverBytes!.cast<int>())),
                    fit: BoxFit.cover,
                  ),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Darken background
                ),
              ),
            // Main cover image
            Image.memory(
              Uint8List.fromList(book.media.coverBytes!.cast<int>()),
              width: coverWidth,
              height: coverHeight,
              fit: _shouldShowCoverBackground(book)
                  ? BoxFit.contain
                  : BoxFit.cover,
            ),
          ],
        ),
      ),
    );
  }

  bool _shouldShowCoverBackground(dynamic book) {
    // This is a simplified version of the aspect ratio check from GroupCover.vue
    // In a real implementation, you might want to check the actual image dimensions
    // For now, we'll assume most covers need the background
    return true;
  }
}
