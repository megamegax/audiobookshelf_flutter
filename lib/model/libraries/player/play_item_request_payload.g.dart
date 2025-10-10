// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'play_item_request_payload.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_PlayItemRequestPayload _$PlayItemRequestPayloadFromJson(
  Map<String, dynamic> json,
) => _PlayItemRequestPayload(
  itemId: json['itemId'] as String,
  mediaType: json['mediaType'] as String,
  mediaPlayer: json['mediaPlayer'] as String,
  forceDirectPlay: json['forceDirectPlay'] as bool,
  forceTranscode: json['forceTranscode'] as bool,
  deviceInfo: DeviceInfo.fromJson(json['deviceInfo'] as Map<String, dynamic>),
);

Map<String, dynamic> _$PlayItemRequestPayloadToJson(
  _PlayItemRequestPayload instance,
) => <String, dynamic>{
  'itemId': instance.itemId,
  'mediaType': instance.mediaType,
  'mediaPlayer': instance.mediaPlayer,
  'forceDirectPlay': instance.forceDirectPlay,
  'forceTranscode': instance.forceTranscode,
  'deviceInfo': instance.deviceInfo,
};
