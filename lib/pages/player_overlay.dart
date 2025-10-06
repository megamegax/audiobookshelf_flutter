import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';

import 'package:audiobookshelf_flutter/widgets/full_screen_wavy_progress_bar.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerOverlay extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final MediaItem mediaItem;
  final LibraryItemEntity libraryItem;
  final PlayerService playerService;

  const PlayerOverlay(
      this.audioPlayer, this.mediaItem, this.libraryItem, this.playerService,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerOverlayState();
}

class _PlayerOverlayState extends ConsumerState<PlayerOverlay> {
  double progress = 0;
  late StreamSubscription subscription;
  bool isChapterMode = true;
  Duration currentChapterDuration = Duration.zero;
  double chapterProgress = 0;

  @override
  void initState() {
    subscription = widget.audioPlayer.positionStream.listen((event) {
      setState(() {
        if (widget.audioPlayer.duration?.inSeconds == 0) {
          progress = 0;
          chapterProgress = 0;
        } else {
          progress = event.inSeconds / (widget.audioPlayer.duration!.inSeconds);
          // Calculate chapter progress
          final currentTrack = widget.playerService.currentTrack();
          if (currentTrack != null) {
            currentChapterDuration =
                Duration(seconds: currentTrack.duration?.round() ?? 0);
            final trackStartOffset =
                widget.playerService.currentTrackStartOffset();
            final currentTrackPosition = event.inSeconds - trackStartOffset;
            chapterProgress = currentChapterDuration.inSeconds > 0
                ? (currentTrackPosition / currentChapterDuration.inSeconds)
                    .clamp(0.0, 1.0)
                : 0;
          }
        }
      });
      if (event.inSeconds % 15 == 0) {
        ref.read(playerServiceProvider).sendProgressSync();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    subscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Theme.of(context).colorScheme.surface,
      body: SafeArea(
        child: Padding(
          padding: const EdgeInsets.all(24.0),
          child: Column(
            children: [
              // Header with close button
              SizedBox(
                height: 56,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(
                        Icons.keyboard_arrow_down,
                        size: 32,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      onPressed: () {
                        Navigator.of(context).pop();
                      },
                    ),
                    const Spacer(),
                    IconButton(
                      icon: Icon(
                        Icons.more_vert,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      onPressed: () {
                        // TODO: Show more options
                      },
                    ),
                  ],
                ),
              ),

              // Main scrollable content
              Expanded(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      const SizedBox(height: 16),

                      // Cover image with Hero animation
                      ConstrainedBox(
                        constraints: const BoxConstraints(
                          minHeight: 180,
                          maxHeight: 280,
                        ),
                        child: AspectRatio(
                          aspectRatio: 1.0,
                          child: Hero(
                            tag: 'playerCover${widget.libraryItem.itemId}',
                            child: Container(
                              decoration: BoxDecoration(
                                borderRadius: BorderRadius.circular(16),
                                boxShadow: [
                                  BoxShadow(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .shadow
                                        .withOpacity(0.2),
                                    blurRadius: 20,
                                    offset: const Offset(0, 8),
                                  ),
                                ],
                              ),
                              child: ClipRRect(
                                borderRadius: BorderRadius.circular(16),
                                child: Image.memory(
                                  widget.mediaItem.extras!['coverBytes']
                                      as Uint8List,
                                  fit: BoxFit.cover,
                                  errorBuilder: (context, error, stackTrace) {
                                    return Container(
                                      decoration: BoxDecoration(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        borderRadius: BorderRadius.circular(16),
                                      ),
                                      child: Icon(
                                        Icons.library_music,
                                        size: 64,
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                      ),
                                    );
                                  },
                                ),
                              ),
                            ),
                          ),
                        ),
                      ),

                      const SizedBox(height: 24),

                      // Title and author
                      Column(
                        mainAxisSize: MainAxisSize.min,
                        children: [
                          Text(
                            widget.mediaItem.title,
                            style: Theme.of(context)
                                .textTheme
                                .headlineSmall
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 2,
                            overflow: TextOverflow.ellipsis,
                          ),
                          const SizedBox(height: 8),
                          Text(
                            widget.mediaItem.displayDescription ?? '',
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontWeight: FontWeight.w400,
                                ),
                            textAlign: TextAlign.center,
                            maxLines: 1,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Progress section
                      Column(
                        children: [
                          // Time display
                          Padding(
                            padding:
                                const EdgeInsets.symmetric(horizontal: 16.0),
                            child: Row(
                              children: [
                                Text(
                                  durationToReadable(
                                      widget.audioPlayer.position),
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        fontFamily: 'monospace',
                                      ),
                                ),
                                const Spacer(),
                                Text(
                                  isChapterMode
                                      ? "-${durationToReadable(Duration(seconds: (currentChapterDuration.inSeconds - (widget.audioPlayer.position.inSeconds - widget.playerService.currentTrackStartOffset().round())).clamp(0, currentChapterDuration.inSeconds)))}"
                                      : "-${durationToReadable(Duration(seconds: (widget.mediaItem.duration ?? Duration.zero).inSeconds - (widget.audioPlayer.position.inSeconds).round()))}",
                                  style: Theme.of(context)
                                      .textTheme
                                      .bodyMedium
                                      ?.copyWith(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .onSurfaceVariant,
                                        fontFamily: 'monospace',
                                      ),
                                ),
                              ],
                            ),
                          ),

                          const SizedBox(height: 16),

                          // Enhanced wavy progress bar with toggle
                          FullScreenWavyProgressBar(
                            playerService: widget.playerService,
                            progress: isChapterMode
                                ? chapterProgress.clamp(0.0, 1.0)
                                : progress,
                            currentPosition: widget.audioPlayer.position,
                            totalDuration: isChapterMode
                                ? currentChapterDuration
                                : (widget.mediaItem.duration ?? Duration.zero),
                            isChapterMode: isChapterMode,
                            onToggleMode: () {
                              setState(() {
                                isChapterMode = !isChapterMode;
                              });
                            },
                            onSeek: (seekProgress) {
                              if (isChapterMode) {
                                widget.playerService
                                    .seekWithinCurrentTrack(seekProgress);
                              } else {
                                final seekPosition = Duration(
                                  seconds:
                                      ((widget.mediaItem.duration?.inSeconds ??
                                                  0) *
                                              seekProgress)
                                          .round(),
                                );
                                widget.audioPlayer.seek(seekPosition);
                              }
                              widget.playerService.updateMediaProgress();
                            },
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),

                      // Control buttons
                      Row(
                        mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                        children: [
                          // Previous chapter button
                          Container(
                            decoration: BoxDecoration(
                              color: widget.playerService.hasPreviousChapter()
                                  ? Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                  : Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.skip_previous,
                                color: widget.playerService.hasPreviousChapter()
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                              ),
                              onPressed: widget.playerService
                                      .hasPreviousChapter()
                                  ? () {
                                      widget.playerService.previousChapter();
                                    }
                                  : null,
                              iconSize: 24,
                              padding: const EdgeInsets.all(12),
                            ),
                          ),

                          // Previous 10s button
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.replay_10,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                widget.playerService.skipBackward(10);
                              },
                              iconSize: 28,
                              padding: const EdgeInsets.all(16),
                            ),
                          ),

                          // Play/Pause button
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context).colorScheme.primary,
                              shape: BoxShape.circle,
                              boxShadow: [
                                BoxShadow(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .shadow
                                      .withOpacity(0.3),
                                  blurRadius: 16,
                                  offset: const Offset(0, 4),
                                ),
                              ],
                            ),
                            child: IconButton(
                              icon: Icon(
                                widget.audioPlayer.playing
                                    ? Icons.pause
                                    : Icons.play_arrow,
                                color: Theme.of(context).colorScheme.onPrimary,
                              ),
                              onPressed: () async {
                                if (widget.audioPlayer.playing) {
                                  setState(() {
                                    widget.audioPlayer.pause();
                                  });
                                  widget.playerService.updateMediaProgress();
                                } else {
                                  setState(() {
                                    widget.audioPlayer.play();
                                  });
                                }
                              },
                              iconSize: 36,
                              padding: const EdgeInsets.all(20),
                            ),
                          ),

                          // Next 10s button
                          Container(
                            decoration: BoxDecoration(
                              color: Theme.of(context)
                                  .colorScheme
                                  .surfaceContainerHighest,
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.forward_10,
                                color: Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                widget.playerService.skipForward(10);
                              },
                              iconSize: 28,
                              padding: const EdgeInsets.all(16),
                            ),
                          ),

                          // Next chapter button
                          Container(
                            decoration: BoxDecoration(
                              color: widget.playerService.hasNextChapter()
                                  ? Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                  : Theme.of(context)
                                      .colorScheme
                                      .surfaceContainerHighest
                                      .withOpacity(0.5),
                              shape: BoxShape.circle,
                            ),
                            child: IconButton(
                              icon: Icon(
                                Icons.skip_next,
                                color: widget.playerService.hasNextChapter()
                                    ? Theme.of(context).colorScheme.onSurface
                                    : Theme.of(context)
                                        .colorScheme
                                        .onSurface
                                        .withOpacity(0.5),
                              ),
                              onPressed: widget.playerService.hasNextChapter()
                                  ? () {
                                      widget.playerService.nextChapter();
                                    }
                                  : null,
                              iconSize: 24,
                              padding: const EdgeInsets.all(12),
                            ),
                          ),
                        ],
                      ),

                      const SizedBox(height: 24),
                    ],
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  String durationToReadable(Duration duration) {
    String twoDigits(int n) {
      if (n >= 10) return "$n";
      return "0$n";
    }

    String twoDigitMinutes = twoDigits(duration.inMinutes.remainder(60));
    String twoDigitSeconds = twoDigits(duration.inSeconds.remainder(60));
    String formattedTime = "";

    if (duration.inHours > 0) {
      formattedTime += "${twoDigits(duration.inHours)}:";
    }
    formattedTime += "$twoDigitMinutes:$twoDigitSeconds";

    return formattedTime;
  }
}
