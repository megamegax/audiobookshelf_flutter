// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'e_book_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$EBookFileImpl _$$EBookFileImplFromJson(Map<String, dynamic> json) =>
    _$EBookFileImpl(
      ino: json['ino'] as String,
      metadata: json['metadata'] == null
          ? null
          : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      ebookFormat: json['ebookFormat'] as String,
      addedAt: (json['addedAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$EBookFileImplToJson(_$EBookFileImpl instance) =>
    <String, dynamic>{
      'ino': instance.ino,
      'metadata': instance.metadata,
      'ebookFormat': instance.ebookFormat,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
    };
