// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'audio_file.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$AudioFileImpl _$$AudioFileImplFromJson(Map<String, dynamic> json) =>
    _$AudioFileImpl(
      index: (json['index'] as num?)?.toInt(),
      ino: json['ino'] as String?,
      metadata: json['metadata'] == null
          ? null
          : FileMetadata.fromJson(json['metadata'] as Map<String, dynamic>),
      addedAt: (json['addedAt'] as num?)?.toInt(),
      updatedAt: (json['updatedAt'] as num?)?.toInt(),
      format: json['format'] as String?,
      duration: (json['duration'] as num?)?.toDouble(),
      bitRate: (json['bitRate'] as num?)?.toInt(),
      language: json['language'] as String?,
      codec: json['codec'] as String?,
      timeBase: json['timeBase'] as String?,
      channels: (json['channels'] as num?)?.toInt(),
      channelLayout: json['channelLayout'] as String?,
      mimeType: json['mimeType'] as String?,
      metaTags: json['metaTags'] == null
          ? null
          : MetaTags.fromJson(json['metaTags'] as Map<String, dynamic>),
    );

Map<String, dynamic> _$$AudioFileImplToJson(_$AudioFileImpl instance) =>
    <String, dynamic>{
      'index': instance.index,
      'ino': instance.ino,
      'metadata': instance.metadata,
      'addedAt': instance.addedAt,
      'updatedAt': instance.updatedAt,
      'format': instance.format,
      'duration': instance.duration,
      'bitRate': instance.bitRate,
      'language': instance.language,
      'codec': instance.codec,
      'timeBase': instance.timeBase,
      'channels': instance.channels,
      'channelLayout': instance.channelLayout,
      'mimeType': instance.mimeType,
      'metaTags': instance.metaTags,
    };
