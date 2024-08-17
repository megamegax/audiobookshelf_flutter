import 'dart:typed_data';

import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_track.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/meta_tags.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:just_audio_background/just_audio_background.dart';

part 'audio_file.freezed.dart';
part 'audio_file.g.dart';

@freezed
class AudioFile with _$AudioFile {
  const factory AudioFile({
    required int? index,
    required String? ino,
    FileMetadata? metadata,
    int? addedAt,
    int? updatedAt,
    String? format,
    double? duration,
    int? bitRate,
    String? language,
    String? codec,
    String? timeBase,
    int? channels,
    String? channelLayout,
    String? mimeType,
    MetaTags? metaTags,
  }) = _AudioFile;

  factory AudioFile.fromJson(Map<String, dynamic> json) =>
      _$AudioFileFromJson(json);
}
