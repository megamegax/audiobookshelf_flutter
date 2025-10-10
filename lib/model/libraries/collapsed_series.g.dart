// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collapsed_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_CollapsedSeries _$CollapsedSeriesFromJson(Map<String, dynamic> json) =>
    _CollapsedSeries(
      id: json['id'] as String,
      name: json['name'] as String,
      nameIgnorePrefix: json['nameIgnorePrefix'] as String,
      numBooks: (json['numBooks'] as num?)?.toInt(),
    );

Map<String, dynamic> _$CollapsedSeriesToJson(_CollapsedSeries instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameIgnorePrefix': instance.nameIgnorePrefix,
      'numBooks': instance.numBooks,
    };
