// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'libraries_response.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LibrariesResponseImpl _$$LibrariesResponseImplFromJson(
        Map<String, dynamic> json) =>
    _$LibrariesResponseImpl(
      libraries: (json['libraries'] as List<dynamic>)
          .map((e) => Library.fromJson(e as Map<String, dynamic>))
          .toList(),
    );

Map<String, dynamic> _$$LibrariesResponseImplToJson(
        _$LibrariesResponseImpl instance) =>
    <String, dynamic>{
      'libraries': instance.libraries,
    };
