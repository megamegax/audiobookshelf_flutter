import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/metadata_entity.dart';
import 'package:isar/isar.dart';

part 'media_entity.g.dart';

@embedded
class MediaEntity {
  MediaProgressEntity? progress;
  MetadataEntity? metadata;
  String? coverPath;
  List<int>? coverBytes;
  List<String>? tags;
  int? numTracks;
  int? numAudioFiles;
  int? numChapters;
  int? numMissingParts;
  int? numInvalidAudioFiles;
  double? duration;
  int? size;
  String? ebookFileFormat;

  MediaEntity({
    this.metadata,
    this.progress,
    this.coverPath,
    this.coverBytes,
    this.tags,
    this.numTracks,
    this.numAudioFiles,
    this.numChapters,
    this.numMissingParts,
    this.numInvalidAudioFiles,
    this.duration,
    this.size,
    this.ebookFileFormat,
  });
}
