import 'package:audiobookshelf_flutter/model/login/user_model.dart';
import 'package:flutter/widgets.dart';
import 'package:freezed_annotation/freezed_annotation.dart';
import 'package:flutter/foundation.dart';

part 'server_settings.freezed.dart';
part 'server_settings.g.dart';

@freezed
class ServerSettings with _$ServerSettings {
  const factory ServerSettings({
    required String id,
    required bool scannerFindCovers,
    required String scannerCoverProvider,
    required bool scannerParseSubtitle,
    required bool scannerPreferMatchedMetadata,
    required bool scannerDisableWatcher,
    required bool storeCoverWithItem,
    required bool storeMetadataWithItem,
    required String metadataFileFormat,
    required int rateLimitLoginRequests,
    required int rateLimitLoginWindow,
    required bool backupSchedule,
    required int backupsToKeep,
    required int maxBackupSize,
    required int loggerDailyLogsToKeep,
    required int loggerScannerLogsToKeep,
    required int homeBookshelfView,
    required int bookshelfView,
    required String podcastEpisodeSchedule,
    required bool sortingIgnorePrefix,
    required List<String> sortingPrefixes,
    required bool chromecastEnabled,
    required String dateFormat,
    required String timeFormat,
    required String language,
    required int logLevel,
    required String version,
    required int buildNumber,
    String? authLoginCustomMessage,
    required List<String> authActiveAuthMethods,
    String? authOpenIDIssuerURL,
    String? authOpenIDAuthorizationURL,
    String? authOpenIDTokenURL,
    String? authOpenIDJwksURL,
    String? authOpenIDLogoutURL,
    String? authOpenIDUserInfoURL,
    String? authOpenIDButtonText,
    required bool authOpenIDAutoLaunch,
    required bool authOpenIDAutoRegister,
    String? authOpenIDMatchExistingBy,
  }) = _ServerSettings;

  factory ServerSettings.fromJson(Map<String, dynamic> json) =>
      _$ServerSettingsFromJson(json);
}
