import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:flutter/material.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';

class PlayerSlider extends ConsumerStatefulWidget {
  final AudioPlayer audioPlayer;
  final PlayerService playerService;
  final double progress;
  const PlayerSlider({
    super.key,
    required this.audioPlayer,
    required this.playerService,
    required this.progress,
  });

  @override
  ConsumerState<ConsumerStatefulWidget> createState() => _PlayerSliderState();
}

class _PlayerSliderState extends ConsumerState<PlayerSlider> {
  @override
  Widget build(BuildContext context) {
    return SliderTheme(
      data: SliderTheme.of(context).copyWith(
        activeTrackColor: Theme.of(context).colorScheme.primary,
        inactiveTrackColor:
            Theme.of(context).colorScheme.surfaceContainerHighest,
        thumbColor: Theme.of(context).colorScheme.primary,
        overlayColor: Theme.of(context).colorScheme.primary.withOpacity(0.1),
        trackHeight: 4.0,
        thumbShape: const RoundSliderThumbShape(enabledThumbRadius: 8.0),
        overlayShape: const RoundSliderOverlayShape(overlayRadius: 16.0),
      ),
      child: Slider(
        min: 0.0,
        max: 1.0,
        value: widget.progress.isNaN ? 0.0 : widget.progress.clamp(0.0, 1.0),
        onChanged: (double value) {
          // Progress will be updated by the parent widget
        },
        onChangeEnd: (value) async {
          // Use the new chapter-aware seeking method
          await widget.playerService.seekWithinCurrentTrack(value);
          widget.playerService.updateMediaProgress();
        },
      ),
    );
  }
}
