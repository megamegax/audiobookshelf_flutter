import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/bookmarks_dialog.dart';
import 'package:audiobookshelf_flutter/widgets/playback_speed_button.dart';
import 'package:audiobookshelf_flutter/widgets/sleep_timer_dialog.dart';
import 'package:audiobookshelf_flutter/provider/sleep_timer_provider.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/provider/player_overlay_notifier.dart';

import 'package:audiobookshelf_flutter/widgets/full_screen_wavy_progress_bar.dart';
import 'dart:ui';
import 'dart:typed_data';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerOverlay extends ConsumerWidget {
  final AudioPlayer audioPlayer;
  final MediaItem mediaItem;
  final LibraryItemEntity libraryItem;
  final PlayerService playerService;

  const PlayerOverlay(
      this.audioPlayer, this.mediaItem, this.libraryItem, this.playerService,
      {super.key});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch the player overlay state
    final playerOverlayState = ref.watch(playerOverlayProvider(
      audioPlayer: audioPlayer,
      playerService: playerService,
      mediaItem: mediaItem,
    ));
    final playerOverlayNotifier = ref.read(playerOverlayProvider(
      audioPlayer: audioPlayer,
      playerService: playerService,
      mediaItem: mediaItem,
    ).notifier);

    // Watch the audio player state for play/pause
    final audioPlayerState = ref.watch(audioPlayerProvider);

    return Scaffold(
      backgroundColor: Colors.transparent,
      body: Stack(
        children: [
          // Blurred background image - covers entire screen
          Positioned.fill(
            child: mediaItem.extras!['coverBytes'] != null
                ? Stack(
                    children: [
                      // Full screen blurred background image
                      Container(
                        width: double.infinity,
                        height: double.infinity,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: MemoryImage(
                                mediaItem.extras!['coverBytes'] as Uint8List),
                            fit: BoxFit.cover,
                          ),
                        ),
                        child: BackdropFilter(
                          filter: ImageFilter.blur(sigmaX: 40, sigmaY: 40),
                          child: Container(
                            color: Theme.of(context)
                                .colorScheme
                                .surface
                                .withOpacity(0.7),
                          ),
                        ),
                      ),
                    ],
                  )
                : Container(
                    decoration: BoxDecoration(
                      gradient: LinearGradient(
                        begin: Alignment.topCenter,
                        end: Alignment.bottomCenter,
                        colors: [
                          Theme.of(context).colorScheme.surface,
                          Theme.of(context).colorScheme.surfaceContainerHighest,
                        ],
                      ),
                    ),
                    child: Center(
                      child: Hero(
                        tag: 'playerCover${libraryItem.itemId}',
                        child: Container(
                          width: 280,
                          height: 280,
                          decoration: BoxDecoration(
                            color: Theme.of(context)
                                .colorScheme
                                .surfaceContainerHighest,
                            borderRadius: BorderRadius.circular(20),
                            boxShadow: [
                              BoxShadow(
                                color: Theme.of(context)
                                    .colorScheme
                                    .shadow
                                    .withOpacity(0.3),
                                blurRadius: 30,
                                offset: const Offset(0, 10),
                              ),
                            ],
                          ),
                          child: Icon(
                            Icons.library_music,
                            size: 64,
                            color:
                                Theme.of(context).colorScheme.onSurfaceVariant,
                          ),
                        ),
                      ),
                    ),
                  ),
          ),
          // Main content with SafeArea
          SafeArea(
            child: Padding(
              padding: const EdgeInsets.all(24.0),
              child: Column(
                children: [
                  // Header with close button and controls
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
                        // Playback speed button
                        const PlaybackSpeedButton(),
                        const SizedBox(width: 8),
                        // Bookmarks button
                        IconButton(
                          icon: Icon(
                            Icons.bookmark,
                            color: Theme.of(context).colorScheme.onSurface,
                          ),
                          onPressed: () {
                            showDialog(
                              context: context,
                              builder: (context) => BookmarksDialog(
                                libraryItemId: libraryItem.itemId,
                                bookTitle: mediaItem.title,
                              ),
                            );
                          },
                        ),
                        // Sleep timer button
                        Consumer(
                          builder: (context, ref, child) {
                            final sleepTimerState =
                                ref.watch(sleepTimerProvider);
                            return IconButton(
                              icon: Icon(
                                Icons.bedtime,
                                color: sleepTimerState.isActive
                                    ? Theme.of(context).colorScheme.primary
                                    : Theme.of(context).colorScheme.onSurface,
                              ),
                              onPressed: () {
                                showDialog(
                                  context: context,
                                  builder: (context) =>
                                      const SleepTimerDialog(),
                                );
                              },
                            );
                          },
                        ),
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

                          const SizedBox(height: 24),

                          // Cover image
                          if (mediaItem.extras!['coverBytes'] != null)
                            Hero(
                              tag: 'fallbackPlayerCover${libraryItem.itemId}',
                              child: Container(
                                width: 200,
                                height: 200,
                                decoration: BoxDecoration(
                                  borderRadius: BorderRadius.circular(16),
                                  boxShadow: [
                                    BoxShadow(
                                      color: Colors.black.withOpacity(0.3),
                                      blurRadius: 20,
                                      offset: const Offset(0, 8),
                                    ),
                                  ],
                                ),
                                child: ClipRRect(
                                  borderRadius: BorderRadius.circular(16),
                                  child: Image.memory(
                                    mediaItem.extras!['coverBytes']
                                        as Uint8List,
                                    fit: BoxFit.cover,
                                    errorBuilder: (context, error, stackTrace) {
                                      return Container(
                                        color: Theme.of(context)
                                            .colorScheme
                                            .surfaceContainerHighest,
                                        child: Icon(
                                          Icons.library_music,
                                          size: 48,
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

                          if (mediaItem.extras!['coverBytes'] != null)
                            const SizedBox(height: 24),

                          // Title and author
                          Column(
                            mainAxisSize: MainAxisSize.min,
                            children: [
                              Text(
                                mediaItem.title,
                                style: Theme.of(context)
                                    .textTheme
                                    .headlineSmall
                                    ?.copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface,
                                      fontWeight: FontWeight.w600,
                                    ),
                                textAlign: TextAlign.center,
                                maxLines: 2,
                                overflow: TextOverflow.ellipsis,
                              ),
                              const SizedBox(height: 8),
                              Text(
                                mediaItem.displayDescription ?? '',
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

                          const SizedBox(height: 16),

                          // Sleep timer countdown (if active)
                          _SleepTimerCountdown(),

                          const SizedBox(height: 24),

                          // Progress section - using Riverpod
                          Column(
                            children: [
                              // Time display
                              Padding(
                                padding: const EdgeInsets.symmetric(
                                    horizontal: 16.0),
                                child: Row(
                                  children: [
                                    Text(
                                      durationToReadable(
                                          playerOverlayState.position),
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
                                      playerOverlayState.isChapterMode
                                          ? "-${durationToReadable(Duration(seconds: (playerOverlayState.currentChapterDuration.inSeconds - (playerOverlayState.position.inSeconds - playerService.currentTrackStartOffset().round())).clamp(0, playerOverlayState.currentChapterDuration.inSeconds)))}"
                                          : "-${durationToReadable(Duration(seconds: (playerOverlayState.duration.inSeconds - (playerOverlayState.position.inSeconds).round())))}",
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
                                playerService: playerService,
                                progress: playerOverlayState.isChapterMode
                                    ? playerOverlayState.chapterProgress
                                        .clamp(0.0, 1.0)
                                    : playerOverlayState.progress,
                                currentPosition: playerOverlayState.position,
                                totalDuration: playerOverlayState.isChapterMode
                                    ? playerOverlayState.currentChapterDuration
                                    : playerOverlayState.duration,
                                isChapterMode: playerOverlayState.isChapterMode,
                                onToggleMode: () {
                                  playerOverlayNotifier.toggleChapterMode();
                                },
                                onSeek: (seekProgress) {
                                  if (playerOverlayState.isChapterMode) {
                                    playerService
                                        .seekWithinCurrentTrack(seekProgress);
                                  } else {
                                    final seekPosition = Duration(
                                      seconds: ((playerOverlayState
                                                  .duration.inSeconds) *
                                              seekProgress)
                                          .round(),
                                    );
                                    audioPlayer.seek(seekPosition);
                                  }
                                  playerService.updateMediaProgress();
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
                                  color: playerService.hasPreviousChapter()
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
                                    color: playerService.hasPreviousChapter()
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.5),
                                  ),
                                  onPressed: playerService.hasPreviousChapter()
                                      ? () {
                                          playerService.previousChapter();
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
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  onPressed: () {
                                    playerService.skipBackward(10);
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
                                    audioPlayerState.isPlaying
                                        ? Icons.pause
                                        : Icons.play_arrow,
                                    color:
                                        Theme.of(context).colorScheme.onPrimary,
                                  ),
                                  onPressed: () async {
                                    if (audioPlayerState.isPlaying) {
                                      await ref
                                          .read(audioPlayerProvider.notifier)
                                          .pause();
                                      playerService.updateMediaProgress();
                                    } else {
                                      await ref
                                          .read(audioPlayerProvider.notifier)
                                          .play();
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
                                    color:
                                        Theme.of(context).colorScheme.onSurface,
                                  ),
                                  onPressed: () {
                                    playerService.skipForward(10);
                                  },
                                  iconSize: 28,
                                  padding: const EdgeInsets.all(16),
                                ),
                              ),

                              // Next chapter button
                              Container(
                                decoration: BoxDecoration(
                                  color: playerService.hasNextChapter()
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
                                    color: playerService.hasNextChapter()
                                        ? Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                        : Theme.of(context)
                                            .colorScheme
                                            .onSurface
                                            .withOpacity(0.5),
                                  ),
                                  onPressed: playerService.hasNextChapter()
                                      ? () {
                                          playerService.nextChapter();
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
        ],
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

// Separate widget for sleep timer countdown to avoid rebuilding the entire overlay
class _SleepTimerCountdown extends ConsumerWidget {
  const _SleepTimerCountdown();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTimerState = ref.watch(sleepTimerProvider);

    if (!sleepTimerState.isActive || sleepTimerState.remainingTime == null) {
      return const SizedBox.shrink();
    }

    final remaining = sleepTimerState.remainingTime!;
    final hours = remaining.inHours;
    final minutes = remaining.inMinutes.remainder(60);
    final seconds = remaining.inSeconds.remainder(60);

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 16, vertical: 8),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(20),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bedtime,
            size: 16,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 8),
          Text(
            'Sleep timer: ${hours.toString().padLeft(2, '0')}:${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.bodySmall?.copyWith(
                  color: Theme.of(context).colorScheme.onPrimaryContainer,
                  fontWeight: FontWeight.w500,
                  fontFamily: 'monospace',
                ),
          ),
        ],
      ),
    );
  }
}
