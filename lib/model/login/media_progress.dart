import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'media_progress.freezed.dart';
part 'media_progress.g.dart';

@freezed
class MediaProgress with _$MediaProgress {
  const factory MediaProgress({
    String? id,
    String? userId,
    String? libraryItemId,
    String? episodeId,
    String? mediaItemId,
    String? mediaItemType,
    double? duration,
    double? progress,
    double? currentTime,
    required bool isFinished,
    required bool hideFromContinueListening,
    String? ebookLocation,
    double? ebookProgress,
    int? lastUpdate,
    int? startedAt,
    int? finishedAt,
  }) = _MediaProgress;

  factory MediaProgress.fromJson(Map<String, dynamic> json) =>
      _$MediaProgressFromJson(json);
}
