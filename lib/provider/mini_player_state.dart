import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_notifier.dart';

part 'mini_player_state.g.dart';

// Optimized provider that only watches audioSource
@riverpod
bool audioSourceExists(Ref ref) {
  final audioPlayerState = ref.watch(audioPlayerProvider);
  return audioPlayerState.audioSource != null;
}

@riverpod
bool miniPlayerVisibility(Ref ref) {
  // Use the optimized provider that only rebuilds when audioSource changes
  return ref.watch(audioSourceExistsProvider);
}
