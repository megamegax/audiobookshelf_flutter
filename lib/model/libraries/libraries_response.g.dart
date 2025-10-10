// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'libraries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_LibrariesResponse _$LibrariesResponseFromJson(Map<String, dynamic> json) =>
    _LibrariesResponse(
      libraries: (json['libraries'] as List<dynamic>)
          .map((e) => Library.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$LibrariesResponseToJson(_LibrariesResponse instance) =>
    <String, dynamic>{'libraries': instance.libraries};
