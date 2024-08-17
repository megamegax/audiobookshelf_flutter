// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'book_chapter.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$BookChapterImpl _$$BookChapterImplFromJson(Map<String, dynamic> json) =>
    _$BookChapterImpl(
      id: (json['id'] as num).toInt(),
      start: (json['start'] as num).toDouble(),
      end: (json['end'] as num).toDouble(),
      title: json['title'] as String,
    );

Map<String, dynamic> _$$BookChapterImplToJson(_$BookChapterImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'start': instance.start,
      'end': instance.end,
      'title': instance.title,
    };
