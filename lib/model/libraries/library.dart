import 'package:audiobookshelf_flutter/model/libraries/folder.dart';
import 'package:audiobookshelf_flutter/model/libraries/library_settings.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
part 'library.freezed.dart';
part 'library.g.dart';

@freezed
class Library with _$Library {
  const factory Library({
    required String id,
    required String name,
    required List<Folder> folders,
    required int displayOrder,
    required String icon,
    required String mediaType,
    String? provider,
    required LibrarySettings settings,
  }) = _Library;

  factory Library.fromJson(Map<String, dynamic> json) =>
      _$LibraryFromJson(json);
}
