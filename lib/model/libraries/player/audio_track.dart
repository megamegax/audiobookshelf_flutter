import 'package:freezed_annotation/freezed_annotation.dart';

part 'audio_track.freezed.dart';
part 'audio_track.g.dart';

@freezed
class AudioTrack with _$AudioTrack {
  const factory AudioTrack(
      {required int? index,
      required double? startOffset,
      required double? duration,
      required String? title,
      required String? contentUrl,
      required String? mimeType,
      // metadata:FileMetadata?,
      required bool? isLocal,
      String? localFileId,
      //var audioProbeResult:AudioProbeResult?,
      int? serverIndex}) = _AudioTrack;
  factory AudioTrack.fromJson(Map<String, dynamic> json) =>
      _$AudioTrackFromJson(json);
}
