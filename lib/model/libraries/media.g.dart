// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$MediaImpl _$$MediaImplFromJson(Map<String, dynamic> json) => _$MediaImpl(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      coverPath: json['coverPath'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      numTracks: (json['numTracks'] as num?)?.toInt(),
      numAudioFiles: (json['numAudioFiles'] as num?)?.toInt(),
      numChapters: (json['numChapters'] as num?)?.toInt(),
      numMissingParts: (json['numMissingParts'] as num?)?.toInt(),
      numInvalidAudioFiles: (json['numInvalidAudioFiles'] as num?)?.toInt(),
      duration: (json['duration'] as num).toDouble(),
      size: (json['size'] as num).toInt(),
      ebookFileFormat: json['ebookFileFormat'] as String?,
    );

Map<String, dynamic> _$$MediaImplToJson(_$MediaImpl instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'coverPath': instance.coverPath,
      'tags': instance.tags,
      'numTracks': instance.numTracks,
      'numAudioFiles': instance.numAudioFiles,
      'numChapters': instance.numChapters,
      'numMissingParts': instance.numMissingParts,
      'numInvalidAudioFiles': instance.numInvalidAudioFiles,
      'duration': instance.duration,
      'size': instance.size,
      'ebookFileFormat': instance.ebookFileFormat,
    };
