import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';

part 'audio_player_state.freezed.dart';

@freezed
sealed class AudioPlayerState with _$AudioPlayerState {
  const factory AudioPlayerState({
    @Default(false) bool isPlaying,
    @Default(Duration.zero) Duration position,
    Duration? duration,
    @Default(0.0) double progress,
    AudioSource? audioSource,
    @Default(ProcessingState.idle) ProcessingState processingState,
    LibraryItemEntity? currentItem,
    // MediaItem? currentMediaItem, // TODO: Import MediaItem from just_audio
    @Default(false) bool isPrepared,
    @Default(false) bool isLoading,
    String? error,
  }) = _AudioPlayerState;

  const AudioPlayerState._();

  // Helper getters for processing state
  bool get isIdle => processingState == ProcessingState.idle;
  bool get isBuffering => processingState == ProcessingState.buffering;
  bool get isReady => processingState == ProcessingState.ready;
  bool get isCompleted => processingState == ProcessingState.completed;
  bool get isProcessing =>
      processingState == ProcessingState.loading ||
      processingState == ProcessingState.buffering;
  bool get canPlay => isReady && !isCompleted;
  bool get hasError => error != null;
}
