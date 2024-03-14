import 'package:audiobookshelf_flutter/database/library_item_entity.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';

@freezed
class Series with _$Series {
  const factory Series({
    required int id,
    required String seriesId,
    required String name,
    required String nameIgnorePrefix,
    required int addedAt,
    int? updatedAt,
    String? description,
    required List<LibraryItemEntity> books,
  }) = _Series;
}
