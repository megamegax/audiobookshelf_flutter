// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibraryFile _$LibraryFileFromJson(Map<String, dynamic> json) => _LibraryFile(
  ino: json['ino'] as String,
  metadata: json['metadata'] == null
      ? null
      : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  isSupplementary: json['isSupplementary'] as String,
  addedAt: (json['addedAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
  fileType: json['fileType'] as String?,
);

Map<String, dynamic> _$LibraryFileToJson(_LibraryFile instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata,
      'isSupplementary': instance.isSupplementary,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'fileType': instance.fileType,
    };

_FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) =>
    _FileMetadata(
      filename: json['filename'] as String?,
      ext: json['ext'] as String?,
      path: json['path'] as String?,
      relPath: json['relPath'] as String?,
      size: (json['size'] as num?)?.toInt(),
      mtimeMs: (json['mtimeMs'] as num?)?.toInt(),
      ctimeMs: (json['ctimeMs'] as num?)?.toInt(),
      birthtimeMs: (json['birthtimeMs'] as num?)?.toInt(),
    );

Map<String, dynamic> _$FileMetadataToJson(_FileMetadata instance) =>
    <String, dynamic>{
      'filename': instance.filename,
      'ext': instance.ext,
      'path': instance.path,
      'relPath': instance.relPath,
      'size': instance.size,
      'mtimeMs': instance.mtimeMs,
      'ctimeMs': instance.ctimeMs,
      'birthtimeMs': instance.birthtimeMs,
    };
