// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'detailed_media.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_DetailedMedia _$DetailedMediaFromJson(Map<String, dynamic> json) =>
    _DetailedMedia(
      metadata: Metadata.fromJson(json['metadata'] as Map<String, dynamic>),
      coverPath: json['coverPath'] as String,
      tags: (json['tags'] as List<dynamic>?)?.map((e) => e as String).toList(),
      audioFiles: (json['audioFiles'] as List<dynamic>?)
          ?.map((e) => AudioFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      chapters: (json['chapters'] as List<dynamic>?)
          ?.map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      tracks: (json['tracks'] as List<dynamic>?)
          ?.map((e) => Track.fromJson(e as Map<String, dynamic>))
          .toList(),
      libraryFiles: (json['libraryFiles'] as List<dynamic>?)
          ?.map((e) => LibraryFile.fromJson(e as Map<String, dynamic>))
          .toList(),
      duration: (json['duration'] as num?)?.toDouble(),
      size: (json['size'] as num?)?.toInt(),
      ebookFile: json['ebookFile'] == null
          ? null
          : EBookFile.fromJson(json['ebookFile'] as Map<String, dynamic>),
      numEpisodes: (json['numEpisodes'] as num?)?.toInt(),
      autoDownloadEpisodes: json['autoDownloadEpisodes'] as bool?,
      autoDownloadSchedule: json['autoDownloadSchedule'] as String?,
      lastEpisodeCheck: (json['lastEpisodeCheck'] as num?)?.toInt(),
      maxEpisodesToKeep: (json['maxEpisodesToKeep'] as num?)?.toInt(),
      maxNewEpisodesToDownload: (json['maxNewEpisodesToDownload'] as num?)
          ?.toInt(),
      numTracks: (json['numTracks'] as num?)?.toInt(),
      numAudioFiles: (json['numAudioFiles'] as num?)?.toInt(),
      numChapters: (json['numChapters'] as num?)?.toInt(),
    );

Map<String, dynamic> _$DetailedMediaToJson(_DetailedMedia instance) =>
    <String, dynamic>{
      'metadata': instance.metadata,
      'coverPath': instance.coverPath,
      'tags': instance.tags,
      'audioFiles': instance.audioFiles,
      'chapters': instance.chapters,
      'tracks': instance.tracks,
      'libraryFiles': instance.libraryFiles,
      'duration': instance.duration,
      'size': instance.size,
      'ebookFile': instance.ebookFile,
      'numEpisodes': instance.numEpisodes,
      'autoDownloadEpisodes': instance.autoDownloadEpisodes,
      'autoDownloadSchedule': instance.autoDownloadSchedule,
      'lastEpisodeCheck': instance.lastEpisodeCheck,
      'maxEpisodesToKeep': instance.maxEpisodesToKeep,
      'maxNewEpisodesToDownload': instance.maxNewEpisodesToDownload,
      'numTracks': instance.numTracks,
      'numAudioFiles': instance.numAudioFiles,
      'numChapters': instance.numChapters,
    };
