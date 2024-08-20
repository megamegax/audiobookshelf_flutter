import 'dart:async';
import 'dart:io';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/pages/player_overlay.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_page_route.dart';
import 'package:audiobookshelf_flutter/widgets/player_slider.dart';
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
    return SizedBox(
      height: Platform.isIOS ? 160 : 136,
      child: Hero(
        tag: "player",
        child: Card(
          child: InkWell(
            hoverColor: Colors.transparent,
            onTap: () {
              Navigator.of(context).push(
                FadePageRoute(
                    page: PlayerOverlay(_audioPlayer, _mediaItem, _libraryItem,
                        _playerService)),
              );
            },
            child: Padding(
              padding: const EdgeInsets.only(left: 16.0, top: 8),
              child: Column(
                children: [
                  Row(
                    children: [
                      Image.memory(
                          _mediaItem.extras!['coverBytes'] as Uint8List,
                          width: 48,
                          height: 48,
                          fit: BoxFit.cover),
                      const SizedBox(width: 8),
                      Expanded(
                        child: Column(
                          crossAxisAlignment: CrossAxisAlignment.start,
                          children: [
                            TextScroll(
                              _mediaItem.title,
                              mode: TextScrollMode.bouncing,
                              velocity: const Velocity(
                                  pixelsPerSecond: Offset(100, 0)),
                              delayBefore: const Duration(seconds: 1),
                              pauseBetween: const Duration(seconds: 1),
                              textAlign: TextAlign.left,
                              selectable: true,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleLarge!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                            TextScroll(
                              _mediaItem.displayDescription!,
                              mode: TextScrollMode.bouncing,
                              velocity: const Velocity(
                                  pixelsPerSecond: Offset(50, 0)),
                              delayBefore: const Duration(seconds: 1),
                              pauseBetween: const Duration(seconds: 1),
                              textAlign: TextAlign.left,
                              selectable: true,
                              style: Theme.of(context)
                                  .primaryTextTheme
                                  .titleMedium!
                                  .copyWith(
                                      color: Theme.of(context)
                                          .colorScheme
                                          .onSurface),
                            ),
                          ],
                        ),
                      ),
                      TextButton(
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () async {
                            setState(() {
                              if (_audioPlayer.position.inSeconds >= 10) {
                                _audioPlayer.seek(Duration(
                                    seconds: (_audioPlayer.position.inSeconds -
                                        10)));
                              } else {
                                _audioPlayer.seek(const Duration(seconds: 0));
                              }
                            });
                            _playerService.updateMediaProgress();
                          },
                          child: Icon(Icons.arrow_back_outlined,
                              color: Theme.of(context).colorScheme.onSurface)),
                      ElevatedButton(
                          style: ElevatedButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(20),
                          ),
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
                          child: Icon(
                              _audioPlayer.playing
                                  ? Icons.pause
                                  : Icons.play_arrow,
                              color: Colors.white)),
                      TextButton(
                          style: TextButton.styleFrom(
                            shape: const CircleBorder(),
                            padding: const EdgeInsets.all(10),
                          ),
                          onPressed: () async {
                            setState(() {
                              if (_audioPlayer.position.inSeconds + 10 <=
                                  _audioPlayer.duration!.inSeconds) {
                                _audioPlayer.seek(Duration(
                                    seconds: (_audioPlayer.position.inSeconds +
                                        10)));
                              } else {
                                _audioPlayer.seek(Duration(
                                    seconds: _audioPlayer.duration!.inSeconds));
                              }
                            });
                            _playerService.updateMediaProgress();
                          },
                          child: Icon(Icons.arrow_forward_outlined,
                              color: Theme.of(context).colorScheme.onSurface))
                    ],
                  ),
                  const SizedBox(height: 8),
                  Row(
                    children: [
                      Text(durationToReadable(_audioPlayer.position)),
                      const Spacer(),
                      Text(
                          "-${durationToReadable(Duration(seconds: (_mediaItem.duration ?? Duration.zero).inSeconds - (_audioPlayer.position.inSeconds).round()))}"),
                      const SizedBox(width: 16),
                    ],
                  ),
                  PlayerSlider(
                      audioPlayer: _audioPlayer,
                      progress: progress,
                      playerService: _playerService),
                  const SizedBox(height: 0),
                ],
              ),
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
