import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'track.freezed.dart';
part 'track.g.dart';

@freezed
class Track with _$Track {
  const factory Track(
      {required int index,
      required double? startOffset,
      required double? duration,
      required String? title,
      required String? contentUrl,
      required String? mimeType,
      FileMetadata? metadata}) = _Track;

  factory Track.fromJson(Map<String, dynamic> json) => _$TrackFromJson(json);
}
