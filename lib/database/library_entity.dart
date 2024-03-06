import 'package:audiobookshelf_flutter/database/folder_entity.dart';
import 'package:audiobookshelf_flutter/database/library_settings_entity.dart';
import 'package:isar/isar.dart';

part 'library_entity.g.dart';

@collection
class LibraryEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String? libraryId;
  String name;
  List<FolderEntity> folders;
  int displayOrder;
  String icon;
  String mediaType;
  String? provider;
  LibrarySettingsEntity? settings;

  LibraryEntity(
      {this.libraryId,
      required this.name,
      this.folders = const [],
      required this.displayOrder,
      required this.icon,
      required this.mediaType,
      this.provider,
      this.settings});
}
