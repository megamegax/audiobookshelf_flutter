import 'package:freezed_annotation/freezed_annotation.dart';

part 'bookmark.freezed.dart';
part 'bookmark.g.dart';

@freezed
sealed class Bookmark with _$Bookmark {
  factory Bookmark({
    required String id,
    required String libraryItemId,
    required int time, // seconds
    required String title,
    String? note,
    required int createdAt,
    required int updatedAt,
  }) = _Bookmark;

  factory Bookmark.fromJson(Map<String, dynamic> json) =>
      _$BookmarkFromJson(json);
}
