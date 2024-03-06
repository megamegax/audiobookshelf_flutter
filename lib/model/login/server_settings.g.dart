// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'server_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$ServerSettingsImpl _$$ServerSettingsImplFromJson(Map<String, dynamic> json) =>
    _$ServerSettingsImpl(
      id: json['id'] as String,
      scannerFindCovers: json['scannerFindCovers'] as bool,
      scannerCoverProvider: json['scannerCoverProvider'] as String,
      scannerParseSubtitle: json['scannerParseSubtitle'] as bool,
      scannerPreferMatchedMetadata:
          json['scannerPreferMatchedMetadata'] as bool,
      scannerDisableWatcher: json['scannerDisableWatcher'] as bool,
      storeCoverWithItem: json['storeCoverWithItem'] as bool,
      storeMetadataWithItem: json['storeMetadataWithItem'] as bool,
      metadataFileFormat: json['metadataFileFormat'] as String,
      rateLimitLoginRequests: json['rateLimitLoginRequests'] as int,
      rateLimitLoginWindow: json['rateLimitLoginWindow'] as int,
      backupSchedule: json['backupSchedule'] as bool,
      backupsToKeep: json['backupsToKeep'] as int,
      maxBackupSize: json['maxBackupSize'] as int,
      loggerDailyLogsToKeep: json['loggerDailyLogsToKeep'] as int,
      loggerScannerLogsToKeep: json['loggerScannerLogsToKeep'] as int,
      homeBookshelfView: json['homeBookshelfView'] as int,
      bookshelfView: json['bookshelfView'] as int,
      podcastEpisodeSchedule: json['podcastEpisodeSchedule'] as String,
      sortingIgnorePrefix: json['sortingIgnorePrefix'] as bool,
      sortingPrefixes: (json['sortingPrefixes'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      chromecastEnabled: json['chromecastEnabled'] as bool,
      dateFormat: json['dateFormat'] as String,
      timeFormat: json['timeFormat'] as String,
      language: json['language'] as String,
      logLevel: json['logLevel'] as int,
      version: json['version'] as String,
      buildNumber: json['buildNumber'] as int,
      authLoginCustomMessage: json['authLoginCustomMessage'] as String?,
      authActiveAuthMethods: (json['authActiveAuthMethods'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      authOpenIDIssuerURL: json['authOpenIDIssuerURL'] as String?,
      authOpenIDAuthorizationURL: json['authOpenIDAuthorizationURL'] as String?,
      authOpenIDTokenURL: json['authOpenIDTokenURL'] as String?,
      authOpenIDJwksURL: json['authOpenIDJwksURL'] as String?,
      authOpenIDLogoutURL: json['authOpenIDLogoutURL'] as String?,
      authOpenIDUserInfoURL: json['authOpenIDUserInfoURL'] as String?,
      authOpenIDButtonText: json['authOpenIDButtonText'] as String?,
      authOpenIDAutoLaunch: json['authOpenIDAutoLaunch'] as bool,
      authOpenIDAutoRegister: json['authOpenIDAutoRegister'] as bool,
      authOpenIDMatchExistingBy: json['authOpenIDMatchExistingBy'] as String?,
    );

Map<String, dynamic> _$$ServerSettingsImplToJson(
        _$ServerSettingsImpl instance) =>
    <String, dynamic>{
      'id': instance.id,
      'scannerFindCovers': instance.scannerFindCovers,
      'scannerCoverProvider': instance.scannerCoverProvider,
      'scannerParseSubtitle': instance.scannerParseSubtitle,
      'scannerPreferMatchedMetadata': instance.scannerPreferMatchedMetadata,
      'scannerDisableWatcher': instance.scannerDisableWatcher,
      'storeCoverWithItem': instance.storeCoverWithItem,
      'storeMetadataWithItem': instance.storeMetadataWithItem,
      'metadataFileFormat': instance.metadataFileFormat,
      'rateLimitLoginRequests': instance.rateLimitLoginRequests,
      'rateLimitLoginWindow': instance.rateLimitLoginWindow,
      'backupSchedule': instance.backupSchedule,
      'backupsToKeep': instance.backupsToKeep,
      'maxBackupSize': instance.maxBackupSize,
      'loggerDailyLogsToKeep': instance.loggerDailyLogsToKeep,
      'loggerScannerLogsToKeep': instance.loggerScannerLogsToKeep,
      'homeBookshelfView': instance.homeBookshelfView,
      'bookshelfView': instance.bookshelfView,
      'podcastEpisodeSchedule': instance.podcastEpisodeSchedule,
      'sortingIgnorePrefix': instance.sortingIgnorePrefix,
      'sortingPrefixes': instance.sortingPrefixes,
      'chromecastEnabled': instance.chromecastEnabled,
      'dateFormat': instance.dateFormat,
      'timeFormat': instance.timeFormat,
      'language': instance.language,
      'logLevel': instance.logLevel,
      'version': instance.version,
      'buildNumber': instance.buildNumber,
      'authLoginCustomMessage': instance.authLoginCustomMessage,
      'authActiveAuthMethods': instance.authActiveAuthMethods,
      'authOpenIDIssuerURL': instance.authOpenIDIssuerURL,
      'authOpenIDAuthorizationURL': instance.authOpenIDAuthorizationURL,
      'authOpenIDTokenURL': instance.authOpenIDTokenURL,
      'authOpenIDJwksURL': instance.authOpenIDJwksURL,
      'authOpenIDLogoutURL': instance.authOpenIDLogoutURL,
      'authOpenIDUserInfoURL': instance.authOpenIDUserInfoURL,
      'authOpenIDButtonText': instance.authOpenIDButtonText,
      'authOpenIDAutoLaunch': instance.authOpenIDAutoLaunch,
      'authOpenIDAutoRegister': instance.authOpenIDAutoRegister,
      'authOpenIDMatchExistingBy': instance.authOpenIDMatchExistingBy,
    };
