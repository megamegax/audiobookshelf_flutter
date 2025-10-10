import 'dart:async';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';

part 'audio_player_streams.g.dart';

@riverpod
Stream<bool> audioPlayingStream(Ref ref) {
  // TODO: Fix this - audioPlayerStateProvider doesn't exist
  return Stream.value(false);
}

@riverpod
Stream<Duration> audioPositionStream(Ref ref) {
  // TODO: Fix this - audioPlayerStateProvider doesn't exist
  return Stream.value(Duration.zero);
}

@riverpod
Stream<Duration?> audioDurationStream(Ref ref) {
  // TODO: Fix this - audioPlayerStateProvider doesn't exist
  return Stream.value(null);
}

@riverpod
Stream<PlayerState> audioPlayerStateStream(Ref ref) {
  // TODO: Fix this - audioPlayerStateProvider doesn't exist
  return Stream.value(PlayerState(false, ProcessingState.idle));
}
