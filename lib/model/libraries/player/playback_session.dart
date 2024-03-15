import 'package:audiobookshelf_flutter/model/libraries/library_item.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/device_info.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/device_info_response.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'playback_session.freezed.dart';
part 'playback_session.g.dart';

@freezed
class PlaybackSession with _$PlaybackSession {
  const factory PlaybackSession(
      {required String id,
      String? userId,
      String? libraryItemId,
      String? episodeId,
      required String mediaType,
      //MediaTypeMetadata mediaMetadata,
      required DeviceInfoResponse deviceInfo,
      required List<BookChapter> chapters,
      String? displayTitle,
      String? displayAuthor,
      String? coverPath,
      required double duration,
      required int playMethod,
      required int startedAt,
      required int updatedAt,
      required int timeListening,
      required List<AudioTrack> audioTracks,
      required double currentTime,
      LibraryItem? libraryItem,
      //LocalLibraryItem? localLibraryItem,
      String? localEpisodeId,
      String? serverConnectionConfigId,
      String? serverAddress,
      String? mediaPlayer}) = _PlaybackSession;
  factory PlaybackSession.fromJson(Map<String, dynamic> json) =>
      _$PlaybackSessionFromJson(json);
}
