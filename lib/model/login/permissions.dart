import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'permissions.freezed.dart';
part 'permissions.g.dart';

@freezed
class Permissions with _$Permissions {
  const factory Permissions({
    bool? download,
    bool? update,
    bool? delete,
    bool? upload,
    bool? accessAllLibraries,
    bool? accessAllTags,
    bool? accessExplicitContent,
  }) = _Permissions;

  factory Permissions.fromJson(Map<String, dynamic> json) =>
      _$PermissionsFromJson(json);
}
