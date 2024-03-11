import 'package:freezed_annotation/freezed_annotation.dart';

part 'collapsed_series.freezed.dart';
part 'collapsed_series.g.dart';

@freezed
class CollapsedSeries with _$CollapsedSeries {
  const factory CollapsedSeries({
    required String id,
    required String name,
    required String nameIgnorePrefix,
    required int numBooks,
  }) = _CollapsedSeries;

  factory CollapsedSeries.fromJson(Map<String, dynamic> json) =>
      _$CollapsedSeriesFromJson(json);
}
