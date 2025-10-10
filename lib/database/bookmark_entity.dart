import 'package:isar_community/isar.dart';

part 'bookmark_entity.g.dart';

@collection
class BookmarkEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String bookmarkId;

  late String libraryItemId;

  late int time; // seconds

  late String title;

  String? note;

  late int createdAt;

  late int updatedAt;

  BookmarkEntity();

  BookmarkEntity.fromBookmark({
    required String bookmarkId,
    required String libraryItemId,
    required int time,
    required String title,
    String? note,
    required int createdAt,
    required int updatedAt,
  }) {
    this.bookmarkId = bookmarkId;
    this.libraryItemId = libraryItemId;
    this.time = time;
    this.title = title;
    this.note = note;
    this.createdAt = createdAt;
    this.updatedAt = updatedAt;
  }
}
