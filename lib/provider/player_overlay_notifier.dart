import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/model/player_overlay_state.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'player_overlay_notifier.g.dart';

@riverpod
class PlayerOverlayNotifier extends _$PlayerOverlayNotifier {
  @override
  PlayerOverlayState build({
    required AudioPlayer audioPlayer,
    required PlayerService playerService,
    required MediaItem mediaItem,
  }) {
    // Initialize state
    final initialState = PlayerOverlayState(
      position: audioPlayer.position,
      duration: audioPlayer.duration ?? Duration.zero,
      isPlaying: audioPlayer.playing,
      isChapterMode: false,
      progress: _calculateProgress(audioPlayer.position, audioPlayer.duration),
      chapterProgress: 0.0,
      currentChapterDuration: Duration.zero,
    );

    // Listen to audio player changes
    audioPlayer.positionStream.listen((position) {
      state = state.copyWith(
        position: position,
        progress: _calculateProgress(position, audioPlayer.duration),
        chapterProgress: _calculateChapterProgress(position),
      );
    });

    audioPlayer.durationStream.listen((duration) {
      state = state.copyWith(
        duration: duration ?? Duration.zero,
        progress: _calculateProgress(audioPlayer.position, duration),
      );
    });

    audioPlayer.playingStream.listen((playing) {
      state = state.copyWith(isPlaying: playing);
    });

    return initialState;
  }

  void toggleChapterMode() {
    state = state.copyWith(isChapterMode: !state.isChapterMode);
  }

  double _calculateProgress(Duration position, Duration? duration) {
    if (duration == null || duration.inSeconds == 0) return 0.0;
    return position.inSeconds / duration.inSeconds;
  }

  double _calculateChapterProgress(Duration position) {
    // TODO: Implement chapter progress calculation
    return 0.0;
  }
}
