import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/provider/cover_image_provider.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class AuthorBookCard extends ConsumerStatefulWidget {
  final LibraryItemEntity libraryItem;
  final String? heroTag;

  const AuthorBookCard({
    super.key,
    required this.libraryItem,
    this.heroTag,
  });

  @override
  ConsumerState<AuthorBookCard> createState() => _AuthorBookCardState();
}

class _AuthorBookCardState extends ConsumerState<AuthorBookCard>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _pressController;

  late Animation<double> _hoverAnimation;
  late Animation<double> _pressAnimation;
  late Animation<Offset> _shadowAnimation;

  ImageProvider? _cachedImageProvider;

  @override
  void initState() {
    super.initState();

    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    _pressController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    _hoverAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    _pressAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));

    _shadowAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: const Offset(0, 12),
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    if (widget.libraryItem.media.coverBytes?.isNotEmpty == true) {
      try {
        _cachedImageProvider = MemoryImage(
          Uint8List.fromList(widget.libraryItem.media.coverBytes!),
        );
      } catch (e) {
        if (kDebugMode) {
          print(
              '[AUTHOR_BOOK_CARD] Error creating MemoryImage for book ${widget.libraryItem.id}: $e');
        }
        _cachedImageProvider = null;
      }
    }

    // Check if cover is missing and trigger download after the widget tree is built
    WidgetsBinding.instance.addPostFrameCallback((_) {
      if (mounted) {
        _checkAndDownloadCover();
      }
    });
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pressController.dispose();
    super.dispose();
  }

  void _checkAndDownloadCover() {
    if (widget.libraryItem.media.coverBytes?.isEmpty != false) {
      _downloadCover();
    }
  }

  Future<void> _downloadCover() async {
    try {
      final libraryItemNew = widget.libraryItem.toLibraryItemNew();

      await ref
          .read(coverImageProvider.notifier)
          .downloadCoverForItem(libraryItemNew);
    } catch (e) {
      if (kDebugMode) {
        print(
            '[AUTHOR_BOOK_CARD] Error downloading cover for book ${widget.libraryItem.id}: $e');
      }
    }
  }

  void _handleHover(bool isHovering) {
    if (isHovering) {
      _hoverController.forward();
    } else {
      _hoverController.reverse();
    }
  }

  void _handlePress(bool isPressed) {
    if (isPressed) {
      _pressController.forward();
    } else {
      _pressController.reverse();
    }
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;

    ref.listen(coverImageProvider, (previous, next) {
      if (next.isCompleted &&
          next.itemId == widget.libraryItem.itemId &&
          next.coverBytes != null) {
        setState(() {
          try {
            _cachedImageProvider = MemoryImage(next.coverBytes!);
          } catch (e) {
            if (kDebugMode) {
              print(
                  '[AUTHOR_BOOK_CARD] Error creating MemoryImage from downloaded cover: $e');
            }
            _cachedImageProvider = null;
          }
        });
      }
    });

    return AnimatedBuilder(
      animation: Listenable.merge([_hoverController, _pressController]),
      builder: (context, child) {
        final hoverValue = _hoverAnimation.value;
        final pressValue = _pressAnimation.value;

        return Transform.scale(
          scale: pressValue,
          child: Container(
            decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(16),
              color: colorScheme.surface,
              boxShadow: [
                BoxShadow(
                  color:
                      colorScheme.shadow.withOpacity(0.1 + (0.1 * hoverValue)),
                  blurRadius: 8 + (4 * hoverValue),
                  offset: _shadowAnimation.value,
                ),
              ],
            ),
            child: ClipRRect(
              borderRadius: BorderRadius.circular(16),
              child: MouseRegion(
                onEnter: (_) => _handleHover(true),
                onExit: (_) => _handleHover(false),
                cursor: SystemMouseCursors.click,
                child: GestureDetector(
                  onTapDown: (_) => _handlePress(true),
                  onTapUp: (_) => _handlePress(false),
                  onTapCancel: () => _handlePress(false),
                  onTap: () {
                    final uniqueHeroTag = widget.heroTag ??
                        'author-book-cover-${widget.libraryItem.id}-${widget.hashCode}';
                    NavigationService.pushWithHero(
                      context,
                      BookDetails(
                        item: widget.libraryItem,
                      ),
                      uniqueHeroTag,
                    );
                  },
                  child: Stack(
                    children: [
                      // Full-height cover image
                      Positioned.fill(
                        child: Hero(
                          tag: widget.heroTag ??
                              'author-book-cover-${widget.libraryItem.id}-${widget.hashCode}',
                          child: _cachedImageProvider != null
                              ? Image(
                                  image: _cachedImageProvider!,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      color:
                                          colorScheme.surfaceContainerHighest,
                                      child: Icon(
                                        Icons.library_music,
                                        size: 48,
                                        color: colorScheme.onSurfaceVariant,
                                      ),
                                    );
                                  },
                                )
                              : Container(
                                  color: colorScheme.surfaceContainerHighest,
                                  child: Icon(
                                    Icons.library_music,
                                    size: 48,
                                    color: colorScheme.onSurfaceVariant,
                                  ),
                                ),
                        ),
                      ),

                      // Loading indicator overlay
                      if (_cachedImageProvider == null)
                        Positioned.fill(
                          child: Container(
                            color: colorScheme.surfaceContainerHighest
                                .withOpacity(0.8),
                            child: Center(
                              child: CircularProgressIndicator(
                                valueColor: AlwaysStoppedAnimation<Color>(
                                  colorScheme.onSurfaceVariant,
                                ),
                              ),
                            ),
                          ),
                        ),

                      // Gradient overlay for better text readability
                      Positioned.fill(
                        child: Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              begin: Alignment.topCenter,
                              end: Alignment.bottomCenter,
                              colors: [
                                Colors.transparent,
                                Colors.transparent,
                                Colors.black.withOpacity(0.3),
                                Colors.black.withOpacity(0.7),
                              ],
                              stops: const [0.0, 0.4, 0.7, 1.0],
                            ),
                          ),
                        ),
                      ),

                      // Text overlay at the bottom
                      Positioned(
                        left: 12,
                        right: 12,
                        bottom: 12,
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          mainAxisSize: MainAxisSize.min,
                          children: [
                            Text(
                              widget.libraryItem.media.metadata?.title ??
                                  'Unknown Title',
                              style: theme.textTheme.titleSmall?.copyWith(
                                fontWeight: FontWeight.bold,
                                color: Colors.white,
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ],
                              ),
                              maxLines: 2,
                              overflow: TextOverflow.ellipsis,
                            ),
                            const SizedBox(height: 4),
                            Text(
                              widget.libraryItem.media.metadata?.authorName ??
                                  'Unknown Author',
                              style: theme.textTheme.bodySmall?.copyWith(
                                color: Colors.white.withOpacity(0.9),
                                shadows: [
                                  Shadow(
                                    offset: const Offset(0, 1),
                                    blurRadius: 2,
                                    color: Colors.black.withOpacity(0.8),
                                  ),
                                ],
                              ),
                              maxLines: 1,
                              overflow: TextOverflow.ellipsis,
                            ),
                          ],
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ),
          ),
        );
      },
    );
  }
}
