import 'dart:io';
import 'dart:typed_data';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/player_overlay.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';
import 'package:audiobookshelf_flutter/provider/sleep_timer_provider.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:audiobookshelf_flutter/widgets/wave_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:text_scroll/text_scroll.dart';

// Interactive progress bar widget for seeking
class ProgressBar extends ConsumerStatefulWidget {
  const ProgressBar({super.key});

  @override
  ConsumerState<ProgressBar> createState() => _ProgressBarState();
}

class _ProgressBarState extends ConsumerState<ProgressBar> {
  double? _dragValue;
  bool _isDragging = false;

  @override
  Widget build(BuildContext context) {
    final position = ref.watch(
      audioPlayerProvider.select((state) => state.position),
    );
    final duration = ref.watch(
      audioPlayerProvider.select((state) => state.duration),
    );

    final progress = duration?.inSeconds == null || duration!.inSeconds == 0
        ? 0.0
        : position.inSeconds / duration.inSeconds;

    final displayProgress = _isDragging ? (_dragValue ?? progress) : progress;

    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        trackHeight: 2.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 4.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 8.0),
        activeTrackColor: Theme.of(context).colorScheme.primary,
        inactiveTrackColor: Colors.white.withOpacity(0.3),
        thumbColor: Theme.of(context).colorScheme.primary,
      ),
      child: Slider(
        min: 0.0,
        max: 1.0,
        value: displayProgress.clamp(0.0, 1.0),
        onChanged: (value) {
          setState(() {
            _isDragging = true;
            _dragValue = value;
          });
        },
        onChangeEnd: (value) async {
          final playerService = ref.read(playerServiceProvider);
          await playerService.seekWithinCurrentTrack(value);
          playerService.updateMediaProgress();
          setState(() {
            _isDragging = false;
            _dragValue = null;
          });
        },
      ),
    );
  }
}

class Player extends ConsumerWidget {
  final AudioSource source;
  const Player({super.key, required this.source});

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    // Watch only the playing state to minimize rebuilds
    final isPlaying = ref.watch(
      audioPlayerProvider.select((state) => state.isPlaying),
    );

    // Watch position to get updates
    final position = ref.watch(
      audioPlayerProvider.select((state) => state.position),
    );

    // Read other values without watching to avoid constant rebuilds
    final audioPlayerNotifier = ref.read(audioPlayerProvider.notifier);
    final audioPlayer = audioPlayerNotifier.audioPlayer;
    final playerService = ref.read(playerServiceProvider);

    // Get media item and library item from the source
    final mediaItem = source.sequence[0].tag as MediaItem;
    final libraryItem = mediaItem.extras!['item'] as LibraryItemEntity;

