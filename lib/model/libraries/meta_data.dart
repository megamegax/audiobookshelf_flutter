import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_data.freezed.dart';
part 'meta_data.g.dart';

/// Helper function to convert dynamic list to List<String>
List<String> _genresFromJson(dynamic json) {
  if (json == null) return [];
  if (json is List) {
    return json.map((e) => e.toString()).toList();
  }
  return [];
}

/// Helper function to convert publishedYear from dynamic to int?
int? _publishedYearFromJson(dynamic json) {
  if (json == null) return null;
  if (json is int) return json;
  if (json is String) {
    return int.tryParse(json);
  }
  return null;
}

@freezed
sealed class Metadata with _$Metadata {
  const factory Metadata({
    String? title,
    String? titleIgnorePrefix,
    String? subtitle,
    String? authorName,
    String? narratorName,
    String? seriesName,
    @JsonKey(fromJson: _genresFromJson) List<String>? genres,
    @JsonKey(fromJson: _publishedYearFromJson) int? publishedYear,
    String? publishedDate,
    String? publisher,
    String? description,
    @JsonKey(name: 'descriptionFormat', defaultValue: 'text')
    String? descriptionFormat,
    String? isbn,
    String? asin,
    String? language,
    required bool explicit,
  }) = _Metadata;

  factory Metadata.fromJson(Map<String, dynamic> json) =>
      _$MetadataFromJson(json);
}

/// Extension to add helper methods for Metadata
extension MetadataHelpers on Metadata {
  /// Returns true if the description contains HTML tags
  bool get isDescriptionHtml {
    if (description == null) return false;
    return description!.contains(RegExp(r'<[^>]+>'));
  }

  /// Returns the description format, auto-detected if not specified
  String get effectiveDescriptionFormat {
    if (descriptionFormat != null) return descriptionFormat!;
    return isDescriptionHtml ? 'html' : 'text';
  }
}
