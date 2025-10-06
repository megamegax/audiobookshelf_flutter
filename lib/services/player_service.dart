import 'dart:math';

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
    _libraryItem = libraryItem;
    _detailed = detailed;

    // Check if we're already playing this item
    if (audioPlayer.playing && _libraryItem?.itemId == libraryItem.itemId) {
      onPrepared?.call();
      return;
    }

    // Stop current playback if different item
    if (audioPlayer.playing) {
      await audioPlayer.stop();
    }

    final playbackSession =
        await libraryService.playBook(userModel, libraryItem);

    // Use the current time from the playback session, not 0
    final startTime = playbackSession.currentTime;
    init(playbackSession, startTime);

    // Build the correct streaming URL based on the track content
    String streamUrl;
    if (currentTrack()?.contentUrl?.startsWith('/hls') == true) {
      streamUrl = "$serverAddress${currentTrack()?.contentUrl}";
    } else {
      streamUrl =
          "$serverAddress/public/session/${_playbackSession.id}/track/${currentTrack()?.index ?? 1}";
    }

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

    // Configure audio player settings
    audioPlayer.setCanUseNetworkResourcesForLiveStreamingWhilePaused(true);
    final bitRate = _detailed?.media.audioFiles?[0].bitRate?.toDouble();
    if (bitRate != null) {
      audioPlayer.setPreferredPeakBitRate(bitRate);
    }

    // Calculate the correct seek position within the current track
    final currentTrackStartOffset =
        _playbackSession.audioTracks[currentTrackIndex()].startOffset ?? 0.0;
    final seekTimeInTrack = max(0, startTime - currentTrackStartOffset);
    final position = Duration(seconds: seekTimeInTrack.floor());

    // Wait for the audio source to be loaded before seeking
    await audioPlayer.load();
    await audioPlayer.seek(position);

    if (autoStart) {
      await audioPlayer.play();
    }
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

    // Update the playback session current time
    _playbackSession = _playbackSession.copyWith(currentTime: timeInSeconds);
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
}
