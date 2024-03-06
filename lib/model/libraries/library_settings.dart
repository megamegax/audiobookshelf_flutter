import 'package:freezed_annotation/freezed_annotation.dart';
part 'library_settings.freezed.dart';
part 'library_settings.g.dart';

@freezed
class LibrarySettings with _$LibrarySettings {
  const factory LibrarySettings(
      {required int coverAspectRatio,
      required bool disableWatcher,
      required bool skipMatchingMediaWithAsin,
      required bool skipMatchingMediaWithIsbn,
      String? autoScanCronExpression,
      required bool audiobooksOnly,
      required bool hideSingleBookSeries,
      required List<String> metadataPrecedence,
      int? lastScan,
      String? lastScanVersion,
      int? createdAt,
      int? lastUpdate}) = _LibrarySettings;

  factory LibrarySettings.fromJson(Map<String, dynamic> json) =>
      _$LibrarySettingsFromJson(json);
}
