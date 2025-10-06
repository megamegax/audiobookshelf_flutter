import 'dart:async';
import 'dart:io';
import 'dart:developer' as dev;

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/player_overlay.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:audiobookshelf_flutter/widgets/wavy_progress_bar.dart';
import 'package:audiobookshelf_flutter/widgets/wave_animation.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter/widgets.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';
import 'package:text_scroll/text_scroll.dart';

class Player extends ConsumerStatefulWidget {
  final AudioSource source;
  const Player({super.key, required this.source});
  @override
  ConsumerState<Player> createState() => _PlayerState();
}

class _PlayerState extends ConsumerState<Player> {
  late AudioPlayer _audioPlayer;
  late MediaItem _mediaItem;
  late LibraryItemEntity _libraryItem;
  double progress = 0;
  late StreamSubscription subscription;
  late StreamSubscription metaSubscription;
  late PlayerService _playerService;
  @override
  void initState() {
    dev.log('[PLAYER_WIDGET] initState called');
    _mediaItem = widget.source.sequence[0].tag as MediaItem;
    _libraryItem = _mediaItem.extras!['item'] as LibraryItemEntity;
    _audioPlayer = ref.read(audioPlayerProvider);
    _playerService = ref.read(playerServiceProvider);

    dev.log('[PLAYER_WIDGET] Initialized with:');
    dev.log('[PLAYER_WIDGET] - Title: ${_mediaItem.title}');
    dev.log('[PLAYER_WIDGET] - Library Item ID: ${_libraryItem.itemId}');
    dev.log(
        '[PLAYER_WIDGET] - Audio Player State: ${_audioPlayer.playerState}');
    dev.log(
        '[PLAYER_WIDGET] - Has Audio Source: ${_audioPlayer.audioSource != null}');
    metaSubscription = _audioPlayer.playerStateStream.listen((event) {
      dev.log(
          '[PLAYER_WIDGET] Player state changed: ${event.processingState}, playing: ${event.playing}');
      setState(() {
        _mediaItem = widget.source.sequence[0].tag as MediaItem;
        _libraryItem = _mediaItem.extras!['item'] as LibraryItemEntity;
      });
    });
    subscription = _audioPlayer.positionStream.listen((event) {
      setState(() {
        final currentTrackDuration = _playerService.currentTrackDuration();
        if (event.inSeconds == 0 || currentTrackDuration <= 0) {
          progress = 0;
        } else {
          // Progress within the current track/chapter
          progress = event.inSeconds / currentTrackDuration;
        }
      });
      // Log progress every 30 seconds to avoid spam
      if (event.inSeconds % 30 == 0) {
        dev.log(
            '[PLAYER_WIDGET] Position: ${event.inSeconds}s, Progress: ${(progress * 100).toStringAsFixed(1)}%');
      }
      if (event.inSeconds % 15 == 0) {
        ref.read(playerServiceProvider).sendProgressSync();
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    dev.log('[PLAYER_WIDGET] dispose called - cleaning up subscriptions');
    subscription.cancel();
    metaSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    dev.log('[PLAYER_WIDGET] build() called - rendering player widget');
    dev.log('[PLAYER_WIDGET] Current playing state: ${_audioPlayer.playing}');
    dev.log(
        '[PLAYER_WIDGET] Current progress: ${(progress * 100).toStringAsFixed(1)}%');

    return Container(
      height: Platform.isIOS ? 220 : 200,
      margin: const EdgeInsets.all(8),
      child: Card(
        elevation: 0,
        margin: EdgeInsets.zero,
        child: InkWell(
          borderRadius: BorderRadius.circular(12),
          hoverColor: Colors.transparent,
          onTap: () {
            Navigator.of(context).push(
              FadePageRoute(
                  page: PlayerOverlay(
                      _audioPlayer, _mediaItem, _libraryItem, _playerService)),
            );
          },
          child: Padding(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              children: [
                // Top row with cover, title, and play button
                Row(
                  children: [
                    // Cover image with Hero animation
                    Hero(
                      tag: 'playerCover${_libraryItem.itemId}',
                      child: ClipRRect(
                        borderRadius: BorderRadius.circular(8),
                        child: Image.memory(
                          _mediaItem.extras!['coverBytes'] as Uint8List,
                          width: 56,
                          height: 56,
                          fit: BoxFit.cover,
                          errorBuilder: (context, error, stackTrace) {
                            return Container(
                              width: 56,
                              height: 56,
                              decoration: BoxDecoration(
                                color: Theme.of(context)
                                    .colorScheme
                                    .surfaceContainerHighest,
                                borderRadius: BorderRadius.circular(8),
                              ),
                              child: Icon(
                                Icons.library_music,
                                color: Theme.of(context)
                                    .colorScheme
                                    .onSurfaceVariant,
                                size: 24,
                              ),
                            );
                          },
                        ),
                      ),
                    ),
                    const SizedBox(width: 12),
                    // Title and author
                    Expanded(
                      child: Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          TextScroll(
                            _mediaItem.title,
                            mode: TextScrollMode.bouncing,
                            velocity:
                                const Velocity(pixelsPerSecond: Offset(100, 0)),
                            delayBefore: const Duration(seconds: 1),
                            pauseBetween: const Duration(seconds: 1),
                            textAlign: TextAlign.left,
                            selectable: true,
                            style: Theme.of(context)
                                .textTheme
                                .titleMedium
                                ?.copyWith(
                                  color:
                                      Theme.of(context).colorScheme.onSurface,
                                  fontWeight: FontWeight.w600,
                                ),
                          ),
                          const SizedBox(height: 2),
                          TextScroll(
                            _mediaItem.displayDescription!,
                            mode: TextScrollMode.bouncing,
                            velocity:
                                const Velocity(pixelsPerSecond: Offset(50, 0)),
                            delayBefore: const Duration(seconds: 1),
                            pauseBetween: const Duration(seconds: 1),
                            textAlign: TextAlign.left,
                            selectable: true,
                            style: Theme.of(context)
                                .textTheme
                                .bodyMedium
                                ?.copyWith(
                                  color: Theme.of(context)
                                      .colorScheme
                                      .onSurfaceVariant,
                                  fontWeight: FontWeight.w400,
                                ),
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
                            color: Theme.of(context)
                                .colorScheme
                                .shadow
                                .withOpacity(0.2),
                            blurRadius: 8,
                            offset: const Offset(0, 2),
                          ),
                        ],
                      ),
                      child: IconButton(
                        onPressed: () async {
                          if (_audioPlayer.playing) {
                            setState(() {
                              _audioPlayer.pause();
                            });
                            _playerService.updateMediaProgress();
                          } else {
                            setState(() {
                              _audioPlayer.play();
                            });
                          }
                        },
                        icon: _audioPlayer.playing
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
                      onPressed: _playerService.hasPreviousChapter()
                          ? () async => await _playerService.previousChapter()
                          : null,
                      icon: Icon(
                        Icons.skip_previous,
                        size: 20,
                        color: _playerService.hasPreviousChapter()
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.4),
                      ),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                    // Skip backward 10s
                    IconButton(
                      onPressed: () async =>
                          await _playerService.skipBackward(10),
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
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                    // Skip forward 10s
                    IconButton(
                      onPressed: () async =>
                          await _playerService.skipForward(10),
                      icon: Icon(
                        Icons.forward_10,
                        size: 20,
                        color: Theme.of(context).colorScheme.onSurface,
                      ),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
                    ),
                    // Next chapter button
                    IconButton(
                      onPressed: _playerService.hasNextChapter()
                          ? () async => await _playerService.nextChapter()
                          : null,
                      icon: Icon(
                        Icons.skip_next,
                        size: 20,
                        color: _playerService.hasNextChapter()
                            ? Theme.of(context).colorScheme.onSurface
                            : Theme.of(context)
                                .colorScheme
                                .onSurface
                                .withOpacity(0.4),
                      ),
                      padding: EdgeInsets.zero,
                      constraints:
                          const BoxConstraints(minWidth: 32, minHeight: 32),
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
                          durationToReadable(_audioPlayer.position),
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    fontFamily: 'monospace',
                                  ),
                        ),
                        const Spacer(),
                        Text(
                          "-${durationToReadable(Duration(seconds: (_playerService.currentTrackDuration() - (_audioPlayer.position.inSeconds)).round().clamp(0, double.infinity).toInt()))}",
                          style:
                              Theme.of(context).textTheme.bodySmall?.copyWith(
                                    color: Theme.of(context)
                                        .colorScheme
                                        .onSurfaceVariant,
                                    fontFamily: 'monospace',
                                  ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 8),
                    // Wavy progress bar
                    WavyProgressBar(
                      audioPlayer: _audioPlayer,
                      progress: progress,
                      playerService: _playerService,
                      height: 6.0,
                    ),
                  ],
                ),
              ],
            ),
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
