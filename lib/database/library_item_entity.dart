import 'package:audiobookshelf_flutter/database/collapsed_series_entity.dart';
import 'package:audiobookshelf_flutter/database/media_entity.dart';
import 'package:audiobookshelf_flutter/database/media_progress_entity.dart';
import 'package:audiobookshelf_flutter/database/metadata_entity.dart';
import 'package:isar/isar.dart';

part 'library_item_entity.g.dart';

@collection
class LibraryItemEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String itemId;
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
  bool isInvalid;
  String mediaType;
  MediaEntity media;
  int numFiles;
  int size;
  CollapsedSeriesEntity? collapsedSeries;
  LibraryItemEntity(
      {required this.itemId,
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
      this.updatedAt,
      required this.isMissing,
      required this.isInvalid,
      required this.mediaType,
      required this.media,
      required this.numFiles,
      required this.size,
      required this.collapsedSeries});
}
