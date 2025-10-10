import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';

part 'mini_player_state.g.dart';

@riverpod
bool miniPlayerVisibility(Ref ref) {
  // Watch audio player state
  final audioPlayerState = ref.watch(audioPlayerProvider);
  return audioPlayerState.audioSource != null;
}
