import 'package:audiobookshelf_flutter/model/login/media_progress.dart';
import 'package:audiobookshelf_flutter/model/login/permissions.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'user_model.freezed.dart';
part 'user_model.g.dart';

@freezed
class UserModel with _$UserModel {
  const factory UserModel({
    String? id,
    String? oldUserId,
    String? username,
    String? email,
    String? type,
    String? token,
    List<MediaProgress>? mediaProgress,
    List<dynamic>? seriesHideFromContinueListening,
    List<dynamic>? bookmarks,
    bool? isActive,
    bool? isLocked,
    int? lastSeen,
    int? createdAt,
    Permissions? permissions,
    List<dynamic>? librariesAccessible,
    List<dynamic>? itemTagsSelected,
    bool? hasOpenIDLink,
  }) = _UserModel;

  factory UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);
}

