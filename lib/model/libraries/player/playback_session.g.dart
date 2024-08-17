// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'playback_session.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$PlaybackSessionImpl _$$PlaybackSessionImplFromJson(
        Map<String, dynamic> json) =>
    _$PlaybackSessionImpl(
      id: json['id'] as String,
      userId: json['userId'] as String?,
      libraryItemId: json['libraryItemId'] as String?,
      episodeId: json['episodeId'] as String?,
      mediaType: json['mediaType'] as String,
      deviceInfo: DeviceInfoResponse.fromJson(
          json['deviceInfo'] as Map<String, dynamic>),
      chapters: (json['chapters'] as List<dynamic>)
          .map((e) => BookChapter.fromJson(e as Map<String, dynamic>))
          .toList(),
      displayTitle: json['displayTitle'] as String?,
      displayAuthor: json['displayAuthor'] as String?,
      coverPath: json['coverPath'] as String?,
      duration: (json['duration'] as num).toDouble(),
      playMethod: (json['playMethod'] as num).toInt(),
      startedAt: (json['startedAt'] as num).toInt(),
      updatedAt: (json['updatedAt'] as num).toInt(),
      timeListening: (json['timeListening'] as num).toInt(),
      audioTracks: (json['audioTracks'] as List<dynamic>)
          .map((e) => AudioTrack.fromJson(e as Map<String, dynamic>))
          .toList(),
      currentTime: (json['currentTime'] as num).toDouble(),
      libraryItem: json['libraryItem'] == null
          ? null
          : LibraryItem.fromJson(json['libraryItem'] as Map<String, dynamic>),
      localEpisodeId: json['localEpisodeId'] as String?,
      serverConnectionConfigId: json['serverConnectionConfigId'] as String?,
      serverAddress: json['serverAddress'] as String?,
      mediaPlayer: json['mediaPlayer'] as String?,
    );

Map<String, dynamic> _$$PlaybackSessionImplToJson(
        _$PlaybackSessionImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'userId': instance.userId,
      'libraryItemId': instance.libraryItemId,
      'episodeId': instance.episodeId,
      'mediaType': instance.mediaType,
      'deviceInfo': instance.deviceInfo,
      'chapters': instance.chapters,
      'displayTitle': instance.displayTitle,
      'displayAuthor': instance.displayAuthor,
      'coverPath': instance.coverPath,
      'duration': instance.duration,
      'playMethod': instance.playMethod,
      'startedAt': instance.startedAt,
      'updatedAt': instance.updatedAt,
      'timeListening': instance.timeListening,
      'audioTracks': instance.audioTracks,
      'currentTime': instance.currentTime,
      'libraryItem': instance.libraryItem,
      'localEpisodeId': instance.localEpisodeId,
      'serverConnectionConfigId': instance.serverConnectionConfigId,
      'serverAddress': instance.serverAddress,
      'mediaPlayer': instance.mediaPlayer,
    };
