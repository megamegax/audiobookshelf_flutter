// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'bookmark.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Bookmark _$BookmarkFromJson(Map<String, dynamic> json) => _Bookmark(
  id: json['id'] as String,
  libraryItemId: json['libraryItemId'] as String,
  time: (json['time'] as num).toInt(),
  title: json['title'] as String,
  note: json['note'] as String?,
  createdAt: (json['createdAt'] as num).toInt(),
  updatedAt: (json['updatedAt'] as num).toInt(),
);

Map<String, dynamic> _$BookmarkToJson(_Bookmark instance) => <String, dynamic>{
  'id': instance.id,
  'libraryItemId': instance.libraryItemId,
  'time': instance.time,
  'title': instance.title,
  'note': instance.note,
  'createdAt': instance.createdAt,
  'updatedAt': instance.updatedAt,
};
