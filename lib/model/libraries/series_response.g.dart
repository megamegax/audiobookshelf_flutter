// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$SeriesResponseImpl _$$SeriesResponseImplFromJson(Map<String, dynamic> json) =>
    _$SeriesResponseImpl(
      results: (json['results'] as List<dynamic>)
          .map((e) => SeriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$SeriesResponseImplToJson(
        _$SeriesResponseImpl instance) =>
    <String, dynamic>{
      'results': instance.results,
    };
