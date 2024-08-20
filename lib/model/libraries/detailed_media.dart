
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
class DetailedMedia with _$DetailedMedia {
  const factory DetailedMedia({
    required Metadata metadata,
    required String coverPath,
    List<String>? tags,
    required List<AudioFile>? audioFiles,
    required List<BookChapter>? chapters,
    required List<Track>? tracks,
    required List<LibraryFile>? libraryFiles,
    required double duration,
    required int size,
    EBookFile? ebookFile,
  }) = _DetailedMedia;

  factory DetailedMedia.fromJson(Map<String, dynamic> json) =>
      _$DetailedMediaFromJson(json);
}
