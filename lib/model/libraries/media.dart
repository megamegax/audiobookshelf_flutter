import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
sealed class Media with _$Media {
  const factory Media({
    required Metadata metadata,
    String? coverPath,
    // ignore: invalid_annotation_target
    @JsonKey(includeFromJson: false, includeToJson: false)
    Uint8List? coverBytes,
    List<String>? tags,
    int? numTracks,
    int? numAudioFiles,
    int? numChapters,
    int? numMissingParts,
    int? numInvalidAudioFiles,
    double? duration,
    int? size,
    String? ebookFileFormat,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
