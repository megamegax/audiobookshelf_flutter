// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesItemImpl _$$SeriesItemImplFromJson(Map<String, dynamic> json) =>
    _$SeriesItemImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameIgnorePrefix: json['nameIgnorePrefix'] as String,
      addedAt: json['addedAt'] as int,
      updatedAt: json['updatedAt'] as int?,
      description: json['description'] as String?,
      books: (json['books'] as List<dynamic>)
          .map((e) => SeriesBook.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeriesItemImplToJson(_$SeriesItemImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameIgnorePrefix': instance.nameIgnorePrefix,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'books': instance.books,
    };

_$SeriesBookImpl _$$SeriesBookImplFromJson(Map<String, dynamic> json) =>
    _$SeriesBookImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$SeriesBookImplToJson(_$SeriesBookImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
