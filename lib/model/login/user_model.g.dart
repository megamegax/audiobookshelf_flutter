// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'user_model.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$UserModelImpl _$$UserModelImplFromJson(Map<String, dynamic> json) =>
    _$UserModelImpl(
      id: json['id'] as String?,
      oldUserId: json['oldUserId'] as String?,
      username: json['username'] as String?,
      email: json['email'] as String?,
      type: json['type'] as String?,
      token: json['token'] as String?,
      mediaProgress: (json['mediaProgress'] as List<dynamic>?)
          ?.map((e) => MediaProgress.fromJson(e as Map<String, dynamic>))
          .toList(),
      seriesHideFromContinueListening:
          json['seriesHideFromContinueListening'] as List<dynamic>?,
      bookmarks: json['bookmarks'] as List<dynamic>?,
      isActive: json['isActive'] as bool?,
      isLocked: json['isLocked'] as bool?,
      lastSeen: json['lastSeen'] as int?,
      createdAt: json['createdAt'] as int?,
      permissions: json['permissions'] == null
          ? null
          : Permissions.fromJson(json['permissions'] as Map<String, dynamic>),
      librariesAccessible: json['librariesAccessible'] as List<dynamic>?,
      itemTagsSelected: json['itemTagsSelected'] as List<dynamic>?,
      hasOpenIDLink: json['hasOpenIDLink'] as bool?,
    );

Map<String, dynamic> _$$UserModelImplToJson(_$UserModelImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'oldUserId': instance.oldUserId,
      'username': instance.username,
      'email': instance.email,
      'type': instance.type,
      'token': instance.token,
      'mediaProgress': instance.mediaProgress,
      'seriesHideFromContinueListening':
          instance.seriesHideFromContinueListening,
      'bookmarks': instance.bookmarks,
      'isActive': instance.isActive,
      'isLocked': instance.isLocked,
      'lastSeen': instance.lastSeen,
      'createdAt': instance.createdAt,
      'permissions': instance.permissions,
      'librariesAccessible': instance.librariesAccessible,
      'itemTagsSelected': instance.itemTagsSelected,
      'hasOpenIDLink': instance.hasOpenIDLink,
    };
