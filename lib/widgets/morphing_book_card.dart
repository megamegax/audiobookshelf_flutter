import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/book_details.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';

class MorphingBookCard extends StatefulWidget {
  final LibraryItemEntity libraryItem;
  final VoidCallback? onTap;
  final String? heroTag;

  const MorphingBookCard({
    super.key,
    required this.libraryItem,
    this.onTap,
    this.heroTag,
  });

  @override
  State<MorphingBookCard> createState() => _MorphingBookCardState();
}

class _MorphingBookCardState extends State<MorphingBookCard>
    with TickerProviderStateMixin {
  late AnimationController _hoverController;
  late AnimationController _pressController;
  late AnimationController _shimmerController;

  late Animation<double> _hoverAnimation;
  late Animation<double> _pressAnimation;
  late Animation<double> _shimmerAnimation;
  late Animation<Offset> _shadowAnimation;

  // Cache the image to prevent recreation during hover
  ImageProvider? _cachedImageProvider;

  @override
  void initState() {
    super.initState();

    // Hover animation controller
    _hoverController = AnimationController(
      duration: const Duration(milliseconds: 300),
      vsync: this,
    );

    // Press animation controller
    _pressController = AnimationController(
      duration: const Duration(milliseconds: 150),
      vsync: this,
    );

    // Shimmer animation controller
    _shimmerController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Hover animation
    _hoverAnimation = Tween<double>(
      begin: 0.0,
      end: 1.0,
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    // Press animation
    _pressAnimation = Tween<double>(
      begin: 1.0,
      end: 0.95,
    ).animate(CurvedAnimation(
      parent: _pressController,
      curve: Curves.easeInOut,
    ));

    // Shimmer animation
    _shimmerAnimation = Tween<double>(
      begin: -1.0,
      end: 2.0,
    ).animate(CurvedAnimation(
      parent: _shimmerController,
      curve: Curves.easeInOut,
    ));

    // Shadow animation
    _shadowAnimation = Tween<Offset>(
      begin: const Offset(0, 4),
      end: const Offset(0, 12),
    ).animate(CurvedAnimation(
      parent: _hoverController,
      curve: Curves.easeOutCubic,
    ));

    // Don't start shimmer animation automatically - only when needed

    // Cache the image provider to prevent recreation during hover
    if (widget.libraryItem.media?.coverBytes?.isNotEmpty == true) {
      _cachedImageProvider = MemoryImage(
        Uint8List.fromList(widget.libraryItem.media!.coverBytes!),
      );
    }
  }

  @override
  void dispose() {
    _hoverController.dispose();
    _pressController.dispose();
    _shimmerController.dispose();
    super.dispose();
  }

  void _handleHover(bool isHovered) {
    if (isHovered) {
      _hoverController.forward();
      _shimmerController.reset();
      _shimmerController.forward();
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

    return AnimatedBuilder(
      animation: Listenable.merge(
          [_hoverController, _pressController, _shimmerController]),
      builder: (context, child) {
        final hoverValue = _hoverAnimation.value;
        final pressValue = _pressAnimation.value;

        return Transform.scale(
          scale: pressValue,
          child: Container(
            width: 180,
            height: 280,
            margin: const EdgeInsets.all(8),
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
                      'book-cover-${widget.libraryItem.id}-${widget.hashCode}';
                  NavigationService.pushWithHero(
                    context,
                    BookDetails(
                      item: widget.libraryItem,
                    ),
                    uniqueHeroTag,
                  );
                },
                child: Container(
                  decoration: BoxDecoration(
                    borderRadius: BorderRadius.circular(20),
                    boxShadow: [
                      // Base shadow
                      BoxShadow(
                        color: colorScheme.shadow.withOpacity(0.08),
                        blurRadius: 8,
                        offset: const Offset(0, 4),
                      ),
                      // Hover shadow
                      if (hoverValue > 0)
                        BoxShadow(
                          color: colorScheme.primary
                              .withOpacity(0.15 * hoverValue),
                          blurRadius: 20 * hoverValue,
                          offset: Offset(0, 8 * hoverValue),
                        ),
                      // Morphing shadow
                      BoxShadow(
                        color: colorScheme.shadow
                            .withOpacity(0.12 * (1 + hoverValue)),
                        blurRadius: 16 * (1 + hoverValue * 0.5),
                        offset: _shadowAnimation.value,
                      ),
                    ],
                  ),
                  child: ClipRRect(
                    borderRadius: BorderRadius.circular(20),
                    child: Container(
                      decoration: BoxDecoration(
                        gradient: LinearGradient(
                          begin: Alignment.topLeft,
                          end: Alignment.bottomRight,
                          colors: [
                            colorScheme.surface,
                            colorScheme.surfaceContainerLow,
                          ],
                        ),
                      ),
                      child: Stack(
                        children: [
                          // Main content
                          Column(
                            crossAxisAlignment: CrossAxisAlignment.start,
                            children: [
                              // Cover image with morphing
                              Container(
                                height: 200,
                                child: Container(
                                  margin: const EdgeInsets.all(8),
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(16),
                                    boxShadow: [
                                      BoxShadow(
                                        color:
                                            colorScheme.shadow.withOpacity(0.1),
                                        blurRadius: 8,
                                        offset: const Offset(0, 4),
                                      ),
                                    ],
                                  ),
                                  child: ClipRRect(
                                    borderRadius: BorderRadius.circular(16),
                                    child: Stack(
                                      children: [
                                        // Cover image - always fill the entire area
                                        Positioned.fill(
                                          child: Hero(
                                            tag: widget.heroTag ??
                                                'book-cover-${widget.libraryItem.id}-${widget.hashCode}',
                                            child: _cachedImageProvider != null
                                                ? Image(
                                                    image:
                                                        _cachedImageProvider!,
                                                    fit: BoxFit.cover,
                                                    errorBuilder: (context,
                                                        error, stackTrace) {
                                                      return Container(
                                                        decoration:
                                                            BoxDecoration(
                                                          gradient:
                                                              LinearGradient(
                                                            begin: Alignment
                                                                .topLeft,
                                                            end: Alignment
                                                                .bottomRight,
                                                            colors: [
                                                              colorScheme
                                                                  .primaryContainer,
                                                              colorScheme
                                                                  .secondaryContainer,
                                                            ],
                                                          ),
                                                        ),
                                                        child: Icon(
                                                          Icons.library_music,
                                                          size: 48,
                                                          color: colorScheme
                                                              .onPrimaryContainer,
                                                        ),
                                                      );
                                                    },
                                                  )
                                                : Container(
                                                    decoration: BoxDecoration(
                                                      gradient: LinearGradient(
                                                        begin:
                                                            Alignment.topLeft,
                                                        end: Alignment
                                                            .bottomRight,
                                                        colors: [
                                                          colorScheme
                                                              .primaryContainer,
                                                          colorScheme
                                                              .secondaryContainer,
                                                        ],
                                                      ),
                                                    ),
                                                    child: Icon(
                                                      Icons.library_music,
                                                      size: 48,
                                                      color: colorScheme
                                                          .onPrimaryContainer,
                                                    ),
                                                  ),
                                          ),
                                        ),

                                        // Progress indicator with morphing
                                        if (widget.libraryItem.media.progress !=
                                            null)
                                          Positioned(
                                            bottom: 0,
                                            left: 0,
                                            right: 0,
                                            child: AnimatedContainer(
                                              duration: const Duration(
                                                  milliseconds: 300),
                                              height: 4,
                                              decoration: BoxDecoration(
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                  bottom: Radius.circular(16),
                                                ),
                                                boxShadow: [
                                                  BoxShadow(
                                                    color: colorScheme.primary
                                                        .withOpacity(0.3),
                                                    blurRadius: 4,
                                                    offset: const Offset(0, 2),
                                                  ),
                                                ],
                                              ),
                                              child: LinearProgressIndicator(
                                                value: widget.libraryItem.media!
                                                    .progress?.progress,
                                                backgroundColor:
                                                    Colors.transparent,
                                                valueColor:
                                                    AlwaysStoppedAnimation<
                                                        Color>(
                                                  colorScheme.primary,
                                                ),
                                                borderRadius:
                                                    const BorderRadius.vertical(
                                                  bottom: Radius.circular(16),
                                                ),
                                              ),
                                            ),
                                          ),

                                        // Shimmer effect overlay on top of the image
                                        if (_shimmerController.isAnimating)
                                          Positioned.fill(
                                            child: AnimatedBuilder(
                                              animation: _shimmerAnimation,
                                              builder: (context, child) {
                                                final shimmerValue =
                                                    _shimmerAnimation.value;
                                                return Container(
                                                  decoration: BoxDecoration(
                                                    gradient: LinearGradient(
                                                      begin: Alignment(
                                                          -1.0 + shimmerValue,
                                                          -1.0),
                                                      end: Alignment(
                                                          1.0 + shimmerValue,
                                                          1.0),
                                                      colors: [
                                                        Colors.transparent,
                                                        Colors.transparent,
                                                        Colors.white
                                                            .withOpacity(0.3),
                                                        Colors.transparent,
                                                        Colors.transparent,
                                                      ],
                                                      stops: const [
                                                        0.0,
                                                        0.4,
                                                        0.5,
                                                        0.6,
                                                        1.0
                                                      ],
                                                    ),
                                                  ),
                                                );
                                              },
                                            ),
                                          ),
                                      ],
                                    ),
                                  ),
                                ),
                              ),

                              // Text content with morphing
                              Container(
                                height: 75,
                                child: Padding(
                                  padding:
                                      const EdgeInsets.fromLTRB(12, 6, 12, 6),
                                  child: Column(
                                    crossAxisAlignment:
                                        CrossAxisAlignment.start,
                                    mainAxisSize: MainAxisSize.min,
                                    children: [
                                      // Title with morphing
                                      AnimatedDefaultTextStyle(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        style: theme.textTheme.titleMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w600,
                                          color: colorScheme.onSurface,
                                          letterSpacing: -0.2,
                                          height: 1.1,
                                        ),
                                        child: Text(
                                          widget.libraryItem.media?.metadata
                                                  ?.title ??
                                              'Unknown Title',
                                          maxLines: 2,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),

                                      const SizedBox(height: 6),

                                      // Author with morphing
                                      AnimatedDefaultTextStyle(
                                        duration:
                                            const Duration(milliseconds: 300),
                                        style: theme.textTheme.bodyMedium!
                                            .copyWith(
                                          fontWeight: FontWeight.w500,
                                          color: colorScheme.onSurfaceVariant,
                                          letterSpacing: 0.1,
                                          height: 1.5,
                                        ),
                                        child: Text(
                                          widget.libraryItem.media?.metadata
                                                  ?.authorName ??
                                              'Unknown Author',
                                          maxLines: 1,
                                          overflow: TextOverflow.ellipsis,
                                        ),
                                      ),
                                    ],
                                  ),
                                ),
                              ),
                            ],
                          ),

                          // Morphing border
                          AnimatedBuilder(
                            animation: _hoverAnimation,
                            builder: (context, child) {
                              if (_hoverAnimation.value == 0) {
                                return const SizedBox.shrink();
                              }
                              return Positioned.fill(
                                child: Container(
                                  decoration: BoxDecoration(
                                    borderRadius: BorderRadius.circular(20),
                                    border: Border.all(
                                      color: colorScheme.primary.withOpacity(
                                          0.3 * _hoverAnimation.value),
                                      width: 2,
                                    ),
                                  ),
                                ),
                              );
                            },
                          ),
                        ],
                      ),
                    ),
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
