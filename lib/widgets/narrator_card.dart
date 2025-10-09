import 'dart:typed_data';
import 'package:audiobookshelf_flutter/database/narrator_entity.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';

class NarratorCard extends StatelessWidget {
  final NarratorEntity narrator;
  final VoidCallback? onTap;
  final bool isCompact;

  const NarratorCard({
    super.key,
    required this.narrator,
    this.onTap,
    this.isCompact = false,
  });

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    if (isCompact) {
      // Compact layout for grid view
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8), // Reduced padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Narrator image - larger to fill more space
                CircleAvatar(
                  radius:
                      28, // Increased from 32 to 28 to fit better in 80px height
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  backgroundImage: narrator.imageBytes?.isNotEmpty == true
                      ? () {
                          try {
                            return MemoryImage(
                                Uint8List.fromList(narrator.imageBytes!));
                          } catch (e) {
                            if (kDebugMode) {
                              print(
                                  '[NARRATOR_CARD] Error creating MemoryImage: $e');
                            }
                            return null;
                          }
                        }()
                      : null,
                  child: narrator.imageBytes?.isEmpty == true
                      ? Icon(
                          Icons.mic,
                          color: colorScheme.onSurfaceVariant,
                          size: 28,
                        )
                      : null,
                ),
                const SizedBox(height: 4), // Reduced spacing
                // Narrator name
                Text(
                  narrator.name,
                  style: theme.textTheme.bodySmall?.copyWith(
                    // Smaller text
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1, // Only 1 line to fit in 80px height
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (narrator.bookCount != null) ...[
                  const SizedBox(height: 2), // Reduced spacing
                  Text(
                    '${narrator.bookCount} books',
                    style: theme.textTheme.labelSmall?.copyWith(
                      // Even smaller text
                      color: colorScheme.onSurfaceVariant,
                    ),
                    textAlign: TextAlign.center,
                  ),
                ],
              ],
            ),
          ),
        ),
      );
    } else {
      // Horizontal layout for list view
      return SizedBox(
        width: 200, // Fixed width for horizontal scrolling
        child: Card(
          elevation: 2,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(12),
          ),
          child: InkWell(
            onTap: onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Narrator image
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    backgroundImage: narrator.imageBytes?.isNotEmpty == true
                        ? () {
                            try {
                              return MemoryImage(
                                  Uint8List.fromList(narrator.imageBytes!));
                            } catch (e) {
                              if (kDebugMode) {
                                print(
                                    '[NARRATOR_CARD] Error creating MemoryImage: $e');
                              }
                              return null;
                            }
                          }()
                        : null,
                    child: narrator.imageBytes?.isEmpty == true
                        ? Icon(
                            Icons.mic,
                            color: colorScheme.onSurfaceVariant,
                            size: 24,
                          )
                        : null,
                  ),
                  const SizedBox(width: 12),
                  // Narrator info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          narrator.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (narrator.description?.isNotEmpty == true) ...[
                          const SizedBox(height: 4),
                          Text(
                            narrator.description!,
                            style: theme.textTheme.bodySmall?.copyWith(
                              color: colorScheme.onSurfaceVariant,
                            ),
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                        const SizedBox(height: 4),
                        Row(
                          children: [
                            if (narrator.bookCount != null) ...[
                              Icon(
                                Icons.audiotrack,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${narrator.bookCount} books',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                            if (narrator.seriesCount != null &&
                                narrator.seriesCount! > 0) ...[
                              const SizedBox(width: 12),
                              Icon(
                                Icons.library_books,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${narrator.seriesCount} series',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                          ],
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
        ),
      );
    }
  }
}
