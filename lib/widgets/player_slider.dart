import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerSlider extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final PlayerService playerService;
  double progress;
  PlayerSlider(
      {super.key,
      required this.audioPlayer,
      required this.playerService,
      required this.progress});

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends ConsumerState<PlayerSlider> {
  @override
  Widget build(BuildContext context) {
    return Slider(
        min: 0.0,
        value: widget.progress.isNaN ? 0.0 : widget.progress,
        onChanged: (double value) {
          setState(() {
            widget.progress = value;
          });
        },
        onChangeEnd: (value) {
          widget.audioPlayer.seek(Duration(
              seconds:
                  (value * widget.audioPlayer.duration!.inSeconds).floor()));
          widget.playerService.updateMediaProgress();
        });
  }
}
