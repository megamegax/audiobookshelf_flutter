import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'media.freezed.dart';
part 'media.g.dart';

@freezed
class Media with _$Media {
  const factory Media({
    required Metadata metadata,
    required String coverPath,
    @JsonKey(includeFromJson: false, includeToJson: false)
    Uint8List? coverBytes,
    List<String>? tags,
    required int numTracks,
    required int numAudioFiles,
    required int numChapters,
    required int numMissingParts,
    required int numInvalidAudioFiles,
    required double duration,
    required int size,
    String? ebookFileFormat,
  }) = _Media;

  factory Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);
}
