import 'package:audio_service/audio_service.dart';
import 'package:audiobookshelf_flutter/model/player_overlay_state.dart';
import 'package:audiobookshelf_flutter/services/player_service.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:just_audio/just_audio.dart';

part 'player_overlay_notifier.g.dart';

@riverpod
class PlayerOverlayNotifier extends _$PlayerOverlayNotifier {
  late PlayerService _playerService;

  @override
  PlayerOverlayState build({
    required AudioPlayer audioPlayer,
    required PlayerService playerService,
    required MediaItem mediaItem,
  }) {
    _playerService = playerService;

    // Initialize state with proper calculations
    final initialState = _calculateInitialState(audioPlayer);

    // Listen to audio player changes
    audioPlayer.positionStream.listen((position) {
      state = _updateStateFromPosition(position, audioPlayer);
    });

    audioPlayer.durationStream.listen((duration) {
      state = _updateStateFromDuration(duration, audioPlayer);
    });

    audioPlayer.playingStream.listen((playing) {
      state = state.copyWith(isPlaying: playing);
    });

    return initialState;
  }

  void toggleChapterMode() {
    state = state.copyWith(isChapterMode: !state.isChapterMode);
  }

  PlayerOverlayState _calculateInitialState(AudioPlayer audioPlayer) {
    final currentChapterDuration = audioPlayer.duration ?? Duration.zero;
    final currentChapterTitle = _playerService.currentChapterTitle() ?? '';

    return PlayerOverlayState(
      position: audioPlayer.position,
      duration: audioPlayer.duration ?? Duration.zero,
      isPlaying: audioPlayer.playing,
      isChapterMode: false,
      progress: _calculateFullBookProgress(audioPlayer.position),
      chapterProgress: _calculateChapterProgress(
        audioPlayer.position,
        currentChapterDuration,
      ),
      currentChapterDuration: currentChapterDuration,
      currentChapterTitle: currentChapterTitle,
    );
  }

  PlayerOverlayState _updateStateFromPosition(
    Duration position,
    AudioPlayer audioPlayer,
  ) {
    final currentChapterTitle = _playerService.currentChapterTitle() ?? '';

    return state.copyWith(
      position: position,
      progress: _calculateFullBookProgress(position),
      chapterProgress: _calculateChapterProgress(
        position,
        state.currentChapterDuration,
      ),
      currentChapterTitle: currentChapterTitle,
    );
  }

  PlayerOverlayState _updateStateFromDuration(
    Duration? duration,
    AudioPlayer audioPlayer,
  ) {
    final currentChapterDuration = duration ?? Duration.zero;

    return state.copyWith(
      duration: duration ?? Duration.zero,
      currentChapterDuration: currentChapterDuration,
    );
  }

  double _calculateFullBookProgress(Duration position) {
    final totalDuration = _playerService.totalDuration();
    if (totalDuration <= 0) return 0.0;

    final overallTime = _playerService.overallCurrentTime();
    final progress = overallTime / totalDuration;

    return progress.clamp(0.0, 1.0);
  }

  double _calculateChapterProgress(
    Duration position,
    Duration currentChapterDuration,
  ) {
    final currentTrackDuration = currentChapterDuration.inSeconds;
    if (currentTrackDuration <= 0) return 0.0;

    return position.inSeconds / currentTrackDuration;
  }
}
