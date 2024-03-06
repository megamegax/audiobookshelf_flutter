import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_item.freezed.dart';
part 'library_item.g.dart';

@freezed
class LibraryItem with _$LibraryItem {
  const factory LibraryItem(
      {required String id,
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
      required bool isMissing}) = _LibraryItem;

  factory LibraryItem.fromJson(Map<String, dynamic> json) =>
      _$LibraryItemFromJson(json);
}
