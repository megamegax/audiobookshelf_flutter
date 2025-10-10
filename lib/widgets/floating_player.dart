import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/material.dart';
import 'package:flutter/services.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/widgets/wave_animation.dart';
import 'package:audiobookshelf_flutter/widgets/player_slider.dart';
import 'package:audiobookshelf_flutter/pages/player_overlay.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';

class FloatingPlayer extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final LibraryItemEntity libraryItem;
  final VoidCallback? onTap;

  const FloatingPlayer({
    super.key,
    required this.audioPlayer,
    required this.libraryItem,
    this.onTap,
  });

  @override
  ConsumerState<FloatingPlayer> createState() => _FloatingPlayerState();
}

class _FloatingPlayerState extends ConsumerState<FloatingPlayer>
    with TickerProviderStateMixin {
  late AnimationController _expandController;
  late AnimationController _waveController;
  late AnimationController _glowController;

  late Animation<double> _expandAnimation;
  late Animation<double> _waveAnimation;
  late Animation<double> _glowAnimation;
  late Animation<Offset> _slideAnimation;
  bool _isExpanded = false;

  @override
  void initState() {
    super.initState();

    // Expand animation controller
    _expandController = AnimationController(
      duration: const Duration(milliseconds: 400),
      vsync: this,
    );

    // Wave animation controller
    _waveController = AnimationController(
      duration: const Duration(milliseconds: 1000),
      vsync: this,
    );

    // Glow animation controller
    _glowController = AnimationController(
      duration: const Duration(milliseconds: 2000),
      vsync: this,
    );

    // Expand animation
    _expandAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _expandController, curve: Curves.easeOutCubic),
    );

    // Wave animation
    _waveAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _waveController, curve: Curves.easeInOut),
    );

    // Glow animation
    _glowAnimation = Tween<double>(begin: 0.0, end: 1.0).animate(
      CurvedAnimation(parent: _glowController, curve: Curves.easeInOut),
    );

    // Slide animation
    _slideAnimation = Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
        .animate(
          CurvedAnimation(
            parent: _expandController,
            curve: Curves.easeOutCubic,
          ),
        );

    // Listen to player state changes for animations
    widget.audioPlayer.playingStream.listen((playing) {
      if (playing) {
        _waveController.repeat();
        _glowController.repeat(reverse: true);
      } else {
        _waveController.stop();
        _glowController.stop();
      }
    });
  }

  @override
  void dispose() {
    _expandController.dispose();
    _waveController.dispose();
    _glowController.dispose();
    super.dispose();
  }

  void _toggleExpanded() {
    setState(() {
      _isExpanded = !_isExpanded;
    });

    if (_isExpanded) {
      _expandController.forward();
      HapticFeedback.mediumImpact();
    } else {
      _expandController.reverse();
      HapticFeedback.lightImpact();
    }
  }

  void _openFullPlayer() {
    HapticFeedback.heavyImpact();
    Navigator.of(context).push(
      PageRouteBuilder(
        pageBuilder: (context, animation, secondaryAnimation) {
          // Create a dummy MediaItem for now
          final mediaItem = MediaItem(
            id: widget.libraryItem.itemId,
            title: widget.libraryItem.media?.metadata?.title ?? 'Unknown Title',
            artist:
                widget.libraryItem.media?.metadata?.authorName ??
                'Unknown Author',
            duration: widget.libraryItem.media?.duration != null
                ? Duration(seconds: widget.libraryItem.media!.duration!.toInt())
                : null,
          );

          // Get PlayerService from provider
          final playerService = ref.read(playerServiceProvider);

          return PlayerOverlay(
            widget.audioPlayer,
            mediaItem,
            widget.libraryItem,
            playerService,
          );
        },
        transitionsBuilder: (context, animation, secondaryAnimation, child) {
          return SlideTransition(
            position: Tween<Offset>(begin: const Offset(0, 1), end: Offset.zero)
                .animate(
                  CurvedAnimation(
                    parent: animation,
                    curve: Curves.easeOutCubic,
                  ),
                ),
            child: child,
          );
        },
        transitionDuration: const Duration(milliseconds: 400),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPlaying = widget.audioPlayer.playing;
    final isExpanded = _isExpanded;

    return AnimatedBuilder(
      animation: Listenable.merge([
        _expandAnimation,
        _waveAnimation,
        _glowAnimation,
      ]),
      builder: (context, child) {
        final expandValue = _expandAnimation.value;
        final waveValue = _waveAnimation.value;
        final glowValue = _glowAnimation.value;

        return SlideTransition(
          position: _slideAnimation,
          child: Container(
            margin: const EdgeInsets.all(16),
            child: GestureDetector(
              onTap: isExpanded ? _openFullPlayer : _toggleExpanded,
              onLongPress: _toggleExpanded,
              child: AnimatedContainer(
                duration: const Duration(milliseconds: 400),
                curve: Curves.easeOutCubic,
                height: isExpanded ? 120 : 80,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(isExpanded ? 24 : 40),
                  gradient: LinearGradient(
                    begin: Alignment.topLeft,
                    end: Alignment.bottomRight,
                    colors: [
                      colorScheme.surfaceContainerHigh.withOpacity(0.9),
                      colorScheme.surfaceContainerHighest.withOpacity(0.8),
                    ],
                  ),
                  boxShadow: [
                    // Base shadow
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 16,
                      offset: const Offset(0, 8),
                    ),
                    // Glow shadow
                    if (isPlaying)
                      BoxShadow(
                        color: colorScheme.primary.withOpacity(0.3 * glowValue),
                        blurRadius: 24 * glowValue,
                        offset: const Offset(0, 0),
                      ),
                    // Morphing shadow
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(
                        0.15 * (1 + expandValue * 0.5),
                      ),
                      blurRadius: 20 * (1 + expandValue * 0.3),
                      offset: Offset(0, 12 * (1 + expandValue * 0.2)),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(isExpanded ? 24 : 40),
                  child: BackdropFilter(
                    filter: ImageFilter.blur(sigmaX: 10, sigmaY: 10),
                    child: Container(
                      decoration: BoxDecoration(
                        border: Border.all(
                          color: colorScheme.outline.withOpacity(0.1),
                          width: 1,
                        ),
                      ),
                      child: isExpanded
                          ? _buildExpandedContent()
                          : _buildCollapsedContent(),
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

  Widget _buildCollapsedContent() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPlaying = widget.audioPlayer.playing;

    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 12),
      child: Row(
        children: [
          // Cover image with wave animation
          AnimatedBuilder(
            animation: _waveAnimation,
            builder: (context, child) {
              return Container(
                width: 56,
                height: 56,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(16),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(
                        0.2 * _waveAnimation.value,
                      ),
                      blurRadius: 8 * _waveAnimation.value,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(16),
                  child:
                      widget.libraryItem.media?.coverBytes?.isNotEmpty == true
                      ? Image.memory(
                          Uint8List.fromList(
                            widget.libraryItem.media!.coverBytes!,
                          ),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colorScheme.primaryContainer,
                                    colorScheme.secondaryContainer,
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.library_music,
                                color: colorScheme.onPrimaryContainer,
                              ),
                            );
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primaryContainer,
                                colorScheme.secondaryContainer,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.library_music,
                            color: colorScheme.onPrimaryContainer,
                          ),
                        ),
                ),
              );
            },
          ),

          const SizedBox(width: 16),

          // Title and author
          Expanded(
            child: Column(
              mainAxisAlignment: MainAxisAlignment.center,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  widget.libraryItem.media?.metadata?.title ?? 'Unknown Title',
                  style: theme.textTheme.titleSmall!.copyWith(
                    fontWeight: FontWeight.w600,
                    color: colorScheme.onSurface,
                    letterSpacing: -0.2,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
                const SizedBox(height: 2),
                Text(
                  widget.libraryItem.media?.metadata?.authorName ??
                      'Unknown Author',
                  style: theme.textTheme.bodySmall!.copyWith(
                    fontWeight: FontWeight.w500,
                    color: colorScheme.onSurfaceVariant,
                    letterSpacing: 0.1,
                  ),
                  maxLines: 1,
                  overflow: TextOverflow.ellipsis,
                ),
              ],
            ),
          ),

          // Play/Pause button with wave animation
          AnimatedBuilder(
            animation: _waveAnimation,
            builder: (context, child) {
              return Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.primary.withOpacity(
                        0.3 * _waveAnimation.value,
                      ),
                      blurRadius: 12 * _waveAnimation.value,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(24),
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      if (isPlaying) {
                        widget.audioPlayer.pause();
                      } else {
                        widget.audioPlayer.play();
                      }
                    },
                    child: Center(
                      child: isPlaying
                          ? WaveAnimation(
                              isPlaying: true,
                              color: colorScheme.onPrimary,
                              height: 20,
                              barCount: 3,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: colorScheme.onPrimary,
                              size: 24,
                            ),
                    ),
                  ),
                ),
              );
            },
          ),
        ],
      ),
    );
  }

  Widget _buildExpandedContent() {
    final theme = Theme.of(context);
    final colorScheme = theme.colorScheme;
    final isPlaying = widget.audioPlayer.playing;

    return Padding(
      padding: const EdgeInsets.all(16),
      child: Column(
        children: [
          // Top row with cover and info
          Row(
            children: [
              // Cover image
              Container(
                width: 48,
                height: 48,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(12),
                  boxShadow: [
                    BoxShadow(
                      color: colorScheme.shadow.withOpacity(0.1),
                      blurRadius: 8,
                      offset: const Offset(0, 4),
                    ),
                  ],
                ),
                child: ClipRRect(
                  borderRadius: BorderRadius.circular(12),
                  child:
                      widget.libraryItem.media?.coverBytes?.isNotEmpty == true
                      ? Image.memory(
                          Uint8List.fromList(
                            widget.libraryItem.media!.coverBytes!,
                          ),
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              decoration: BoxDecoration(
                                gradient: LinearGradient(
                                  colors: [
                                    colorScheme.primaryContainer,
                                    colorScheme.secondaryContainer,
                                  ],
                                ),
                              ),
                              child: Icon(
                                Icons.library_music,
                                color: colorScheme.onPrimaryContainer,
                                size: 24,
                              ),
                            );
                          },
                        )
                      : Container(
                          decoration: BoxDecoration(
                            gradient: LinearGradient(
                              colors: [
                                colorScheme.primaryContainer,
                                colorScheme.secondaryContainer,
                              ],
                            ),
                          ),
                          child: Icon(
                            Icons.library_music,
                            color: colorScheme.onPrimaryContainer,
                            size: 24,
                          ),
                        ),
                ),
              ),

              const SizedBox(width: 12),

              // Title and author
              Expanded(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Text(
                      widget.libraryItem.media?.metadata?.title ??
                          'Unknown Title',
                      style: theme.textTheme.titleSmall!.copyWith(
                        fontWeight: FontWeight.w600,
                        color: colorScheme.onSurface,
                        letterSpacing: -0.2,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                    Text(
                      widget.libraryItem.media?.metadata?.authorName ??
                          'Unknown Author',
                      style: theme.textTheme.bodySmall!.copyWith(
                        fontWeight: FontWeight.w500,
                        color: colorScheme.onSurfaceVariant,
                        letterSpacing: 0.1,
                      ),
                      maxLines: 1,
                      overflow: TextOverflow.ellipsis,
                    ),
                  ],
                ),
              ),

              // Play/Pause button
              Container(
                width: 40,
                height: 40,
                decoration: BoxDecoration(
                  shape: BoxShape.circle,
                  gradient: LinearGradient(
                    colors: [
                      colorScheme.primary,
                      colorScheme.primary.withOpacity(0.8),
                    ],
                  ),
                ),
                child: Material(
                  color: Colors.transparent,
                  child: InkWell(
                    borderRadius: BorderRadius.circular(20),
                    onTap: () {
                      HapticFeedback.mediumImpact();
                      if (isPlaying) {
                        widget.audioPlayer.pause();
                      } else {
                        widget.audioPlayer.play();
                      }
                    },
                    child: Center(
                      child: isPlaying
                          ? WaveAnimation(
                              isPlaying: true,
                              color: colorScheme.onPrimary,
                              height: 16,
                              barCount: 3,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: colorScheme.onPrimary,
                              size: 20,
                            ),
                    ),
                  ),
                ),
              ),
            ],
          ),

          const SizedBox(height: 12),

          // Progress slider
          StreamBuilder<Duration?>(
            stream: widget.audioPlayer.positionStream,
            builder: (context, positionSnapshot) {
              final position = positionSnapshot.data ?? Duration.zero;

              return StreamBuilder<Duration?>(
                stream: widget.audioPlayer.durationStream,
                builder: (context, durationSnapshot) {
                  final duration = durationSnapshot.data ?? Duration.zero;
                  final progress = duration.inMilliseconds > 0
                      ? position.inMilliseconds / duration.inMilliseconds
                      : 0.0;

                  return PlayerSlider(
                    audioPlayer: widget.audioPlayer,
                    playerService: ref.read(
                      playerServiceProvider,
                    ), // Get PlayerService from provider
                    progress: progress,
                  );
                },
              );
            },
          ),
        ],
      ),
    );
  }
}
