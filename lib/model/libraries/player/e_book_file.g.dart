// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_book_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_EBookFile _$EBookFileFromJson(Map<String, dynamic> json) => _EBookFile(
  ino: json['ino'] as String,
  metadata: json['metadata'] == null
      ? null
      : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
  ebookFormat: json['ebookFormat'] as String,
  addedAt: (json['addedAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
);

Map<String, dynamic> _$EBookFileToJson(_EBookFile instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata,
      'ebookFormat': instance.ebookFormat,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
    };
