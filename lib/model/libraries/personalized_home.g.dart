// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'personalized_home.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PersonalizedHomeImpl _$$PersonalizedHomeImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizedHomeImpl(
      id: $enumDecode(_$SectionTypeEnumMap, json['id']),
      type: json['type'] as String,
      entities: (json['entities'] as List<dynamic>)
          .map((e) => PersonalizedEntity.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$PersonalizedHomeImplToJson(
        _$PersonalizedHomeImpl instance) =>
    <String, dynamic>{
      'id': _$SectionTypeEnumMap[instance.id]!,
      'type': instance.type,
      'entities': instance.entities,
    };

const _$SectionTypeEnumMap = {
  SectionType.continueListening: 'continue-listening',
  SectionType.continueSeries: 'continue-series',
  SectionType.recentSeries: 'recent-series',
  SectionType.discover: 'discover',
  SectionType.listenAgain: 'listen-again',
};

_$PersonalizedEntityImpl _$$PersonalizedEntityImplFromJson(
        Map<String, dynamic> json) =>
    _$PersonalizedEntityImpl(
      id: json['id'] as String,
    );

Map<String, dynamic> _$$PersonalizedEntityImplToJson(
        _$PersonalizedEntityImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
    };
