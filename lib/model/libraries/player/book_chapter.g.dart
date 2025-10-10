// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_BookChapter _$BookChapterFromJson(Map<String, dynamic> json) => _BookChapter(
  id: (json['id'] as num).toInt(),
  start: (json['start'] as num).toDouble(),
  end: (json['end'] as num).toDouble(),
  title: json['title'] as String,
);

Map<String, dynamic> _$BookChapterToJson(_BookChapter instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
    };
