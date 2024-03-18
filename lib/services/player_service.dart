import 'dart:math';

import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/playback_session.dart';
import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:audiobookshelf_flutter/provider/audio_player_provider.dart';
import 'package:audiobookshelf_flutter/provider/login_provider.dart';
import 'package:audiobookshelf_flutter/provider/server_address_provider.dart';
import 'package:audiobookshelf_flutter/services/library_service.dart';
import 'package:flutter/foundation.dart';
import 'package:flutter_riverpod/flutter_riverpod.dart';
import 'package:just_audio/just_audio.dart';
import 'package:just_audio_background/just_audio_background.dart';

final playerServiceProvider = Provider<PlayerService>((ref) {
  final audioPlayer = ref.read(audioPlayerProvider);
  final serverAddress = ref.read(serverAddressProvider);
  final userModel = ref.read(userModelNotifierProvider)!;
  return PlayerService(
      audioPlayer: audioPlayer,
      serverAddress: serverAddress,
      libraryService: ref.read(libraryServiceProvider),
      userModel: userModel);
});

class PlayerService {
  final AudioPlayer audioPlayer;
  late PlaybackSession _playbackSession;
  final LibraryService libraryService;
  final String serverAddress;
  late double _startTime;
  final UserModel userModel;
  PlayerService(
      {required this.audioPlayer,
      required this.serverAddress,
      required this.libraryService,
      required this.userModel});
  void init(PlaybackSession playbackSession, double startTime) {
    _playbackSession = playbackSession;
    _startTime = startTime;
  }

  preparePlayer(LibraryItemEntity libraryItem,
      {bool autoStart = false, Function? onPrepared}) async {
    if (audioPlayer.playing) {
      final tag = audioPlayer.audioSource!.sequence[0].tag as MediaItem;
      if (tag.id == libraryItem.itemId.toString()) {
        onPrepared?.call();
      } else {
        return;
      }
      return;
    }
    final playbackSession =
        await libraryService.playBook(userModel, libraryItem);
    var startTime = 0.0;
    init(playbackSession, startTime);
    await audioPlayer.setAudioSource(AudioSource.uri(
      Uri.parse(
          "$serverAddress${currentTrack()?.contentUrl!}?token=${userModel.token}"),
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
    onPrepared?.call();

    if (autoStart) {
      audioPlayer.play();
    }
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
}
