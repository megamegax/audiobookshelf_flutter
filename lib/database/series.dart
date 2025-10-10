import 'package:freezed_annotation/freezed_annotation.dart';

part 'series.freezed.dart';

@freezed
sealed class Series with _$Series {
  const factory Series({
    required int id,
    required String seriesId,
    required String name,
    required String nameIgnorePrefix,
    required int addedAt,
    int? updatedAt,
    String? description,
    @Default([]) List<String> bookIds, // Use book IDs instead of full entities
  }) = _Series;
}
