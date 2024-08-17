import 'package:freezed_annotation/freezed_annotation.dart';

part 'library_file.freezed.dart';
part 'library_file.g.dart';

@freezed
class LibraryFile with _$LibraryFile {
  const factory LibraryFile({
    required String ino,
    FileMetadata? metadata,
    required String isSupplementary,
    required int addedAt,
    int? updatedAt,
    String? fileType,
  }) = _LibraryFile;

  factory LibraryFile.fromJson(Map<String, dynamic> json) =>
      _$LibraryFileFromJson(json);
}

@freezed
class FileMetadata with _$FileMetadata {
  const factory FileMetadata({
    required String? filename,
    required String? ext,
    required String? path,
    String? relPath,
    required int? size,
    int? mtimeMs,
    int? ctimeMs,
    int? birthtimeMs,

    // Add other fields as needed
  }) = _FileMetadata;

  factory FileMetadata.fromJson(Map<String, dynamic> json) =>
      _$FileMetadataFromJson(json);
}
