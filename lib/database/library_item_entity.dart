import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:isar/isar.dart';

part 'library_item_entity.g.dart';

@collection
class LibraryItemEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String? itemId;
  MediaProgressEntity? mediaProgress;
  String ino;
  String libraryId;
  String folderId;
  String path;
  String relPath;
  bool isFile;
  int mtimeMs;
  int ctimeMs;
  int birthtimeMs;
  int addedAt;
  int? updatedAt;
  bool isMissing;
  LibraryItemEntity(
      {this.itemId,
      this.mediaProgress,
      required this.ino,
      required this.libraryId,
      required this.folderId,
      required this.path,
      required this.relPath,
      required this.isFile,
      required this.mtimeMs,
      required this.ctimeMs,
      required this.birthtimeMs,
      required this.addedAt,
      required this.updatedAt,
      required this.isMissing});
}
