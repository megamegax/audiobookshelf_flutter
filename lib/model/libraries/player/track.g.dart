// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'track.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$TrackImpl _$$TrackImplFromJson(Map<String, dynamic> json) => _$TrackImpl(
      index: (json['index'] as num).toInt(),
      startOffset: (json['startOffset'] as num?)?.toDouble(),
      duration: (json['duration'] as num?)?.toDouble(),
      title: json['title'] as String?,
      contentUrl: json['contentUrl'] as String?,
      mimeType: json['mimeType'] as String?,
      metadata: json['metadata'] == null
          ? null
          : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$TrackImplToJson(_$TrackImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'startOffset': instance.startOffset,
      'duration': instance.duration,
      'title': instance.title,
      'contentUrl': instance.contentUrl,
      'mimeType': instance.mimeType,
      'metadata': instance.metadata,
    };
