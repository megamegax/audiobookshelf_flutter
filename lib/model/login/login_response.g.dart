// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'login_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) =>
    _LoginResponse(
      user: UserModel.fromJson(json['user'] as Map<String, dynamic>),
      userDefaultLibraryId: json['userDefaultLibraryId'] as String,
      serverSettings: ServerSettings.fromJson(
        json['serverSettings'] as Map<String, dynamic>,
      ),
      ereaderDevices: (json['ereaderDevices'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      Source: json['Source'] as String,
    );

Map<String, dynamic> _$LoginResponseToJson(_LoginResponse instance) =>
    <String, dynamic>{
      'user': instance.user,
      'userDefaultLibraryId': instance.userDefaultLibraryId,
      'serverSettings': instance.serverSettings,
      'ereaderDevices': instance.ereaderDevices,
      'Source': instance.Source,
    };
