import 'dart:async';
import 'dart:io';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/player_overlay.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:audiobookshelf_flutter/widgets/player_slider.dart';
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
    _mediaItem = widget.source.sequence[0].tag as MediaItem;
    _libraryItem = _mediaItem.extras!['item'] as LibraryItemEntity;
    _audioPlayer = ref.read(audioPlayerProvider);
    _playerService = ref.read(playerServiceProvider);
    metaSubscription = _audioPlayer.playerStateStream.listen((event) {
      setState(() {
        _mediaItem = widget.source.sequence[0].tag as MediaItem;
        _libraryItem = _mediaItem.extras!['item'] as LibraryItemEntity;
      });
    });
    subscription = _audioPlayer.positionStream.listen((event) {
      setState(() {
        if (event.inSeconds == 0) {
          progress = 0;
        } else {
          progress = event.inSeconds / (_audioPlayer.duration!.inSeconds);
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
    metaSubscription.cancel();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: Platform.isIOS ? 180 : 160,
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
                const SizedBox(height: 12),
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
                          "-${durationToReadable(Duration(seconds: (_mediaItem.duration ?? Duration.zero).inSeconds - (_audioPlayer.position.inSeconds).round()))}",
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
                    // Progress slider
                    PlayerSlider(
                      audioPlayer: _audioPlayer,
                      progress: progress,
                      playerService: _playerService,
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
