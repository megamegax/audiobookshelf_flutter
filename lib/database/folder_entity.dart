import 'package:isar/isar.dart';
part 'folder_entity.g.dart';

@embedded
class FolderEntity {
  String? folderId;
  String? fullPath;
  String? libraryId;
  DateTime? addedAt;

  FolderEntity({this.folderId, this.fullPath, this.libraryId, this.addedAt});
}
