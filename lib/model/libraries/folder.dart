import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:isar/isar.dart';

part 'folder.freezed.dart';
part 'folder.g.dart';

@freezed
class Folder with _$Folder {
  const factory Folder(
      {required String id,
      required String fullPath,
      required String libraryId,
      required int addedAt}) = _Folder;

  factory Folder.fromJson(Map<String, dynamic> json) => _$FolderFromJson(json);
}
