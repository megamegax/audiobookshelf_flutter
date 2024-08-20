import 'dart:async';

import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:audiobookshelf_flutter/widgets/player_slider.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerOverlay extends ConsumerStatefulWidget {
  AudioPlayer audioPlayer;
  MediaItem mediaItem;
  LibraryItemEntity libraryItem;
  PlayerService playerService;

  PlayerOverlay(
      this.audioPlayer, this.mediaItem, this.libraryItem, this.playerService,
      {super.key});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerOverlayState();
}

class _PlayerOverlayState extends ConsumerState<PlayerOverlay> {
  double progress = 0;
  late StreamSubscription subscription;

  @override
  void initState() {
    subscription = widget.audioPlayer.positionStream.listen((event) {
      setState(() {
        if (widget.audioPlayer.duration?.inSeconds == 0) {
          progress = 0;
        } else {
          progress = event.inSeconds / (widget.audioPlayer.duration!.inSeconds);
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
    return Hero(
      tag: "player",
      child: Card(
        child: Column(
          children: [
            Text(widget.mediaItem.title,
                style: Theme.of(context).textTheme.titleMedium),
            Row(
              children: [
                IconButton(
                  icon: const Icon(Icons.arrow_downward_rounded),
                  onPressed: () {
                    Navigator.of(context).pop();
                  },
                ),
                const Spacer()
              ],
            ),
            Card(
              elevation: 4,
              child: Image.memory(
                  widget.mediaItem.extras!['coverBytes'] as Uint8List,
                  width: 200,
                  height: 200,
                  fit: BoxFit.cover),
            ),
            const SizedBox(height: 16),
            Padding(
              padding: const EdgeInsets.only(left: 16.0),
              child: Row(
                children: [
                  Text(durationToReadable(widget.audioPlayer.position)),
                  const Spacer(),
                  Text(
                      "-${durationToReadable(Duration(seconds: (widget.mediaItem.duration ?? Duration.zero).inSeconds - (widget.audioPlayer.position.inSeconds).round()))}"),
                  const SizedBox(width: 16),
                ],
              ),
            ),
            PlayerSlider(
                audioPlayer: widget.audioPlayer,
                progress: progress,
                playerService: widget.playerService),
            const SizedBox(height: 32),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceAround,
              children: [
                TextButton(
                    style: TextButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(10),
                    ),
                    onPressed: () async {
                      setState(() {
                        if (widget.audioPlayer.position.inSeconds >= 10) {
                          widget.audioPlayer.seek(Duration(
                              seconds: (widget.audioPlayer.position.inSeconds -
                                  10)));
                        } else {
                          widget.audioPlayer.seek(const Duration(seconds: 0));
                        }
                      });
                      widget.playerService.updateMediaProgress();
                    },
                    child: Icon(Icons.arrow_back_outlined,
                        color: Theme.of(context).colorScheme.onSurface)),
                ElevatedButton(
                    style: ElevatedButton.styleFrom(
                      shape: const CircleBorder(),
                      padding: const EdgeInsets.all(20),
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
                    child: Icon(
                        widget.audioPlayer.playing
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
                        if (widget.audioPlayer.position.inSeconds + 10 <=
                            widget.audioPlayer.duration!.inSeconds) {
                          widget.audioPlayer.seek(Duration(
                              seconds: (widget.audioPlayer.position.inSeconds +
                                  10)));
                        } else {
                          widget.audioPlayer.seek(Duration(
                              seconds: widget.audioPlayer.duration!.inSeconds));
                        }
                      });
                      widget.playerService.updateMediaProgress();
                    },
                    child: Icon(Icons.arrow_forward_outlined,
                        color: Theme.of(context).colorScheme.onSurface))
              ],
            )
          ],
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
