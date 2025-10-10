import 'package:freezed_annotation/freezed_annotation.dart';

part 'player_overlay_state.freezed.dart';

@freezed
sealed class PlayerOverlayState with _$PlayerOverlayState {
  const factory PlayerOverlayState({
    @Default(Duration.zero) Duration position,
    @Default(Duration.zero) Duration duration,
    @Default(false) bool isPlaying,
    @Default(false) bool isChapterMode,
    @Default(0.0) double progress,
    @Default(0.0) double chapterProgress,
    @Default(Duration.zero) Duration currentChapterDuration,
  }) = _PlayerOverlayState;
}
