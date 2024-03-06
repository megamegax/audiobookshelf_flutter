import 'package:isar/isar.dart';
part 'library_settings_entity.g.dart';

@embedded
class LibrarySettingsEntity {
  int coverAspectRatio = 1;
  bool disableWatcher = false;
  bool skipMatchingMediaWithAsin = false;
  bool skipMatchingMediaWithIsbn = false;
  String? autoScanCronExpression;
  bool audiobooksOnly = false;
  bool hideSingleBookSeries = false;
  List<String> metadataPrecedence = const [];
  int? lastScan;
  String? lastScanVersion;
  int? createdAt;
  int? lastUpdate;
}
