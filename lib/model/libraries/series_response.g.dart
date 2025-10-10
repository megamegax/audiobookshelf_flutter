// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'series_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_SeriesResponse _$SeriesResponseFromJson(Map<String, dynamic> json) =>
    _SeriesResponse(
      results: (json['results'] as List<dynamic>)
          .map((e) => SeriesItem.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$SeriesResponseToJson(_SeriesResponse instance) =>
    <String, dynamic>{'results': instance.results};
