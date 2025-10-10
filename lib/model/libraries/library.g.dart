// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_Library _$LibraryFromJson(Map<String, dynamic> json) => _Library(
  id: json['id'] as String,
  name: json['name'] as String,
  folders: (json['folders'] as List<dynamic>)
      .map((e) => Folder.fromJson(e as Map<String, dynamic>))
      .toList(),
  displayOrder: (json['displayOrder'] as num).toInt(),
  icon: json['icon'] as String,
  mediaType: json['mediaType'] as String,
  provider: json['provider'] as String?,
  settings: LibrarySettings.fromJson(json['settings'] as Map<String, dynamic>),
);

Map<String, dynamic> _$LibraryToJson(_Library instance) => <String, dynamic>{
  'id': instance.id,
  'name': instance.name,
  'folders': instance.folders,
  'displayOrder': instance.displayOrder,
  'icon': instance.icon,
  'mediaType': instance.mediaType,
  'provider': instance.provider,
  'settings': instance.settings,
};
