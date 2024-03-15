import 'package:audiobookshelf_flutter/model/libraries/collapsed_series.dart';
import 'package:audiobookshelf_flutter/model/libraries/media.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_item.freezed.dart';
part 'library_item.g.dart';

@freezed
class LibraryItem with _$LibraryItem {
  const factory LibraryItem({
    required String id,
    required String ino,
    required String libraryId,
    required String folderId,
    required String path,
    required String relPath,
    required bool isFile,
    required int mtimeMs,
    required int ctimeMs,
    required int birthtimeMs,
    required int addedAt,
    required int updatedAt,
    required bool isMissing,
    required bool isInvalid,
    required String mediaType,
    required Media media,
    required int? numFiles,
    required int size,
    required CollapsedSeries? collapsedSeries,
  }) = _LibraryItem;

  factory LibraryItem.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemFromJson(json);
}
