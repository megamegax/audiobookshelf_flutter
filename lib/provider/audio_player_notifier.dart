import 'dart:async';
import 'package:flutter/foundation.dart';
import 'package:just_audio/just_audio.dart';
import 'package:riverpod_annotation/riverpod_annotation.dart';
import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_state.dart';
import 'package:audio_service/audio_service.dart';

part 'audio_player_notifier.g.dart';

@riverpod
class AudioPlayerNotifier extends _$AudioPlayerNotifier {
  late AudioPlayer _audioPlayer;
  late StreamSubscription<bool> _playingSubscription;
  late StreamSubscription<Duration> _positionSubscription;
  late StreamSubscription<Duration?> _durationSubscription;
  late StreamSubscription<PlayerState> _playerStateSubscription;

  @override
  AudioPlayerState build() {
    _audioPlayer = AudioPlayer();

    // Set up stream subscriptions
    _playingSubscription = _audioPlayer.playingStream.listen((playing) {
      state = state.copyWith(isPlaying: playing);
    });

    _positionSubscription = _audioPlayer.positionStream.listen((position) {
      final duration = _audioPlayer.duration;
      final progress = duration != null && duration.inMilliseconds > 0
          ? position.inMilliseconds / duration.inMilliseconds
          : 0.0;
      state = state.copyWith(position: position, progress: progress);
    });

    _durationSubscription = _audioPlayer.durationStream.listen((duration) {
      state = state.copyWith(duration: duration);
    });

    _playerStateSubscription = _audioPlayer.playerStateStream.listen((
      playerState,
    ) {
      state = state.copyWith(
        processingState: playerState.processingState,
        isPrepared: playerState.processingState == ProcessingState.ready,
        isLoading: playerState.processingState == ProcessingState.loading,
      );
    });

    // Clean up on dispose
    ref.onDispose(() {
      _playingSubscription.cancel();
      _positionSubscription.cancel();
      _durationSubscription.cancel();
      _playerStateSubscription.cancel();
      _audioPlayer.dispose();
    });

    return const AudioPlayerState();
  }

  /// Get the underlying AudioPlayer instance for direct access
  AudioPlayer get audioPlayer => _audioPlayer;

  /// Set audio source and update state
  Future<void> setAudioSource(
    AudioSource source, {
    LibraryItemEntity? item,
    MediaItem? mediaItem,
  }) async {
    try {
      state = state.copyWith(isLoading: true, error: null);
      await _audioPlayer.setAudioSource(source);
      state = state.copyWith(
        audioSource: source,
        currentItem: item,
        // currentMediaItem: mediaItem, // TODO: Fix MediaItem import
        isLoading: false,
      );
    } catch (e) {
      state = state.copyWith(isLoading: false, error: e.toString());
      if (kDebugMode) {
        print('[AudioPlayerState] Error setting audio source: $e');
      }
    }
  }

  /// Play audio
  Future<void> play() async {
    try {
      await _audioPlayer.play();
    } catch (e) {
      state = state.copyWith(error: e.toString());
      if (kDebugMode) {
        print('[AudioPlayerState] Error playing: $e');
      }
    }
  }

  /// Pause audio
  Future<void> pause() async {
    try {
      await _audioPlayer.pause();
    } catch (e) {
      state = state.copyWith(error: e.toString());
      if (kDebugMode) {
        print('[AudioPlayerState] Error pausing: $e');
      }
    }
  }

  /// Toggle play/pause
  Future<void> togglePlayPause() async {
    if (state.isPlaying) {
      await pause();
    } else {
      await play();
    }
  }

  /// Seek to position
  Future<void> seek(Duration position) async {
    try {
      await _audioPlayer.seek(position);
    } catch (e) {
      state = state.copyWith(error: e.toString());
      if (kDebugMode) {
        print('[AudioPlayerState] Error seeking: $e');
      }
    }
  }

  /// Stop audio
  Future<void> stop() async {
    try {
      await _audioPlayer.stop();
      state = state.copyWith(
        audioSource: null,
        currentItem: null,
        // currentMediaItem: null, // TODO: Fix MediaItem import
        position: Duration.zero,
        progress: 0.0,
      );
    } catch (e) {
      state = state.copyWith(error: e.toString());
      if (kDebugMode) {
        print('[AudioPlayerState] Error stopping: $e');
      }
    }
  }

  /// Check if currently playing a specific item
  bool isPlayingItem(String itemId) {
    return state.currentItem?.id == itemId && state.isPlaying;
  }

  /// Toggle play/pause for a specific item
  Future<void> togglePlayPauseForItem(String itemId) async {
    if (state.currentItem?.id == itemId) {
      await togglePlayPause();
    }
  }

  /// Clear error state
  void clearError() {
    state = state.copyWith(error: null);
  }
}
