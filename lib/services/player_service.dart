import 'dart:math';
import 'dart:developer' as dev;

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/detailed_library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/playback_session.dart';
import 'package:audiobookshelf_flutter/model/login/media_progress.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/repositories/library_items_repository.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final playerServiceProvider = Provider<PlayerService>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  final serverAddress = ref.read(serverAddressProvider);
  final userModel = ref.read(userModelNotifierProvider)!;
  final libraryItemsRepository =
      ref.read(libraryItemsRepositoryProvider.future);

  return PlayerService(
      audioPlayer: audioPlayer,
      serverAddress: serverAddress,
      libraryService: ref.read(libraryServiceProvider),
      userModel: userModel,
      libraryItemsRepository: libraryItemsRepository);
});

class PlayerService {
  final AudioPlayer audioPlayer;
  late PlaybackSession _playbackSession;
  final LibraryService libraryService;
  final String serverAddress;
  late double _startTime;
  LibraryItemEntity? _libraryItem;
  DetailedLibraryItem? _detailed;
  final UserModel userModel;
  Future<LibraryItemsRepository> libraryItemsRepository;
  PlayerService(
      {required this.audioPlayer,
      required this.serverAddress,
      required this.libraryService,
      required this.userModel,
      required this.libraryItemsRepository});
  void init(PlaybackSession playbackSession, double startTime) {
    _playbackSession = playbackSession;
    _startTime = startTime;
  }

