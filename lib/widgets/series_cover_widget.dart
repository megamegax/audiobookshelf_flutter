import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/database/series.dart';
import 'package:flutter/foundation.dart';
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
    // Get books with valid cover images (filter out corrupted ones)
    // Note: We need to get the actual book entities from the bookIds
    // For now, we'll use a placeholder approach
    final booksWithCovers =
        <LibraryItemEntity>[]; // TODO: Implement book lookup from bookIds

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

  /// Check if image data is valid to prevent infinite loops
  bool _isValidImageData(List<int> imageBytes) {
    if (imageBytes.isEmpty) return false;

    // Check for common image file signatures
    if (imageBytes.length < 4) return false;

    // JPEG signature: FF D8 FF
    if (imageBytes[0] == 0xFF &&
        imageBytes[1] == 0xD8 &&
        imageBytes[2] == 0xFF) {
      return true;
    }

    // PNG signature: 89 50 4E 47
    if (imageBytes[0] == 0x89 &&
        imageBytes[1] == 0x50 &&
        imageBytes[2] == 0x4E &&
        imageBytes[3] == 0x47) {
      return true;
    }

    // WebP signature: 52 49 46 46 (RIFF)
    if (imageBytes[0] == 0x52 &&
        imageBytes[1] == 0x49 &&
        imageBytes[2] == 0x46 &&
        imageBytes[3] == 0x46) {
      return true;
    }

    // If we can't identify the format, assume it's invalid to prevent crashes
    return false;
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
    if (kDebugMode) {
      print(
        '[SERIES_COVER_WIDGET] Building single book cover for series: ${series.name}',
      );
      print('[SERIES_COVER_WIDGET] Book title: ${book.media.metadata?.title}');
      print(
        '[SERIES_COVER_WIDGET] CoverBytes length: ${book.media.coverBytes?.length ?? 0}',
      );
    }

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
        child: () {
          // Validate image data before attempting to create Image.memory
          if (!_isValidImageData(book.media.coverBytes!)) {
            if (kDebugMode) {
              print(
                '[SERIES_COVER_WIDGET] Invalid image data for book: ${book.media.metadata?.title}',
              );
            }
            return Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: Icon(Icons.library_music, size: 48),
            );
          }

          try {
            if (kDebugMode) {
              print(
                '[SERIES_COVER_WIDGET] Attempting to create Image.memory for book: ${book.media.metadata?.title}',
              );
            }
            return Image.memory(
              Uint8List.fromList(book.media.coverBytes!.cast<int>()),
              width: width,
              height: height,
              fit: BoxFit.cover,
              errorBuilder: (context, error, stackTrace) {
                if (kDebugMode) {
                  print(
                    '[SERIES_COVER_WIDGET] Image.memory errorBuilder triggered for book: ${book.media.metadata?.title}',
                  );
                }
                return Container(
                  width: width,
                  height: height,
                  color: Colors.grey[300],
                  child: Icon(Icons.library_music, size: 48),
                );
              },
            );
          } catch (e) {
            if (kDebugMode) {
              print(
                '[SERIES_COVER_WIDGET] Error creating Image.memory for book ${book.media.metadata?.title}: $e',
              );
              print('[SERIES_COVER_WIDGET] Error type: ${e.runtimeType}');
              print(
                '[SERIES_COVER_WIDGET] CoverBytes first 20 bytes: ${book.media.coverBytes!.take(20).toList()}',
              );
            }
            return Container(
              width: width,
              height: height,
              color: Colors.grey[300],
              child: Icon(Icons.library_music, size: 48),
            );
          }
        }(),
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
    dynamic book,
    double coverWidth,
    double coverHeight,
    int zIndex,
  ) {
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
                  image: () {
                    try {
                      return DecorationImage(
                        image: MemoryImage(
                          Uint8List.fromList(
                            book.media.coverBytes!.cast<int>(),
                          ),
                        ),
                        fit: BoxFit.cover,
                      );
                    } catch (e) {
                      if (kDebugMode) {
                        print(
                          '[SERIES_COVER_WIDGET] Error creating MemoryImage: $e',
                        );
                      }
                      return null;
                    }
                  }(),
                ),
                child: Container(
                  color: Colors.black.withOpacity(0.3), // Darken background
                ),
              ),
            // Main cover image
            () {
              // Validate image data before attempting to create Image.memory
              if (!_isValidImageData(book.media.coverBytes!)) {
                if (kDebugMode) {
                  print(
                    '[SERIES_COVER_WIDGET] Invalid image data (composite) for book: ${book.media.metadata?.title}',
                  );
                }
                return Container(
                  width: coverWidth,
                  height: coverHeight,
                  color: Colors.grey[300],
                  child: Icon(Icons.library_music, size: 48),
                );
              }

              try {
                if (kDebugMode) {
                  print(
                    '[SERIES_COVER_WIDGET] Attempting to create Image.memory (composite) for book: ${book.media.metadata?.title}',
                  );
                }
                return Image.memory(
                  Uint8List.fromList(book.media.coverBytes!.cast<int>()),
                  width: coverWidth,
                  height: coverHeight,
                  fit: _shouldShowCoverBackground(book)
                      ? BoxFit.contain
                      : BoxFit.cover,
                  errorBuilder: (context, error, stackTrace) {
                    if (kDebugMode) {
                      print(
                        '[SERIES_COVER_WIDGET] Image.memory errorBuilder triggered (composite) for book: ${book.media.metadata?.title}',
                      );
                    }
                    return Container(
                      width: coverWidth,
                      height: coverHeight,
                      color: Colors.grey[300],
                      child: Icon(Icons.library_music, size: 48),
                    );
                  },
                );
              } catch (e) {
                if (kDebugMode) {
                  print(
                    '[SERIES_COVER_WIDGET] Error creating Image.memory (composite) for book ${book.media.metadata?.title}: $e',
                  );
                  print('[SERIES_COVER_WIDGET] Error type: ${e.runtimeType}');
                  print(
                    '[SERIES_COVER_WIDGET] CoverBytes first 20 bytes: ${book.media.coverBytes!.take(20).toList()}',
                  );
                }
                return Container(
                  width: coverWidth,
                  height: coverHeight,
                  color: Colors.grey[300],
                  child: Icon(Icons.library_music, size: 48),
                );
              }
            }(),
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
