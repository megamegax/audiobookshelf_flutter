import 'package:audiobookshelf_flutter/model/libraries/series_item.dart';
import 'package:freezed_annotation/freezed_annotation.dart';

part 'series_response.freezed.dart';
part 'series_response.g.dart';

@freezed
class SeriesResponse with _$SeriesResponse {
  const factory SeriesResponse({
    required List<SeriesItem> results,
  }) = _SeriesResponse;

  factory SeriesResponse.fromJson(Map<String, dynamic> json) =>
      _$SeriesResponseFromJson(json);
}
