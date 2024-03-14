import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_item.freezed.dart';
part 'series_item.g.dart';

@freezed
class SeriesItem with _$SeriesItem {
  const factory SeriesItem({
    required String id,
    required String name,
    required String nameIgnorePrefix,
    required int addedAt,
    int? updatedAt,
    String? description,
    required List<SeriesBook> books,
  }) = _SeriesItem;

  factory SeriesItem.fromJson(Map<String, dynamic> json) =>
      _$SeriesItemFromJson(json);
}

@freezed
class SeriesBook with _$SeriesBook {
  const factory SeriesBook({
    required String id,
  }) = _SeriesBook;

  factory SeriesBook.fromJson(Map<String, dynamic> json) =>
      _$SeriesBookFromJson(json);
}
