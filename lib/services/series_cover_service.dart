import 'package:flutter/material.dart';

/// Service for creating consistent series cover widgets
/// Used across different screens to generate placeholder covers for series
class SeriesCoverService {
  /// Creates a composite cover widget similar to SeriesCoverWidget but with placeholders
  /// for series that don't have actual book cover data
  static Widget buildCompositeCover(
    BuildContext context,
    String seriesId,
    String seriesName,
    int numBooks, {
    double width = 200.0,
    double height = 120.0,
    int maxBooks = 4,
  }) {
    const coverWidth = 45.0;
    final coverHeight = height;

    final numCovers = (numBooks < maxBooks) ? numBooks : maxBooks;
    final widthPer =
        numCovers > 1 ? (width - coverWidth) / (numCovers - 1) : 0.0;

    return SizedBox(
      width: width,
      height: coverHeight,
      child: Stack(
        children: [
          // Build each book spine with different colors
          for (int i = 0; i < numCovers; i++)
            Positioned(
              left: widthPer * i,
              top: 0,
              child: _buildBookSpine(
                context,
                seriesId,
                seriesName,
                i,
                coverWidth,
                coverHeight,
                numCovers - i, // Higher z-index for books on the left
              ),
            ),
        ],
      ),
    );
  }

  /// Creates a full cover widget with proper container styling
  static Widget buildSeriesCover(
    BuildContext context,
    String seriesId,
    String seriesName,
    int numBooks, {
    double width = 200.0,
    double height = 120.0,
    int maxBooks = 4,
  }) {
    return Container(
      height: height,
      width: width,
      decoration: const BoxDecoration(
        borderRadius: BorderRadius.only(
          topLeft: Radius.circular(12),
          topRight: Radius.circular(12),
        ),
      ),
      child: buildCompositeCover(
        context,
        seriesId,
        seriesName,
        numBooks,
        width: width,
        height: height,
        maxBooks: maxBooks,
      ),
    );
  }

  static Widget _buildBookSpine(
    BuildContext context,
    String seriesId,
    String seriesName,
    int index,
    double width,
    double height,
    int zIndex,
  ) {
    // Generate consistent colors based on series name and book index
    final colorSeed = seriesName.hashCode + index;
    final hue =
        ((colorSeed * 137.508) % 360).abs(); // Golden angle distribution
    final color = HSVColor.fromAHSV(1.0, hue, 0.6, 0.8).toColor();

    return Container(
      width: width,
      height: height,
      decoration: BoxDecoration(
        color: color,
        borderRadius: BorderRadius.circular(4),
        boxShadow: [
          BoxShadow(
            color: Colors.black.withOpacity(0.3),
            blurRadius: 4,
            offset: const Offset(2, 0),
          ),
        ],
        border: Border.all(
          color: color.withOpacity(0.3),
          width: 1,
        ),
      ),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(4),
          gradient: LinearGradient(
            begin: Alignment.centerLeft,
            end: Alignment.centerRight,
            colors: [
              color.withOpacity(0.8),
              color,
              color.withOpacity(0.9),
            ],
            stops: const [0.0, 0.5, 1.0],
          ),
        ),
        child: index == 0 // Only show series name on the first (frontmost) book
            ? Padding(
                padding:
                    const EdgeInsets.symmetric(vertical: 8.0, horizontal: 4.0),
                child: RotatedBox(
                  quarterTurns: 3, // Rotate text to be vertical like book spine
                  child: Text(
                    seriesName,
                    style: TextStyle(
                      fontSize: 10,
                      fontWeight: FontWeight.w600,
                      color: Colors.white,
                      shadows: [
                        Shadow(
                          color: Colors.black.withOpacity(0.5),
                          offset: const Offset(1, 1),
                          blurRadius: 2,
                        ),
                      ],
                    ),
                    maxLines: 1,
                    overflow: TextOverflow.ellipsis,
                    textAlign: TextAlign.center,
                  ),
                ),
              )
            : null,
      ),
    );
  }
}
