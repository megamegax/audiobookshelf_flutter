// GENERATED CODE - DO NOT MODIFY BY HAND

part of 'library_settings.dart';

// **************************************************************************
// JsonSerializableGenerator
// **************************************************************************

_$LibrarySettingsImpl _$$LibrarySettingsImplFromJson(
        Map<String, dynamic> json) =>
    _$LibrarySettingsImpl(
      coverAspectRatio: (json['coverAspectRatio'] as num).toInt(),
      disableWatcher: json['disableWatcher'] as bool,
      skipMatchingMediaWithAsin: json['skipMatchingMediaWithAsin'] as bool,
      skipMatchingMediaWithIsbn: json['skipMatchingMediaWithIsbn'] as bool,
      autoScanCronExpression: json['autoScanCronExpression'] as String?,
      audiobooksOnly: json['audiobooksOnly'] as bool,
      hideSingleBookSeries: json['hideSingleBookSeries'] as bool,
      metadataPrecedence: (json['metadataPrecedence'] as List<dynamic>)
          .map((e) => e as String)
          .toList(),
      lastScan: (json['lastScan'] as num?)?.toInt(),
      lastScanVersion: json['lastScanVersion'] as String?,
      createdAt: (json['createdAt'] as num?)?.toInt(),
      lastUpdate: (json['lastUpdate'] as num?)?.toInt(),
    );

Map<String, dynamic> _$$LibrarySettingsImplToJson(
        _$LibrarySettingsImpl instance) =>
    <String, dynamic>{
      'coverAspectRatio': instance.coverAspectRatio,
      'disableWatcher': instance.disableWatcher,
      'skipMatchingMediaWithAsin': instance.skipMatchingMediaWithAsin,
      'skipMatchingMediaWithIsbn': instance.skipMatchingMediaWithIsbn,
      'autoScanCronExpression': instance.autoScanCronExpression,
      'audiobooksOnly': instance.audiobooksOnly,
      'hideSingleBookSeries': instance.hideSingleBookSeries,
      'metadataPrecedence': instance.metadataPrecedence,
      'lastScan': instance.lastScan,
      'lastScanVersion': instance.lastScanVersion,
      'createdAt': instance.createdAt,
      'lastUpdate': instance.lastUpdate,
    };
