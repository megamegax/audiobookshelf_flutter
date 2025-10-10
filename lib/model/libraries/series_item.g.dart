// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_item.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesItem _$SeriesItemFromJson(Map<String, dynamic> json) => _SeriesItem(
  id: json['id'] as String,
  name: json['name'] as String,
  nameIgnorePrefix: json['nameIgnorePrefix'] as String,
  addedAt: (json['addedAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num?)?.toInt(),
  description: json['description'] as String?,
  books: (json['books'] as List<dynamic>)
      .map((e) => SeriesBook.fromJson(e as Map<String, dynamic>))
      .toList(),
);

Map<String, dynamic> _$SeriesItemToJson(_SeriesItem instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameIgnorePrefix': instance.nameIgnorePrefix,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'description': instance.description,
      'books': instance.books,
    };

_SeriesBook _$SeriesBookFromJson(Map<String, dynamic> json) =>
    _SeriesBook(id: json['id'] as String);

Map<String, dynamic> _$SeriesBookToJson(_SeriesBook instance) =>
    <String, dynamic>{'id': instance.id};
