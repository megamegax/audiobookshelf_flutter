import 'package:audiobookshelf_flutter/model/libraries/player/library_file.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'e_book_file.freezed.dart';
part 'e_book_file.g.dart';

@freezed
class EBookFile with _$EBookFile {
  const factory EBookFile({
    required String ino,
    FileMetadata? metadata,
    required String ebookFormat,
    required int addedAt,
    int? updatedAt,
  }) = _EBookFile;

  factory EBookFile.fromJson(Map<String, dynamic> json) =>
      _$EBookFileFromJson(json);
}
