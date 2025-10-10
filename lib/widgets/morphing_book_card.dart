import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_item_new.dart';
import 'package:audiobookshelf_flutter/pages/book_details_wrapper.dart';
import 'package:audiobookshelf_flutter/provider/cover_image_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/selected_book_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:audiobookshelf_flutter/services/navigation_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class MorphingBookCard extends ConsumerStatefulWidget {
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
  ConsumerState<MorphingBookCard> createState() => _MorphingBookCardState();
}

class _MorphingBookCardState extends ConsumerState<MorphingBookCard>
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
    if (widget.libraryItem.media.coverBytes?.isNotEmpty == true) {
      if (kDebugMode) {
        print(
            '[MORPHING_BOOK_CARD] Attempting to create MemoryImage for book: ${widget.libraryItem.media.metadata?.title} (ID: ${widget.libraryItem.id})');
        print(
            '[MORPHING_BOOK_CARD] CoverBytes length: ${widget.libraryItem.media.coverBytes!.length}');
      }
      try {
        _cachedImageProvider = MemoryImage(
          Uint8List.fromList(widget.libraryItem.media.coverBytes!),
        );
        if (kDebugMode) {
          print(
              '[MORPHING_BOOK_CARD] Successfully created MemoryImage for book: ${widget.libraryItem.media.metadata?.title}');
        }
      } catch (e) {
        if (kDebugMode) {
          print(
              '[MORPHING_BOOK_CARD] Error creating MemoryImage for book ${widget.libraryItem.id}: $e');
          print('[MORPHING_BOOK_CARD] Error type: ${e.runtimeType}');
          print(
              '[MORPHING_BOOK_CARD] CoverBytes first 20 bytes: ${widget.libraryItem.media.coverBytes!.take(20).toList()}');
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
    _shimmerController.dispose();
    super.dispose();
  }

  void _checkAndDownloadCover() {
    // Check if cover is missing and trigger download
    if (widget.libraryItem.media.coverBytes?.isEmpty != false) {
      _downloadCover();
    }
  }

  Future<void> _downloadCover() async {
    try {
      // Convert LibraryItemEntity to LibraryItemNew for the cover download
      final libraryItemNew = widget.libraryItem.toLibraryItemNew();

      // Trigger cover download
      await ref
          .read(coverImageProvider.notifier)
          .downloadCoverForItem(libraryItemNew);
    } catch (e) {
      if (kDebugMode) {
        print(
            '[MORPHING_BOOK_CARD] Error downloading cover for book ${widget.libraryItem.id}: $e');
      }
    }
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

    // Listen to cover image state changes and update cached image if needed
    ref.listen(coverImageProvider, (previous, next) {
      if (next.isCompleted &&
          next.itemId == widget.libraryItem.itemId &&
          next.coverBytes != null) {
        // Cover download completed, update cached image
        setState(() {
          try {
            _cachedImageProvider = MemoryImage(next.coverBytes!);
          } catch (e) {
            if (kDebugMode) {
              print(
                  '[MORPHING_BOOK_CARD] Error creating MemoryImage from downloaded cover: $e');
            }
            _cachedImageProvider = null;
          }
        });
      }
    });

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
                onTap: () async {
                  await _navigateToBookDetails(
                      context, ref, widget.libraryItem);
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
                                                value: widget.libraryItem.media
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
                                          widget.libraryItem.media.metadata
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
                                          widget.libraryItem.media.metadata
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

  Future<void> _navigateToBookDetails(BuildContext context, WidgetRef ref,
      LibraryItemEntity libraryItem) async {
    try {
      // Show loading indicator
      showDialog(
        context: context,
        barrierDismissible: false,
        builder: (context) => const Center(
          child: CircularProgressIndicator(),
        ),
      );

      // Get user model and library service
      final userModel = ref.read(userModelNotifierProvider);
      final libraryService = ref.read(libraryServiceProvider);

      if (userModel != null) {
        // Fetch detailed library item
        final detailedItem = await libraryService.fetchDetailedLibraryItem(
          userModel,
          libraryItem.itemId,
        );

        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();

        // Set the selected book in the provider with cover image
        final coverImageBytes = widget.libraryItem.media.coverBytes != null
            ? Uint8List.fromList(widget.libraryItem.media.coverBytes!)
            : null;
        ref.read(selectedBookProvider.notifier).selectBook(
              detailedItem,
              coverImageBytes: coverImageBytes,
            );

        // Navigate to book details with hero animation
        if (context.mounted) {
          final uniqueHeroTag = widget.heroTag ??
              'book-cover-${widget.libraryItem.id}-${widget.hashCode}';
          NavigationService.pushWithHero(
            context,
            BookDetailsWrapper(
              item: widget.libraryItem,
              heroTag: uniqueHeroTag,
            ),
            uniqueHeroTag,
          );
        }
      } else {
        // Close loading dialog
        if (context.mounted) Navigator.of(context).pop();
        // Handle no user case
        if (context.mounted) {
          ScaffoldMessenger.of(context).showSnackBar(
            const SnackBar(content: Text('User not logged in')),
          );
        }
      }
    } catch (e) {
      // Close loading dialog
      if (context.mounted) Navigator.of(context).pop();
      // Handle error
      if (context.mounted) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(content: Text('Error loading book details: $e')),
        );
      }
    }
  }
}
