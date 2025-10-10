import 'package:audiobookshelf_flutter/model/libraries/meta_data.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/audio_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/book_chapter.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/e_book_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:audiobookshelf_flutter/model/libraries/player/track.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'detailed_media.freezed.dart';
part 'detailed_media.g.dart';

@freezed
sealed class DetailedMedia with _$DetailedMedia {
  const factory DetailedMedia({
    required Metadata metadata,
    required String coverPath,
    List<String>? tags,
    List<AudioFile>? audioFiles,
    List<BookChapter>? chapters,
    List<Track>? tracks,
    List<LibraryFile>? libraryFiles,
    double? duration,
    int? size,
    EBookFile? ebookFile,
    // Podcast-specific fields
    int? numEpisodes,
    bool? autoDownloadEpisodes,
    String? autoDownloadSchedule,
    int? lastEpisodeCheck,
    int? maxEpisodesToKeep,
    int? maxNewEpisodesToDownload,
    // Book-specific fields
    int? numTracks,
    int? numAudioFiles,
    int? numChapters,
  }) = _DetailedMedia;

  factory DetailedMedia.fromJson(Map<String, dynamic> json) =>
      _$DetailedMediaFromJson(json);
}
