import 'package:audiobookshelf_flutter/database/author_entity.dart';
import 'package:audiobookshelf_flutter/provider/author_image_provider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorCard extends ConsumerStatefulWidget {
  final AuthorEntity author;
  final VoidCallback? onTap;
  final bool isCompact;

  const AuthorCard({
    super.key,
    required this.author,
    this.onTap,
    this.isCompact = false,
  });

  @override
  ConsumerState<AuthorCard> createState() => _AuthorCardState();
}

class _AuthorCardState extends ConsumerState<AuthorCard> {
  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    // Watch the author image provider
    final authorImageState =
        ref.watch(authorImageProvider(widget.author.authorId));
    final authorImageNotifier =
        ref.read(authorImageProvider(widget.author.authorId).notifier);

    // Check for cached image on first build, and download if not available
    ref.listen(authorImageProvider(widget.author.authorId), (previous, next) {
      if (previous?.maybeWhen(initial: () => true, orElse: () => false) ==
              true &&
          next.maybeWhen(initial: () => true, orElse: () => false)) {
        // First time loading, check for cached image
        authorImageNotifier.checkCachedImage(widget.author.authorId).then((_) {
          // If no cached image found, trigger download
          if (authorImageNotifier.imageBytes == null) {
            authorImageNotifier.downloadImage();
          }
        });
      }
    });