  preparePlayer(LibraryItemEntity libraryItem, detailed,
      {bool autoStart = false, Function? onPrepared}) async {
    dev.log(
        '[PLAYER_SERVICE] preparePlayer called for: ${libraryItem.media.metadata?.title}');
    dev.log('[PLAYER_SERVICE] autoStart: $autoStart');
    dev.log(
        '[PLAYER_SERVICE] current audioPlayer.playing: ${audioPlayer.playing}');

    _libraryItem = libraryItem;
    _detailed = detailed;

    // Check if we're already playing this item
    if (audioPlayer.playing && _libraryItem?.itemId == libraryItem.itemId) {
      dev.log('[PLAYER_SERVICE] Already playing this item, calling onPrepared');
      onPrepared?.call();
      return;
    }

    // Stop current playback if different item
    if (audioPlayer.playing) {
      dev.log('[PLAYER_SERVICE] Stopping current playback for different item');
      await audioPlayer.stop();
    }

    final playbackSession =
        await libraryService.playBook(userModel, libraryItem);

    dev.log('[PLAYER_SERVICE] Playback session created: ${playbackSession.id}');
    dev.log(
        '[PLAYER_SERVICE] Session current time: ${playbackSession.currentTime}');
    dev.log(
        '[PLAYER_SERVICE] Audio tracks count: ${playbackSession.audioTracks.length}');

    // Use the current time from the playback session, not 0
    final startTime = playbackSession.currentTime;
    init(playbackSession, startTime);

    // Build the correct streaming URL based on the track content
    String streamUrl;
    if (currentTrack()?.contentUrl?.startsWith('/hls') == true) {
      streamUrl = "$serverAddress${currentTrack()?.contentUrl}";
      dev.log('[PLAYER_SERVICE] Using HLS URL: $streamUrl');
    } else {
      streamUrl =
          "$serverAddress/public/session/${_playbackSession.id}/track/${currentTrack()?.index ?? 1}";
      dev.log('[PLAYER_SERVICE] Using track URL: $streamUrl');
    }

    dev.log(
        '[PLAYER_SERVICE] Setting audio source with URL: $streamUrl?token=***');
    await audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse("$streamUrl?token=${userModel.token}"),
      tag: MediaItem(
          id: libraryItem.itemId.toString(),
          album: libraryItem.media.metadata?.seriesName,
          title: libraryItem.media.metadata?.title ?? "-",
          displayDescription: libraryItem.media.metadata?.authorName ?? "-",
          extras: {
            "coverBytes":
                Uint8List.fromList(libraryItem.media.coverBytes ?? []),
            "item": libraryItem
          },
          duration:
              Duration(seconds: libraryItem.media.duration?.toInt() ?? 0)),
    ));

    dev.log('[PLAYER_SERVICE] Audio source set successfully');

    // Configure audio player settings
    audioPlayer.setCanUseNetworkResourcesForLiveStreamingWhilePaused(true);
    final bitRate = _detailed?.media.audioFiles?[0].bitRate?.toDouble();
    if (bitRate != null) {
      dev.log('[PLAYER_SERVICE] Setting preferred bit rate: $bitRate');
      audioPlayer.setPreferredPeakBitRate(bitRate);
    }

    // Calculate the correct seek position within the current track
    final currentTrackStartOffset =
        _playbackSession.audioTracks[currentTrackIndex()].startOffset ?? 0.0;
    final seekTimeInTrack = max(0, startTime - currentTrackStartOffset);
    final position = Duration(seconds: seekTimeInTrack.floor());

    dev.log(
        '[PLAYER_SERVICE] Calculated seek position: ${position.inSeconds}s within track');

    // Wait for the audio source to be loaded before seeking
    dev.log('[PLAYER_SERVICE] Loading audio source...');
    await audioPlayer.load();
    dev.log('[PLAYER_SERVICE] Audio source loaded, seeking to position');
    await audioPlayer.seek(position);

    if (autoStart) {
      dev.log('[PLAYER_SERVICE] Auto-starting playback');
      await audioPlayer.play();
    }

    dev.log('[PLAYER_SERVICE] preparePlayer completed, calling onPrepared');
    onPrepared?.call();
  }

  LibraryItemEntity? currentItem() {
    return _libraryItem;
  }

  int currentTrackIndex() {
    final currentTrackIndex = max(
        0,
        _playbackSession.audioTracks.indexWhere((t) =>
            (t.startOffset?.floor() ?? 0) <= _startTime &&
            ((t.startOffset ?? 0) + (t.duration ?? 0)).floor() > _startTime));

    return currentTrackIndex;
  }

  double currentTrackStartOffset() {
    return currentTrack()?.startOffset ?? 0.0;
  }

  int playerCurrentPosition() {
    return audioPlayer.position.inSeconds;
  }

  double overallCurrentTime() {
    return currentTrackStartOffset() + playerCurrentPosition();
  }

  double totalDuration() {
    var total = 0.0;
    for (var at in _playbackSession.audioTracks) {
      total += (at.duration ?? 0);
    }
    return total;
  }

  AudioTrack? currentTrack() {
    return _playbackSession.audioTracks[currentTrackIndex()];
  }

  /// Get the duration of the current track/chapter in seconds
  double currentTrackDuration() {
    return currentTrack()?.duration ?? 0.0;
  }

  /// Seek to a specific time in the audiobook
  Future<void> seekTo(double timeInSeconds) async {
    if (_libraryItem == null) return;

    // Update the start time
    _startTime = timeInSeconds;

    // Find the correct track for this time
    final newTrackIndex = max(
        0,
        _playbackSession.audioTracks.indexWhere((t) =>
            (t.startOffset?.floor() ?? 0) <= timeInSeconds &&
            ((t.startOffset ?? 0) + (t.duration ?? 0)).floor() >
                timeInSeconds));

    // If we need to change tracks, reload the audio source
    if (newTrackIndex != currentTrackIndex()) {
      final currentTrack = _playbackSession.audioTracks[newTrackIndex];
      String streamUrl;
      if (currentTrack.contentUrl?.startsWith('/hls') == true) {
        streamUrl = "$serverAddress${currentTrack.contentUrl}";
      } else {
        streamUrl =
            "$serverAddress/public/session/${_playbackSession.id}/track/${currentTrack.index ?? 1}";
      }

      await audioPlayer.setAudioSource(AudioSource.uri(
        Uri.parse("$streamUrl?token=${userModel.token}"),
        tag: MediaItem(
            id: _libraryItem!.itemId.toString(),
            album: _libraryItem!.media.metadata?.seriesName,
            title: _libraryItem!.media.metadata?.title ?? "-",
            displayDescription: _libraryItem!.media.metadata?.authorName ?? "-",
            extras: {
              "coverBytes":
                  Uint8List.fromList(_libraryItem!.media.coverBytes ?? []),
              "item": _libraryItem!
            },
            duration:
                Duration(seconds: _libraryItem!.media.duration?.toInt() ?? 0)),
      ));
    }

    // Calculate the seek position within the current track
    final currentTrackStartOffset =
        _playbackSession.audioTracks[newTrackIndex].startOffset ?? 0.0;
    final seekTimeInTrack = max(0, timeInSeconds - currentTrackStartOffset);
    final position = Duration(seconds: seekTimeInTrack.floor());

    // Wait for the audio source to be loaded before seeking
    await audioPlayer.load();
    await audioPlayer.seek(position);

    // Update the playbook session current time
    _playbackSession = _playbackSession.copyWith(currentTime: timeInSeconds);
  }

  /// Seek within the current track/chapter (for slider usage)
  Future<void> seekWithinCurrentTrack(double progressRatio) async {
    if (_libraryItem == null) return;

    final currentTrackDur = currentTrackDuration();
    if (currentTrackDur <= 0) return;

    // Calculate the target time within the current track
    final targetTimeInTrack = progressRatio * currentTrackDur;
    final targetOverallTime = currentTrackStartOffset() + targetTimeInTrack;

    dev.log(
        '[PLAYER_SERVICE] Seeking within track: ${progressRatio * 100}% (${targetTimeInTrack}s of ${currentTrackDur}s)');

    // Seek within the current audio source
    await audioPlayer.seek(Duration(seconds: targetTimeInTrack.floor()));

    // Update the playback session current time
    _playbackSession =
        _playbackSession.copyWith(currentTime: targetOverallTime);
  }

  Future<void> sendProgressSync() async {
    final currentTime = overallCurrentTime();
    final syncData = {
      "currentTime": currentTime,
      "progress": currentTime / _libraryItem!.media.duration!,
      "lastUpdate": DateTime.now().millisecondsSinceEpoch,
    };
    await libraryService.sendProgressSync(
        userModel, _playbackSession.id, syncData);
  }

  Future<void> updateMediaProgress() async {
    final currentTime = overallCurrentTime();
    final updatePayload = {
      "currentTime": currentTime,
      "progress": currentTime / _libraryItem!.media.duration!,
      "lastUpdate": DateTime.now().millisecondsSinceEpoch
    };
    await libraryService.updateMediaProgress(userModel, _libraryItem!.itemId,
        updatePayload: updatePayload);
    final List<MediaProgress>? mediaProgress =
        userModel.mediaProgress?.map((MediaProgress element) {
      MediaProgress? updatedElement;
      if (element.libraryItemId == _libraryItem!.itemId) {
        updatedElement = element.copyWith(
            currentTime: currentTime,
            progress: currentTime / _libraryItem!.media.duration!,
            lastUpdate: DateTime.now().millisecondsSinceEpoch);
      } else {
        updatedElement = element;
      }
      return updatedElement;
    }).toList();
    final updatedUserModel = userModel.copyWith(mediaProgress: mediaProgress);
    (await libraryItemsRepository).saveMediaProgresses(updatedUserModel);
  }

  /// Skip forward by specified seconds
  Future<void> skipForward(int seconds) async {
    final currentPosition = audioPlayer.position.inSeconds;
    final newPosition = currentPosition + seconds;
    final currentTrackDur = currentTrackDuration();

    dev.log(
        '[PLAYER_SERVICE] Skip forward ${seconds}s: ${currentPosition}s -> ${newPosition}s');

    if (newPosition < currentTrackDur) {
      // Stay within current track
      await audioPlayer.seek(Duration(seconds: newPosition));
    } else {
      // Skip to next chapter if available
      await nextChapter();
    }
    updateMediaProgress();
  }

  /// Skip backward by specified seconds
  Future<void> skipBackward(int seconds) async {
    final currentPosition = audioPlayer.position.inSeconds;
    final newPosition = currentPosition - seconds;

    dev.log(
        '[PLAYER_SERVICE] Skip backward ${seconds}s: ${currentPosition}s -> ${newPosition}s');

    if (newPosition >= 0) {
      // Stay within current track
      await audioPlayer.seek(Duration(seconds: newPosition));
    } else {
      // Skip to previous chapter if available
      await previousChapter();
    }
    updateMediaProgress();
  }

  /// Navigate to next chapter/track
  Future<void> nextChapter() async {
    final currentIndex = currentTrackIndex();
    final nextIndex = currentIndex + 1;

    dev.log('[PLAYER_SERVICE] Next chapter: ${currentIndex} -> ${nextIndex}');

    if (nextIndex < _playbackSession.audioTracks.length) {
      final nextTrack = _playbackSession.audioTracks[nextIndex];
      final startTime = nextTrack.startOffset ?? 0.0;

      dev.log(
          '[PLAYER_SERVICE] Switching to track ${nextIndex} at offset ${startTime}s');
      await seekTo(startTime);
    } else {
      dev.log('[PLAYER_SERVICE] Already at last chapter');
    }
  }

  /// Navigate to previous chapter/track
  Future<void> previousChapter() async {
    final currentIndex = currentTrackIndex();
    final currentPosition = audioPlayer.position.inSeconds;

    dev.log(
        '[PLAYER_SERVICE] Previous chapter: current track ${currentIndex}, position ${currentPosition}s');

    // If we're more than 3 seconds into the track, restart current track
    if (currentPosition > 3) {
      dev.log('[PLAYER_SERVICE] Restarting current track');
      await audioPlayer.seek(Duration.zero);
    } else if (currentIndex > 0) {
      // Go to previous track
      final previousIndex = currentIndex - 1;
      final previousTrack = _playbackSession.audioTracks[previousIndex];
      final startTime = previousTrack.startOffset ?? 0.0;

      dev.log(
          '[PLAYER_SERVICE] Switching to previous track ${previousIndex} at offset ${startTime}s');
      await seekTo(startTime);
    } else {
      dev.log('[PLAYER_SERVICE] Already at first chapter, restarting');
      await audioPlayer.seek(Duration.zero);
    }
  }

  /// Check if next chapter is available
  bool hasNextChapter() {
    return currentTrackIndex() < _playbackSession.audioTracks.length - 1;
  }

  /// Check if previous chapter is available
  bool hasPreviousChapter() {
    return currentTrackIndex() > 0 || audioPlayer.position.inSeconds > 3;
  }
}