    return Container(
      height: Platform.isIOS ? 220 : 200,
      margin: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: Padding(
          padding: const EdgeInsets.all(16.0),
          child: Column(
            children: [
              // Top row with cover, title, and play button
              Row(
                children: [
                  // Cover image with Hero animation and tap functionality
                  GestureDetector(
                    onTap: () {
                      Navigator.of(context).push(
                        FadePageRoute(
                          page: PlayerOverlay(
                            audioPlayer,
                            mediaItem,
                            libraryItem,
                            playerService,
                          ),
                        ),
                      );
                    },
                    child: Stack(
                      children: [
                        Hero(
                          tag: 'playerCover${libraryItem.itemId}',
                          child: ClipRRect(
                            borderRadius: BorderRadius.circular(8),
                            child: Image.memory(
                              mediaItem.extras!['coverBytes'] as Uint8List,
                              width: 56,
                              height: 56,
                              fit: BoxFit.cover,
                              errorBuilder: (context, error, stackTrace) {
                                return Container(
                                  width: 56,
                                  height: 56,
                                  decoration: BoxDecoration(
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.surfaceContainerHighest,
                                    borderRadius: BorderRadius.circular(8),
                                  ),
                                  child: Icon(
                                    Icons.library_music,
                                    color: Theme.of(
                                      context,
                                    ).colorScheme.onSurfaceVariant,
                                  ),
                                );
                              },
                            ),
                          ),
                        ),
                        // Tap indicator icon
                        Positioned(
                          top: 2,
                          right: 2,
                          child: Container(
                            width: 16,
                            height: 16,
                            decoration: BoxDecoration(
                              color: Theme.of(
                                context,
                              ).colorScheme.primary.withOpacity(0.8),
                              borderRadius: BorderRadius.circular(8),
                            ),
                            child: Icon(
                              Icons.open_in_full,
                              size: 10,
                              color: Theme.of(context).colorScheme.onPrimary,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  const SizedBox(width: 12),
                  // Title and author
                  Expanded(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        TextScroll(
                          mediaItem.title,
                          mode: TextScrollMode.bouncing,
                          velocity: const Velocity(
                            pixelsPerSecond: Offset(100, 0),
                          ),
                          delayBefore: const Duration(seconds: 1),
                          pauseBetween: const Duration(seconds: 1),
                          textAlign: TextAlign.left,
                          selectable: true,
                          style: Theme.of(context).textTheme.titleMedium
                              ?.copyWith(
                                color: Theme.of(context).colorScheme.onSurface,
                                fontWeight: FontWeight.w600,
                              ),
                        ),
                        const SizedBox(height: 2),
                        TextScroll(
                          mediaItem.displayDescription!,
                          mode: TextScrollMode.bouncing,
                          velocity: const Velocity(
                            pixelsPerSecond: Offset(50, 0),
                          ),
                          delayBefore: const Duration(seconds: 1),
                          pauseBetween: const Duration(seconds: 1),
                          textAlign: TextAlign.left,
                          selectable: true,
                          style: Theme.of(context).textTheme.bodyMedium
                              ?.copyWith(
                                color: Theme.of(
                                  context,
                                ).colorScheme.onSurfaceVariant,
                                fontWeight: FontWeight.w400,
                              ),
                        ),
                        const SizedBox(height: 4),
                        // Sleep timer and playback speed indicators
                        Row(
                          children: [
                            // Playback speed indicator
                            _PlaybackSpeedIndicator(),
                            // Sleep timer indicator
                            _SleepTimerIndicator(),
                          ],
                        ),
                      ],
                    ),
                  ),
                  // Play/Pause button with wave animation
                  Container(
                    decoration: BoxDecoration(
                      color: Theme.of(context).colorScheme.primary,
                      shape: BoxShape.circle,
                      boxShadow: [
                        BoxShadow(
                          color: Theme.of(
                            context,
                          ).colorScheme.shadow.withOpacity(0.2),
                          blurRadius: 8,
                          offset: const Offset(0, 2),
                        ),
                      ],
                    ),
                    child: IconButton(
                      onPressed: () async {
                        if (isPlaying) {
                          await ref.read(audioPlayerProvider.notifier).pause();
                          playerService.updateMediaProgress();
                        } else {
                          await ref.read(audioPlayerProvider.notifier).play();
                        }
                      },
                      icon: isPlaying
                          ? WaveAnimation(
                              isPlaying: true,
                              color: Theme.of(context).colorScheme.onPrimary,
                              height: 16,
                              barCount: 3,
                            )
                          : Icon(
                              Icons.play_arrow,
                              color: Theme.of(context).colorScheme.onPrimary,
                              size: 24,
                            ),
                      iconSize: 24,
                      padding: const EdgeInsets.all(12),
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Control buttons row
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  // Previous chapter button
                  IconButton(
                    onPressed: playerService.hasPreviousChapter()
                        ? () async => await playerService.previousChapter()
                        : null,
                    icon: Icon(
                      Icons.skip_previous,
                      size: 20,
                      color: playerService.hasPreviousChapter()
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.4),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  // Skip backward 10s
                  IconButton(
                    onPressed: () async => await playerService.skipBackward(10),
                    icon: Stack(
                      alignment: Alignment.center,
                      children: [
                        Icon(
                          Icons.replay_10,
                          size: 20,
                          color: Theme.of(context).colorScheme.onSurface,
                        ),
                      ],
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  // Skip forward 10s
                  IconButton(
                    onPressed: () async => await playerService.skipForward(10),
                    icon: Icon(
                      Icons.forward_10,
                      size: 20,
                      color: Theme.of(context).colorScheme.onSurface,
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                  // Next chapter button
                  IconButton(
                    onPressed: playerService.hasNextChapter()
                        ? () async => await playerService.nextChapter()
                        : null,
                    icon: Icon(
                      Icons.skip_next,
                      size: 20,
                      color: playerService.hasNextChapter()
                          ? Theme.of(context).colorScheme.onSurface
                          : Theme.of(
                              context,
                            ).colorScheme.onSurface.withOpacity(0.4),
                    ),
                    padding: EdgeInsets.zero,
                    constraints: const BoxConstraints(
                      minWidth: 32,
                      minHeight: 32,
                    ),
                  ),
                ],
              ),
              const SizedBox(height: 8),
              // Progress section
              Column(
                children: [
                  // Time display
                  Row(
                    children: [
                      Text(
                        durationToReadable(position),
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                      ),
                      const Spacer(),
                      Text(
                        "-${durationToReadable(Duration(seconds: (playerService.currentTrackDuration() - (position.inSeconds)).round().clamp(0, double.infinity).toInt()))}",
                        style: Theme.of(context).textTheme.bodySmall?.copyWith(
                          color: Theme.of(context).colorScheme.onSurfaceVariant,
                          fontFamily: 'monospace',
                        ),
                      ),
                    ],
                  ),
                  const SizedBox(height: 8),
                  // Progress bar
                  const ProgressBar(),
                ],
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

// Separate widget for playback speed indicator to avoid unnecessary rebuilds
class _PlaybackSpeedIndicator extends ConsumerWidget {
  const _PlaybackSpeedIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final playerState = ref.watch(playerServiceProvider);
    final speed = playerState.playbackSpeed;

    if (speed == 1.0) {
      return const SizedBox.shrink();
    }

    return Container(
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.secondaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Text(
        '${speed.toStringAsFixed(speed == speed.toInt() ? 0 : 2)}x',
        style: Theme.of(context).textTheme.labelSmall?.copyWith(
          color: Theme.of(context).colorScheme.onSecondaryContainer,
          fontWeight: FontWeight.w500,
        ),
      ),
    );
  }
}

// Separate widget for sleep timer indicator to avoid unnecessary rebuilds
class _SleepTimerIndicator extends ConsumerWidget {
  const _SleepTimerIndicator();

  @override
  Widget build(BuildContext context, WidgetRef ref) {
    final sleepTimerState = ref.watch(sleepTimerProvider);

    if (!sleepTimerState.isActive || sleepTimerState.remainingTime == null) {
      return const SizedBox.shrink();
    }

    final remaining = sleepTimerState.remainingTime!;
    final minutes = remaining.inMinutes;
    final seconds = remaining.inSeconds.remainder(60);

    return Container(
      margin: const EdgeInsets.only(left: 8),
      padding: const EdgeInsets.symmetric(horizontal: 6, vertical: 2),
      decoration: BoxDecoration(
        color: Theme.of(context).colorScheme.primaryContainer,
        borderRadius: BorderRadius.circular(8),
      ),
      child: Row(
        mainAxisSize: MainAxisSize.min,
        children: [
          Icon(
            Icons.bedtime,
            size: 12,
            color: Theme.of(context).colorScheme.onPrimaryContainer,
          ),
          const SizedBox(width: 4),
          Text(
            '${minutes.toString().padLeft(2, '0')}:${seconds.toString().padLeft(2, '0')}',
            style: Theme.of(context).textTheme.labelSmall?.copyWith(
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
