import 'package:isar/isar.dart';

part 'media_progress_entity.g.dart';

@embedded
class MediaProgressEntity {
  String? itemId;
  String? mediaItemType;
  double? duration;
  double? progress;
  double? currentTime;
  bool isFinished;
  bool hideFromContinueListening;
  double? ebookProgress;
  int? lastUpdate;
  int? startedAt;
  int? finishedAt;

  MediaProgressEntity(
      {this.itemId,
      this.mediaItemType,
      this.duration,
      this.progress,
      this.currentTime,
      this.isFinished = false,
      this.hideFromContinueListening = false,
      this.ebookProgress,
      this.lastUpdate,
      this.startedAt,
      this.finishedAt});
}
