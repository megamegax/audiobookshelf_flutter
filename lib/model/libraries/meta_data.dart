import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data.freezed.dart';
part 'meta_data.g.dart';

@freezed
class Metadata with _$Metadata {
  const factory Metadata({
    required String title,
    String? titleIgnorePrefix,
    String? subtitle,
    String? authorName,
    String? narratorName,
    String? seriesName,
    required List<String> genres,
    String? publishedYear,
    String? publishedDate,
    String? publisher,
    String? description,
    String? isbn,
    String? asin,
    String? language,
    required bool explicit,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}
