// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'collapsed_series.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$CollapsedSeriesImpl _$$CollapsedSeriesImplFromJson(
        Map<String, dynamic> json) =>
    _$CollapsedSeriesImpl(
      id: json['id'] as String,
      name: json['name'] as String,
      nameIgnorePrefix: json['nameIgnorePrefix'] as String,
      numBooks: json['numBooks'] as int,
    );

Map<String, dynamic> _$$CollapsedSeriesImplToJson(
        _$CollapsedSeriesImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'name': instance.name,
      'nameIgnorePrefix': instance.nameIgnorePrefix,
      'numBooks': instance.numBooks,
    };