    // Also trigger image check on first build
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted &&
          authorImageState.maybeWhen(
              initial: () => true, orElse: () => false)) {
        authorImageNotifier.checkCachedImage(widget.author.authorId).then((_) {
          if (mounted && authorImageNotifier.imageBytes == null) {
            authorImageNotifier.downloadImage();
          }
        });
      }
    });

    if (widget.isCompact) {
      // Compact layout for grid view
      return Card(
        elevation: 2,
        shape: RoundedRectangleBorder(
          borderRadius: BorderRadius.circular(12),
        ),
        child: InkWell(
          onTap: widget.onTap,
          borderRadius: BorderRadius.circular(12),
          child: Padding(
            padding: const EdgeInsets.all(8), // Reduced padding
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                // Author image - larger to fill more space
                CircleAvatar(
                  radius:
                      28, // Increased from 32 to 28 to fit better in 80px height
                  backgroundColor: colorScheme.surfaceContainerHighest,
                  backgroundImage: authorImageState.maybeWhen(
                    completed: (imageBytes) {
                      if (kDebugMode) {
                        print(
                            '[AUTHOR_CARD] Attempting to create MemoryImage for author: ${widget.author.name} (ID: ${widget.author.authorId})');
                        print(
                            '[AUTHOR_CARD] ImageBytes length: ${imageBytes.length}');
                      }
                      try {
                        final memoryImage = MemoryImage(imageBytes);
                        if (kDebugMode) {
                          print(
                              '[AUTHOR_CARD] Successfully created MemoryImage for author: ${widget.author.name}');
                        }
                        return memoryImage;
                      } catch (e) {
                        if (kDebugMode) {
                          print(
                              '[AUTHOR_CARD] Error creating MemoryImage for author ${widget.author.name}: $e');
                          print('[AUTHOR_CARD] Error type: ${e.runtimeType}');
                          print(
                              '[AUTHOR_CARD] ImageBytes first 20 bytes: ${imageBytes.take(20).toList()}');
                        }
                        return null;
                      }
                    },
                    orElse: () => null,
                  ),
                  child: authorImageState.maybeWhen(
                    initial: () => Icon(
                      Icons.person,
                      color: colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                    downloading: () => SizedBox(
                      width: 28,
                      height: 28,
                      child: CircularProgressIndicator(
                        strokeWidth: 2,
                        valueColor: AlwaysStoppedAnimation<Color>(
                          colorScheme.onSurfaceVariant,
                        ),
                      ),
                    ),
                    error: (_) => Icon(
                      Icons.person,
                      color: colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                    completed: (_) => null,
                    orElse: () => Icon(
                      Icons.person,
                      color: colorScheme.onSurfaceVariant,
                      size: 28,
                    ),
                  ),
                ),
                const SizedBox(height: 4), // Reduced spacing
                // Author name
                Text(
                  widget.author.name,
                  style: theme.textTheme.bodySmall?.copyWith(
                    // Smaller text
                    fontWeight: FontWeight.bold,
                    color: colorScheme.onSurface,
                  ),
                  maxLines: 1, // Only 1 line to fit in 80px height
                  overflow: TextOverflow.ellipsis,
                  textAlign: TextAlign.center,
                ),
                if (widget.author.bookCount != null) ...[
                  const SizedBox(height: 2), // Reduced spacing
                  Text(
                    '${widget.author.bookCount} books',
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
            onTap: widget.onTap,
            borderRadius: BorderRadius.circular(12),
            child: Padding(
              padding: const EdgeInsets.all(12),
              child: Row(
                children: [
                  // Author image
                  CircleAvatar(
                    radius: 24,
                    backgroundColor: colorScheme.surfaceContainerHighest,
                    backgroundImage: authorImageState.maybeWhen(
                      completed: (imageBytes) {
                        if (kDebugMode) {
                          print(
                              '[AUTHOR_CARD] Attempting to create MemoryImage for author (horizontal): ${widget.author.name} (ID: ${widget.author.authorId})');
                          print(
                              '[AUTHOR_CARD] ImageBytes length: ${imageBytes.length}');
                        }
                        try {
                          final memoryImage = MemoryImage(imageBytes);
                          if (kDebugMode) {
                            print(
                                '[AUTHOR_CARD] Successfully created MemoryImage for author (horizontal): ${widget.author.name}');
                          }
                          return memoryImage;
                        } catch (e) {
                          if (kDebugMode) {
                            print(
                                '[AUTHOR_CARD] Error creating MemoryImage for author (horizontal) ${widget.author.name}: $e');
                            print('[AUTHOR_CARD] Error type: ${e.runtimeType}');
                            print(
                                '[AUTHOR_CARD] ImageBytes first 20 bytes: ${imageBytes.take(20).toList()}');
                          }
                          return null;
                        }
                      },
                      orElse: () => null,
                    ),
                    child: authorImageState.maybeWhen(
                      initial: () => Icon(
                        Icons.person,
                        color: colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                      downloading: () => SizedBox(
                        width: 24,
                        height: 24,
                        child: CircularProgressIndicator(
                          strokeWidth: 2,
                          valueColor: AlwaysStoppedAnimation<Color>(
                            colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                      error: (_) => Icon(
                        Icons.person,
                        color: colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                      completed: (_) => null,
                      orElse: () => Icon(
                        Icons.person,
                        color: colorScheme.onSurfaceVariant,
                        size: 24,
                      ),
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Author info
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Text(
                          widget.author.name,
                          style: theme.textTheme.titleMedium?.copyWith(
                            fontWeight: FontWeight.bold,
                            color: colorScheme.onSurface,
                          ),
                          maxLines: 1,
                          overflow: TextOverflow.ellipsis,
                        ),
                        if (widget.author.description?.isNotEmpty == true) ...[
                          const SizedBox(height: 4),
                          Text(
                            widget.author.description!,
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
                            if (widget.author.bookCount != null) ...[
                              Icon(
                                Icons.menu_book,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.author.bookCount} books',
                                style: theme.textTheme.bodySmall?.copyWith(
                                  color: colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ],
                            if (widget.author.seriesCount != null &&
                                widget.author.seriesCount! > 0) ...[
                              const SizedBox(width: 12),
                              Icon(
                                Icons.library_books,
                                size: 14,
                                color: colorScheme.onSurfaceVariant,
                              ),
                              const SizedBox(width: 4),
                              Text(
                                '${widget.author.seriesCount} series',
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
