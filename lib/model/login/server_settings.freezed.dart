// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'server_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$ServerSettings {

 String get id; bool get scannerFindCovers; String get scannerCoverProvider; bool get scannerParseSubtitle; bool get scannerPreferMatchedMetadata; bool get scannerDisableWatcher; bool get storeCoverWithItem; bool get storeMetadataWithItem; String get metadataFileFormat; int get rateLimitLoginRequests; int get rateLimitLoginWindow; bool get backupSchedule; int get backupsToKeep; int get maxBackupSize; int get loggerDailyLogsToKeep; int get loggerScannerLogsToKeep; int get homeBookshelfView; int get bookshelfView; String get podcastEpisodeSchedule; bool get sortingIgnorePrefix; List<String> get sortingPrefixes; bool get chromecastEnabled; String get dateFormat; String get timeFormat; String get language; int get logLevel; String get version; int get buildNumber; String? get authLoginCustomMessage; List<String> get authActiveAuthMethods; String? get authOpenIDIssuerURL; String? get authOpenIDAuthorizationURL; String? get authOpenIDTokenURL; String? get authOpenIDJwksURL; String? get authOpenIDLogoutURL; String? get authOpenIDUserInfoURL; String? get authOpenIDButtonText; bool get authOpenIDAutoLaunch; bool get authOpenIDAutoRegister; String? get authOpenIDMatchExistingBy;
/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$ServerSettingsCopyWith<ServerSettings> get copyWith => _$ServerSettingsCopyWithImpl<ServerSettings>(this as ServerSettings, _$identity);

  /// Serializes this ServerSettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is ServerSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerFindCovers, scannerFindCovers) || other.scannerFindCovers == scannerFindCovers)&&(identical(other.scannerCoverProvider, scannerCoverProvider) || other.scannerCoverProvider == scannerCoverProvider)&&(identical(other.scannerParseSubtitle, scannerParseSubtitle) || other.scannerParseSubtitle == scannerParseSubtitle)&&(identical(other.scannerPreferMatchedMetadata, scannerPreferMatchedMetadata) || other.scannerPreferMatchedMetadata == scannerPreferMatchedMetadata)&&(identical(other.scannerDisableWatcher, scannerDisableWatcher) || other.scannerDisableWatcher == scannerDisableWatcher)&&(identical(other.storeCoverWithItem, storeCoverWithItem) || other.storeCoverWithItem == storeCoverWithItem)&&(identical(other.storeMetadataWithItem, storeMetadataWithItem) || other.storeMetadataWithItem == storeMetadataWithItem)&&(identical(other.metadataFileFormat, metadataFileFormat) || other.metadataFileFormat == metadataFileFormat)&&(identical(other.rateLimitLoginRequests, rateLimitLoginRequests) || other.rateLimitLoginRequests == rateLimitLoginRequests)&&(identical(other.rateLimitLoginWindow, rateLimitLoginWindow) || other.rateLimitLoginWindow == rateLimitLoginWindow)&&(identical(other.backupSchedule, backupSchedule) || other.backupSchedule == backupSchedule)&&(identical(other.backupsToKeep, backupsToKeep) || other.backupsToKeep == backupsToKeep)&&(identical(other.maxBackupSize, maxBackupSize) || other.maxBackupSize == maxBackupSize)&&(identical(other.loggerDailyLogsToKeep, loggerDailyLogsToKeep) || other.loggerDailyLogsToKeep == loggerDailyLogsToKeep)&&(identical(other.loggerScannerLogsToKeep, loggerScannerLogsToKeep) || other.loggerScannerLogsToKeep == loggerScannerLogsToKeep)&&(identical(other.homeBookshelfView, homeBookshelfView) || other.homeBookshelfView == homeBookshelfView)&&(identical(other.bookshelfView, bookshelfView) || other.bookshelfView == bookshelfView)&&(identical(other.podcastEpisodeSchedule, podcastEpisodeSchedule) || other.podcastEpisodeSchedule == podcastEpisodeSchedule)&&(identical(other.sortingIgnorePrefix, sortingIgnorePrefix) || other.sortingIgnorePrefix == sortingIgnorePrefix)&&const DeepCollectionEquality().equals(other.sortingPrefixes, sortingPrefixes)&&(identical(other.chromecastEnabled, chromecastEnabled) || other.chromecastEnabled == chromecastEnabled)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.timeFormat, timeFormat) || other.timeFormat == timeFormat)&&(identical(other.language, language) || other.language == language)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.authLoginCustomMessage, authLoginCustomMessage) || other.authLoginCustomMessage == authLoginCustomMessage)&&const DeepCollectionEquality().equals(other.authActiveAuthMethods, authActiveAuthMethods)&&(identical(other.authOpenIDIssuerURL, authOpenIDIssuerURL) || other.authOpenIDIssuerURL == authOpenIDIssuerURL)&&(identical(other.authOpenIDAuthorizationURL, authOpenIDAuthorizationURL) || other.authOpenIDAuthorizationURL == authOpenIDAuthorizationURL)&&(identical(other.authOpenIDTokenURL, authOpenIDTokenURL) || other.authOpenIDTokenURL == authOpenIDTokenURL)&&(identical(other.authOpenIDJwksURL, authOpenIDJwksURL) || other.authOpenIDJwksURL == authOpenIDJwksURL)&&(identical(other.authOpenIDLogoutURL, authOpenIDLogoutURL) || other.authOpenIDLogoutURL == authOpenIDLogoutURL)&&(identical(other.authOpenIDUserInfoURL, authOpenIDUserInfoURL) || other.authOpenIDUserInfoURL == authOpenIDUserInfoURL)&&(identical(other.authOpenIDButtonText, authOpenIDButtonText) || other.authOpenIDButtonText == authOpenIDButtonText)&&(identical(other.authOpenIDAutoLaunch, authOpenIDAutoLaunch) || other.authOpenIDAutoLaunch == authOpenIDAutoLaunch)&&(identical(other.authOpenIDAutoRegister, authOpenIDAutoRegister) || other.authOpenIDAutoRegister == authOpenIDAutoRegister)&&(identical(other.authOpenIDMatchExistingBy, authOpenIDMatchExistingBy) || other.authOpenIDMatchExistingBy == authOpenIDMatchExistingBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,scannerFindCovers,scannerCoverProvider,scannerParseSubtitle,scannerPreferMatchedMetadata,scannerDisableWatcher,storeCoverWithItem,storeMetadataWithItem,metadataFileFormat,rateLimitLoginRequests,rateLimitLoginWindow,backupSchedule,backupsToKeep,maxBackupSize,loggerDailyLogsToKeep,loggerScannerLogsToKeep,homeBookshelfView,bookshelfView,podcastEpisodeSchedule,sortingIgnorePrefix,const DeepCollectionEquality().hash(sortingPrefixes),chromecastEnabled,dateFormat,timeFormat,language,logLevel,version,buildNumber,authLoginCustomMessage,const DeepCollectionEquality().hash(authActiveAuthMethods),authOpenIDIssuerURL,authOpenIDAuthorizationURL,authOpenIDTokenURL,authOpenIDJwksURL,authOpenIDLogoutURL,authOpenIDUserInfoURL,authOpenIDButtonText,authOpenIDAutoLaunch,authOpenIDAutoRegister,authOpenIDMatchExistingBy]);

@override
String toString() {
  return 'ServerSettings(id: $id, scannerFindCovers: $scannerFindCovers, scannerCoverProvider: $scannerCoverProvider, scannerParseSubtitle: $scannerParseSubtitle, scannerPreferMatchedMetadata: $scannerPreferMatchedMetadata, scannerDisableWatcher: $scannerDisableWatcher, storeCoverWithItem: $storeCoverWithItem, storeMetadataWithItem: $storeMetadataWithItem, metadataFileFormat: $metadataFileFormat, rateLimitLoginRequests: $rateLimitLoginRequests, rateLimitLoginWindow: $rateLimitLoginWindow, backupSchedule: $backupSchedule, backupsToKeep: $backupsToKeep, maxBackupSize: $maxBackupSize, loggerDailyLogsToKeep: $loggerDailyLogsToKeep, loggerScannerLogsToKeep: $loggerScannerLogsToKeep, homeBookshelfView: $homeBookshelfView, bookshelfView: $bookshelfView, podcastEpisodeSchedule: $podcastEpisodeSchedule, sortingIgnorePrefix: $sortingIgnorePrefix, sortingPrefixes: $sortingPrefixes, chromecastEnabled: $chromecastEnabled, dateFormat: $dateFormat, timeFormat: $timeFormat, language: $language, logLevel: $logLevel, version: $version, buildNumber: $buildNumber, authLoginCustomMessage: $authLoginCustomMessage, authActiveAuthMethods: $authActiveAuthMethods, authOpenIDIssuerURL: $authOpenIDIssuerURL, authOpenIDAuthorizationURL: $authOpenIDAuthorizationURL, authOpenIDTokenURL: $authOpenIDTokenURL, authOpenIDJwksURL: $authOpenIDJwksURL, authOpenIDLogoutURL: $authOpenIDLogoutURL, authOpenIDUserInfoURL: $authOpenIDUserInfoURL, authOpenIDButtonText: $authOpenIDButtonText, authOpenIDAutoLaunch: $authOpenIDAutoLaunch, authOpenIDAutoRegister: $authOpenIDAutoRegister, authOpenIDMatchExistingBy: $authOpenIDMatchExistingBy)';
}


}

/// @nodoc
abstract mixin class $ServerSettingsCopyWith<$Res>  {
  factory $ServerSettingsCopyWith(ServerSettings value, $Res Function(ServerSettings) _then) = _$ServerSettingsCopyWithImpl;
@useResult
$Res call({
 String id, bool scannerFindCovers, String scannerCoverProvider, bool scannerParseSubtitle, bool scannerPreferMatchedMetadata, bool scannerDisableWatcher, bool storeCoverWithItem, bool storeMetadataWithItem, String metadataFileFormat, int rateLimitLoginRequests, int rateLimitLoginWindow, bool backupSchedule, int backupsToKeep, int maxBackupSize, int loggerDailyLogsToKeep, int loggerScannerLogsToKeep, int homeBookshelfView, int bookshelfView, String podcastEpisodeSchedule, bool sortingIgnorePrefix, List<String> sortingPrefixes, bool chromecastEnabled, String dateFormat, String timeFormat, String language, int logLevel, String version, int buildNumber, String? authLoginCustomMessage, List<String> authActiveAuthMethods, String? authOpenIDIssuerURL, String? authOpenIDAuthorizationURL, String? authOpenIDTokenURL, String? authOpenIDJwksURL, String? authOpenIDLogoutURL, String? authOpenIDUserInfoURL, String? authOpenIDButtonText, bool authOpenIDAutoLaunch, bool authOpenIDAutoRegister, String? authOpenIDMatchExistingBy
});




}
/// @nodoc
class _$ServerSettingsCopyWithImpl<$Res>
    implements $ServerSettingsCopyWith<$Res> {
  _$ServerSettingsCopyWithImpl(this._self, this._then);

  final ServerSettings _self;
  final $Res Function(ServerSettings) _then;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? scannerFindCovers = null,Object? scannerCoverProvider = null,Object? scannerParseSubtitle = null,Object? scannerPreferMatchedMetadata = null,Object? scannerDisableWatcher = null,Object? storeCoverWithItem = null,Object? storeMetadataWithItem = null,Object? metadataFileFormat = null,Object? rateLimitLoginRequests = null,Object? rateLimitLoginWindow = null,Object? backupSchedule = null,Object? backupsToKeep = null,Object? maxBackupSize = null,Object? loggerDailyLogsToKeep = null,Object? loggerScannerLogsToKeep = null,Object? homeBookshelfView = null,Object? bookshelfView = null,Object? podcastEpisodeSchedule = null,Object? sortingIgnorePrefix = null,Object? sortingPrefixes = null,Object? chromecastEnabled = null,Object? dateFormat = null,Object? timeFormat = null,Object? language = null,Object? logLevel = null,Object? version = null,Object? buildNumber = null,Object? authLoginCustomMessage = freezed,Object? authActiveAuthMethods = null,Object? authOpenIDIssuerURL = freezed,Object? authOpenIDAuthorizationURL = freezed,Object? authOpenIDTokenURL = freezed,Object? authOpenIDJwksURL = freezed,Object? authOpenIDLogoutURL = freezed,Object? authOpenIDUserInfoURL = freezed,Object? authOpenIDButtonText = freezed,Object? authOpenIDAutoLaunch = null,Object? authOpenIDAutoRegister = null,Object? authOpenIDMatchExistingBy = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scannerFindCovers: null == scannerFindCovers ? _self.scannerFindCovers : scannerFindCovers // ignore: cast_nullable_to_non_nullable
as bool,scannerCoverProvider: null == scannerCoverProvider ? _self.scannerCoverProvider : scannerCoverProvider // ignore: cast_nullable_to_non_nullable
as String,scannerParseSubtitle: null == scannerParseSubtitle ? _self.scannerParseSubtitle : scannerParseSubtitle // ignore: cast_nullable_to_non_nullable
as bool,scannerPreferMatchedMetadata: null == scannerPreferMatchedMetadata ? _self.scannerPreferMatchedMetadata : scannerPreferMatchedMetadata // ignore: cast_nullable_to_non_nullable
as bool,scannerDisableWatcher: null == scannerDisableWatcher ? _self.scannerDisableWatcher : scannerDisableWatcher // ignore: cast_nullable_to_non_nullable
as bool,storeCoverWithItem: null == storeCoverWithItem ? _self.storeCoverWithItem : storeCoverWithItem // ignore: cast_nullable_to_non_nullable
as bool,storeMetadataWithItem: null == storeMetadataWithItem ? _self.storeMetadataWithItem : storeMetadataWithItem // ignore: cast_nullable_to_non_nullable
as bool,metadataFileFormat: null == metadataFileFormat ? _self.metadataFileFormat : metadataFileFormat // ignore: cast_nullable_to_non_nullable
as String,rateLimitLoginRequests: null == rateLimitLoginRequests ? _self.rateLimitLoginRequests : rateLimitLoginRequests // ignore: cast_nullable_to_non_nullable
as int,rateLimitLoginWindow: null == rateLimitLoginWindow ? _self.rateLimitLoginWindow : rateLimitLoginWindow // ignore: cast_nullable_to_non_nullable
as int,backupSchedule: null == backupSchedule ? _self.backupSchedule : backupSchedule // ignore: cast_nullable_to_non_nullable
as bool,backupsToKeep: null == backupsToKeep ? _self.backupsToKeep : backupsToKeep // ignore: cast_nullable_to_non_nullable
as int,maxBackupSize: null == maxBackupSize ? _self.maxBackupSize : maxBackupSize // ignore: cast_nullable_to_non_nullable
as int,loggerDailyLogsToKeep: null == loggerDailyLogsToKeep ? _self.loggerDailyLogsToKeep : loggerDailyLogsToKeep // ignore: cast_nullable_to_non_nullable
as int,loggerScannerLogsToKeep: null == loggerScannerLogsToKeep ? _self.loggerScannerLogsToKeep : loggerScannerLogsToKeep // ignore: cast_nullable_to_non_nullable
as int,homeBookshelfView: null == homeBookshelfView ? _self.homeBookshelfView : homeBookshelfView // ignore: cast_nullable_to_non_nullable
as int,bookshelfView: null == bookshelfView ? _self.bookshelfView : bookshelfView // ignore: cast_nullable_to_non_nullable
as int,podcastEpisodeSchedule: null == podcastEpisodeSchedule ? _self.podcastEpisodeSchedule : podcastEpisodeSchedule // ignore: cast_nullable_to_non_nullable
as String,sortingIgnorePrefix: null == sortingIgnorePrefix ? _self.sortingIgnorePrefix : sortingIgnorePrefix // ignore: cast_nullable_to_non_nullable
as bool,sortingPrefixes: null == sortingPrefixes ? _self.sortingPrefixes : sortingPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>,chromecastEnabled: null == chromecastEnabled ? _self.chromecastEnabled : chromecastEnabled // ignore: cast_nullable_to_non_nullable
as bool,dateFormat: null == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String,timeFormat: null == timeFormat ? _self.timeFormat : timeFormat // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,logLevel: null == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,authLoginCustomMessage: freezed == authLoginCustomMessage ? _self.authLoginCustomMessage : authLoginCustomMessage // ignore: cast_nullable_to_non_nullable
as String?,authActiveAuthMethods: null == authActiveAuthMethods ? _self.authActiveAuthMethods : authActiveAuthMethods // ignore: cast_nullable_to_non_nullable
as List<String>,authOpenIDIssuerURL: freezed == authOpenIDIssuerURL ? _self.authOpenIDIssuerURL : authOpenIDIssuerURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAuthorizationURL: freezed == authOpenIDAuthorizationURL ? _self.authOpenIDAuthorizationURL : authOpenIDAuthorizationURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDTokenURL: freezed == authOpenIDTokenURL ? _self.authOpenIDTokenURL : authOpenIDTokenURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDJwksURL: freezed == authOpenIDJwksURL ? _self.authOpenIDJwksURL : authOpenIDJwksURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDLogoutURL: freezed == authOpenIDLogoutURL ? _self.authOpenIDLogoutURL : authOpenIDLogoutURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDUserInfoURL: freezed == authOpenIDUserInfoURL ? _self.authOpenIDUserInfoURL : authOpenIDUserInfoURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDButtonText: freezed == authOpenIDButtonText ? _self.authOpenIDButtonText : authOpenIDButtonText // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAutoLaunch: null == authOpenIDAutoLaunch ? _self.authOpenIDAutoLaunch : authOpenIDAutoLaunch // ignore: cast_nullable_to_non_nullable
as bool,authOpenIDAutoRegister: null == authOpenIDAutoRegister ? _self.authOpenIDAutoRegister : authOpenIDAutoRegister // ignore: cast_nullable_to_non_nullable
as bool,authOpenIDMatchExistingBy: freezed == authOpenIDMatchExistingBy ? _self.authOpenIDMatchExistingBy : authOpenIDMatchExistingBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [ServerSettings].
extension ServerSettingsPatterns on ServerSettings {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _ServerSettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _ServerSettings value)  $default,){
final _that = this;
switch (_that) {
case _ServerSettings():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _ServerSettings value)?  $default,){
final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  bool scannerFindCovers,  String scannerCoverProvider,  bool scannerParseSubtitle,  bool scannerPreferMatchedMetadata,  bool scannerDisableWatcher,  bool storeCoverWithItem,  bool storeMetadataWithItem,  String metadataFileFormat,  int rateLimitLoginRequests,  int rateLimitLoginWindow,  bool backupSchedule,  int backupsToKeep,  int maxBackupSize,  int loggerDailyLogsToKeep,  int loggerScannerLogsToKeep,  int homeBookshelfView,  int bookshelfView,  String podcastEpisodeSchedule,  bool sortingIgnorePrefix,  List<String> sortingPrefixes,  bool chromecastEnabled,  String dateFormat,  String timeFormat,  String language,  int logLevel,  String version,  int buildNumber,  String? authLoginCustomMessage,  List<String> authActiveAuthMethods,  String? authOpenIDIssuerURL,  String? authOpenIDAuthorizationURL,  String? authOpenIDTokenURL,  String? authOpenIDJwksURL,  String? authOpenIDLogoutURL,  String? authOpenIDUserInfoURL,  String? authOpenIDButtonText,  bool authOpenIDAutoLaunch,  bool authOpenIDAutoRegister,  String? authOpenIDMatchExistingBy)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that.id,_that.scannerFindCovers,_that.scannerCoverProvider,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupSchedule,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.podcastEpisodeSchedule,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.timeFormat,_that.language,_that.logLevel,_that.version,_that.buildNumber,_that.authLoginCustomMessage,_that.authActiveAuthMethods,_that.authOpenIDIssuerURL,_that.authOpenIDAuthorizationURL,_that.authOpenIDTokenURL,_that.authOpenIDJwksURL,_that.authOpenIDLogoutURL,_that.authOpenIDUserInfoURL,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch,_that.authOpenIDAutoRegister,_that.authOpenIDMatchExistingBy);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  bool scannerFindCovers,  String scannerCoverProvider,  bool scannerParseSubtitle,  bool scannerPreferMatchedMetadata,  bool scannerDisableWatcher,  bool storeCoverWithItem,  bool storeMetadataWithItem,  String metadataFileFormat,  int rateLimitLoginRequests,  int rateLimitLoginWindow,  bool backupSchedule,  int backupsToKeep,  int maxBackupSize,  int loggerDailyLogsToKeep,  int loggerScannerLogsToKeep,  int homeBookshelfView,  int bookshelfView,  String podcastEpisodeSchedule,  bool sortingIgnorePrefix,  List<String> sortingPrefixes,  bool chromecastEnabled,  String dateFormat,  String timeFormat,  String language,  int logLevel,  String version,  int buildNumber,  String? authLoginCustomMessage,  List<String> authActiveAuthMethods,  String? authOpenIDIssuerURL,  String? authOpenIDAuthorizationURL,  String? authOpenIDTokenURL,  String? authOpenIDJwksURL,  String? authOpenIDLogoutURL,  String? authOpenIDUserInfoURL,  String? authOpenIDButtonText,  bool authOpenIDAutoLaunch,  bool authOpenIDAutoRegister,  String? authOpenIDMatchExistingBy)  $default,) {final _that = this;
switch (_that) {
case _ServerSettings():
return $default(_that.id,_that.scannerFindCovers,_that.scannerCoverProvider,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupSchedule,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.podcastEpisodeSchedule,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.timeFormat,_that.language,_that.logLevel,_that.version,_that.buildNumber,_that.authLoginCustomMessage,_that.authActiveAuthMethods,_that.authOpenIDIssuerURL,_that.authOpenIDAuthorizationURL,_that.authOpenIDTokenURL,_that.authOpenIDJwksURL,_that.authOpenIDLogoutURL,_that.authOpenIDUserInfoURL,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch,_that.authOpenIDAutoRegister,_that.authOpenIDMatchExistingBy);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  bool scannerFindCovers,  String scannerCoverProvider,  bool scannerParseSubtitle,  bool scannerPreferMatchedMetadata,  bool scannerDisableWatcher,  bool storeCoverWithItem,  bool storeMetadataWithItem,  String metadataFileFormat,  int rateLimitLoginRequests,  int rateLimitLoginWindow,  bool backupSchedule,  int backupsToKeep,  int maxBackupSize,  int loggerDailyLogsToKeep,  int loggerScannerLogsToKeep,  int homeBookshelfView,  int bookshelfView,  String podcastEpisodeSchedule,  bool sortingIgnorePrefix,  List<String> sortingPrefixes,  bool chromecastEnabled,  String dateFormat,  String timeFormat,  String language,  int logLevel,  String version,  int buildNumber,  String? authLoginCustomMessage,  List<String> authActiveAuthMethods,  String? authOpenIDIssuerURL,  String? authOpenIDAuthorizationURL,  String? authOpenIDTokenURL,  String? authOpenIDJwksURL,  String? authOpenIDLogoutURL,  String? authOpenIDUserInfoURL,  String? authOpenIDButtonText,  bool authOpenIDAutoLaunch,  bool authOpenIDAutoRegister,  String? authOpenIDMatchExistingBy)?  $default,) {final _that = this;
switch (_that) {
case _ServerSettings() when $default != null:
return $default(_that.id,_that.scannerFindCovers,_that.scannerCoverProvider,_that.scannerParseSubtitle,_that.scannerPreferMatchedMetadata,_that.scannerDisableWatcher,_that.storeCoverWithItem,_that.storeMetadataWithItem,_that.metadataFileFormat,_that.rateLimitLoginRequests,_that.rateLimitLoginWindow,_that.backupSchedule,_that.backupsToKeep,_that.maxBackupSize,_that.loggerDailyLogsToKeep,_that.loggerScannerLogsToKeep,_that.homeBookshelfView,_that.bookshelfView,_that.podcastEpisodeSchedule,_that.sortingIgnorePrefix,_that.sortingPrefixes,_that.chromecastEnabled,_that.dateFormat,_that.timeFormat,_that.language,_that.logLevel,_that.version,_that.buildNumber,_that.authLoginCustomMessage,_that.authActiveAuthMethods,_that.authOpenIDIssuerURL,_that.authOpenIDAuthorizationURL,_that.authOpenIDTokenURL,_that.authOpenIDJwksURL,_that.authOpenIDLogoutURL,_that.authOpenIDUserInfoURL,_that.authOpenIDButtonText,_that.authOpenIDAutoLaunch,_that.authOpenIDAutoRegister,_that.authOpenIDMatchExistingBy);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _ServerSettings implements ServerSettings {
  const _ServerSettings({required this.id, required this.scannerFindCovers, required this.scannerCoverProvider, required this.scannerParseSubtitle, required this.scannerPreferMatchedMetadata, required this.scannerDisableWatcher, required this.storeCoverWithItem, required this.storeMetadataWithItem, required this.metadataFileFormat, required this.rateLimitLoginRequests, required this.rateLimitLoginWindow, required this.backupSchedule, required this.backupsToKeep, required this.maxBackupSize, required this.loggerDailyLogsToKeep, required this.loggerScannerLogsToKeep, required this.homeBookshelfView, required this.bookshelfView, required this.podcastEpisodeSchedule, required this.sortingIgnorePrefix, required final  List<String> sortingPrefixes, required this.chromecastEnabled, required this.dateFormat, required this.timeFormat, required this.language, required this.logLevel, required this.version, required this.buildNumber, this.authLoginCustomMessage, required final  List<String> authActiveAuthMethods, this.authOpenIDIssuerURL, this.authOpenIDAuthorizationURL, this.authOpenIDTokenURL, this.authOpenIDJwksURL, this.authOpenIDLogoutURL, this.authOpenIDUserInfoURL, this.authOpenIDButtonText, required this.authOpenIDAutoLaunch, required this.authOpenIDAutoRegister, this.authOpenIDMatchExistingBy}): _sortingPrefixes = sortingPrefixes,_authActiveAuthMethods = authActiveAuthMethods;
  factory _ServerSettings.fromJson(Map<String, dynamic> json) => _$ServerSettingsFromJson(json);

@override final  String id;
@override final  bool scannerFindCovers;
@override final  String scannerCoverProvider;
@override final  bool scannerParseSubtitle;
@override final  bool scannerPreferMatchedMetadata;
@override final  bool scannerDisableWatcher;
@override final  bool storeCoverWithItem;
@override final  bool storeMetadataWithItem;
@override final  String metadataFileFormat;
@override final  int rateLimitLoginRequests;
@override final  int rateLimitLoginWindow;
@override final  bool backupSchedule;
@override final  int backupsToKeep;
@override final  int maxBackupSize;
@override final  int loggerDailyLogsToKeep;
@override final  int loggerScannerLogsToKeep;
@override final  int homeBookshelfView;
@override final  int bookshelfView;
@override final  String podcastEpisodeSchedule;
@override final  bool sortingIgnorePrefix;
 final  List<String> _sortingPrefixes;
@override List<String> get sortingPrefixes {
  if (_sortingPrefixes is EqualUnmodifiableListView) return _sortingPrefixes;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_sortingPrefixes);
}

@override final  bool chromecastEnabled;
@override final  String dateFormat;
@override final  String timeFormat;
@override final  String language;
@override final  int logLevel;
@override final  String version;
@override final  int buildNumber;
@override final  String? authLoginCustomMessage;
 final  List<String> _authActiveAuthMethods;
@override List<String> get authActiveAuthMethods {
  if (_authActiveAuthMethods is EqualUnmodifiableListView) return _authActiveAuthMethods;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_authActiveAuthMethods);
}

@override final  String? authOpenIDIssuerURL;
@override final  String? authOpenIDAuthorizationURL;
@override final  String? authOpenIDTokenURL;
@override final  String? authOpenIDJwksURL;
@override final  String? authOpenIDLogoutURL;
@override final  String? authOpenIDUserInfoURL;
@override final  String? authOpenIDButtonText;
@override final  bool authOpenIDAutoLaunch;
@override final  bool authOpenIDAutoRegister;
@override final  String? authOpenIDMatchExistingBy;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$ServerSettingsCopyWith<_ServerSettings> get copyWith => __$ServerSettingsCopyWithImpl<_ServerSettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$ServerSettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _ServerSettings&&(identical(other.id, id) || other.id == id)&&(identical(other.scannerFindCovers, scannerFindCovers) || other.scannerFindCovers == scannerFindCovers)&&(identical(other.scannerCoverProvider, scannerCoverProvider) || other.scannerCoverProvider == scannerCoverProvider)&&(identical(other.scannerParseSubtitle, scannerParseSubtitle) || other.scannerParseSubtitle == scannerParseSubtitle)&&(identical(other.scannerPreferMatchedMetadata, scannerPreferMatchedMetadata) || other.scannerPreferMatchedMetadata == scannerPreferMatchedMetadata)&&(identical(other.scannerDisableWatcher, scannerDisableWatcher) || other.scannerDisableWatcher == scannerDisableWatcher)&&(identical(other.storeCoverWithItem, storeCoverWithItem) || other.storeCoverWithItem == storeCoverWithItem)&&(identical(other.storeMetadataWithItem, storeMetadataWithItem) || other.storeMetadataWithItem == storeMetadataWithItem)&&(identical(other.metadataFileFormat, metadataFileFormat) || other.metadataFileFormat == metadataFileFormat)&&(identical(other.rateLimitLoginRequests, rateLimitLoginRequests) || other.rateLimitLoginRequests == rateLimitLoginRequests)&&(identical(other.rateLimitLoginWindow, rateLimitLoginWindow) || other.rateLimitLoginWindow == rateLimitLoginWindow)&&(identical(other.backupSchedule, backupSchedule) || other.backupSchedule == backupSchedule)&&(identical(other.backupsToKeep, backupsToKeep) || other.backupsToKeep == backupsToKeep)&&(identical(other.maxBackupSize, maxBackupSize) || other.maxBackupSize == maxBackupSize)&&(identical(other.loggerDailyLogsToKeep, loggerDailyLogsToKeep) || other.loggerDailyLogsToKeep == loggerDailyLogsToKeep)&&(identical(other.loggerScannerLogsToKeep, loggerScannerLogsToKeep) || other.loggerScannerLogsToKeep == loggerScannerLogsToKeep)&&(identical(other.homeBookshelfView, homeBookshelfView) || other.homeBookshelfView == homeBookshelfView)&&(identical(other.bookshelfView, bookshelfView) || other.bookshelfView == bookshelfView)&&(identical(other.podcastEpisodeSchedule, podcastEpisodeSchedule) || other.podcastEpisodeSchedule == podcastEpisodeSchedule)&&(identical(other.sortingIgnorePrefix, sortingIgnorePrefix) || other.sortingIgnorePrefix == sortingIgnorePrefix)&&const DeepCollectionEquality().equals(other._sortingPrefixes, _sortingPrefixes)&&(identical(other.chromecastEnabled, chromecastEnabled) || other.chromecastEnabled == chromecastEnabled)&&(identical(other.dateFormat, dateFormat) || other.dateFormat == dateFormat)&&(identical(other.timeFormat, timeFormat) || other.timeFormat == timeFormat)&&(identical(other.language, language) || other.language == language)&&(identical(other.logLevel, logLevel) || other.logLevel == logLevel)&&(identical(other.version, version) || other.version == version)&&(identical(other.buildNumber, buildNumber) || other.buildNumber == buildNumber)&&(identical(other.authLoginCustomMessage, authLoginCustomMessage) || other.authLoginCustomMessage == authLoginCustomMessage)&&const DeepCollectionEquality().equals(other._authActiveAuthMethods, _authActiveAuthMethods)&&(identical(other.authOpenIDIssuerURL, authOpenIDIssuerURL) || other.authOpenIDIssuerURL == authOpenIDIssuerURL)&&(identical(other.authOpenIDAuthorizationURL, authOpenIDAuthorizationURL) || other.authOpenIDAuthorizationURL == authOpenIDAuthorizationURL)&&(identical(other.authOpenIDTokenURL, authOpenIDTokenURL) || other.authOpenIDTokenURL == authOpenIDTokenURL)&&(identical(other.authOpenIDJwksURL, authOpenIDJwksURL) || other.authOpenIDJwksURL == authOpenIDJwksURL)&&(identical(other.authOpenIDLogoutURL, authOpenIDLogoutURL) || other.authOpenIDLogoutURL == authOpenIDLogoutURL)&&(identical(other.authOpenIDUserInfoURL, authOpenIDUserInfoURL) || other.authOpenIDUserInfoURL == authOpenIDUserInfoURL)&&(identical(other.authOpenIDButtonText, authOpenIDButtonText) || other.authOpenIDButtonText == authOpenIDButtonText)&&(identical(other.authOpenIDAutoLaunch, authOpenIDAutoLaunch) || other.authOpenIDAutoLaunch == authOpenIDAutoLaunch)&&(identical(other.authOpenIDAutoRegister, authOpenIDAutoRegister) || other.authOpenIDAutoRegister == authOpenIDAutoRegister)&&(identical(other.authOpenIDMatchExistingBy, authOpenIDMatchExistingBy) || other.authOpenIDMatchExistingBy == authOpenIDMatchExistingBy));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,scannerFindCovers,scannerCoverProvider,scannerParseSubtitle,scannerPreferMatchedMetadata,scannerDisableWatcher,storeCoverWithItem,storeMetadataWithItem,metadataFileFormat,rateLimitLoginRequests,rateLimitLoginWindow,backupSchedule,backupsToKeep,maxBackupSize,loggerDailyLogsToKeep,loggerScannerLogsToKeep,homeBookshelfView,bookshelfView,podcastEpisodeSchedule,sortingIgnorePrefix,const DeepCollectionEquality().hash(_sortingPrefixes),chromecastEnabled,dateFormat,timeFormat,language,logLevel,version,buildNumber,authLoginCustomMessage,const DeepCollectionEquality().hash(_authActiveAuthMethods),authOpenIDIssuerURL,authOpenIDAuthorizationURL,authOpenIDTokenURL,authOpenIDJwksURL,authOpenIDLogoutURL,authOpenIDUserInfoURL,authOpenIDButtonText,authOpenIDAutoLaunch,authOpenIDAutoRegister,authOpenIDMatchExistingBy]);

@override
String toString() {
  return 'ServerSettings(id: $id, scannerFindCovers: $scannerFindCovers, scannerCoverProvider: $scannerCoverProvider, scannerParseSubtitle: $scannerParseSubtitle, scannerPreferMatchedMetadata: $scannerPreferMatchedMetadata, scannerDisableWatcher: $scannerDisableWatcher, storeCoverWithItem: $storeCoverWithItem, storeMetadataWithItem: $storeMetadataWithItem, metadataFileFormat: $metadataFileFormat, rateLimitLoginRequests: $rateLimitLoginRequests, rateLimitLoginWindow: $rateLimitLoginWindow, backupSchedule: $backupSchedule, backupsToKeep: $backupsToKeep, maxBackupSize: $maxBackupSize, loggerDailyLogsToKeep: $loggerDailyLogsToKeep, loggerScannerLogsToKeep: $loggerScannerLogsToKeep, homeBookshelfView: $homeBookshelfView, bookshelfView: $bookshelfView, podcastEpisodeSchedule: $podcastEpisodeSchedule, sortingIgnorePrefix: $sortingIgnorePrefix, sortingPrefixes: $sortingPrefixes, chromecastEnabled: $chromecastEnabled, dateFormat: $dateFormat, timeFormat: $timeFormat, language: $language, logLevel: $logLevel, version: $version, buildNumber: $buildNumber, authLoginCustomMessage: $authLoginCustomMessage, authActiveAuthMethods: $authActiveAuthMethods, authOpenIDIssuerURL: $authOpenIDIssuerURL, authOpenIDAuthorizationURL: $authOpenIDAuthorizationURL, authOpenIDTokenURL: $authOpenIDTokenURL, authOpenIDJwksURL: $authOpenIDJwksURL, authOpenIDLogoutURL: $authOpenIDLogoutURL, authOpenIDUserInfoURL: $authOpenIDUserInfoURL, authOpenIDButtonText: $authOpenIDButtonText, authOpenIDAutoLaunch: $authOpenIDAutoLaunch, authOpenIDAutoRegister: $authOpenIDAutoRegister, authOpenIDMatchExistingBy: $authOpenIDMatchExistingBy)';
}


}

/// @nodoc
abstract mixin class _$ServerSettingsCopyWith<$Res> implements $ServerSettingsCopyWith<$Res> {
  factory _$ServerSettingsCopyWith(_ServerSettings value, $Res Function(_ServerSettings) _then) = __$ServerSettingsCopyWithImpl;
@override @useResult
$Res call({
 String id, bool scannerFindCovers, String scannerCoverProvider, bool scannerParseSubtitle, bool scannerPreferMatchedMetadata, bool scannerDisableWatcher, bool storeCoverWithItem, bool storeMetadataWithItem, String metadataFileFormat, int rateLimitLoginRequests, int rateLimitLoginWindow, bool backupSchedule, int backupsToKeep, int maxBackupSize, int loggerDailyLogsToKeep, int loggerScannerLogsToKeep, int homeBookshelfView, int bookshelfView, String podcastEpisodeSchedule, bool sortingIgnorePrefix, List<String> sortingPrefixes, bool chromecastEnabled, String dateFormat, String timeFormat, String language, int logLevel, String version, int buildNumber, String? authLoginCustomMessage, List<String> authActiveAuthMethods, String? authOpenIDIssuerURL, String? authOpenIDAuthorizationURL, String? authOpenIDTokenURL, String? authOpenIDJwksURL, String? authOpenIDLogoutURL, String? authOpenIDUserInfoURL, String? authOpenIDButtonText, bool authOpenIDAutoLaunch, bool authOpenIDAutoRegister, String? authOpenIDMatchExistingBy
});




}
/// @nodoc
class __$ServerSettingsCopyWithImpl<$Res>
    implements _$ServerSettingsCopyWith<$Res> {
  __$ServerSettingsCopyWithImpl(this._self, this._then);

  final _ServerSettings _self;
  final $Res Function(_ServerSettings) _then;

/// Create a copy of ServerSettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? scannerFindCovers = null,Object? scannerCoverProvider = null,Object? scannerParseSubtitle = null,Object? scannerPreferMatchedMetadata = null,Object? scannerDisableWatcher = null,Object? storeCoverWithItem = null,Object? storeMetadataWithItem = null,Object? metadataFileFormat = null,Object? rateLimitLoginRequests = null,Object? rateLimitLoginWindow = null,Object? backupSchedule = null,Object? backupsToKeep = null,Object? maxBackupSize = null,Object? loggerDailyLogsToKeep = null,Object? loggerScannerLogsToKeep = null,Object? homeBookshelfView = null,Object? bookshelfView = null,Object? podcastEpisodeSchedule = null,Object? sortingIgnorePrefix = null,Object? sortingPrefixes = null,Object? chromecastEnabled = null,Object? dateFormat = null,Object? timeFormat = null,Object? language = null,Object? logLevel = null,Object? version = null,Object? buildNumber = null,Object? authLoginCustomMessage = freezed,Object? authActiveAuthMethods = null,Object? authOpenIDIssuerURL = freezed,Object? authOpenIDAuthorizationURL = freezed,Object? authOpenIDTokenURL = freezed,Object? authOpenIDJwksURL = freezed,Object? authOpenIDLogoutURL = freezed,Object? authOpenIDUserInfoURL = freezed,Object? authOpenIDButtonText = freezed,Object? authOpenIDAutoLaunch = null,Object? authOpenIDAutoRegister = null,Object? authOpenIDMatchExistingBy = freezed,}) {
  return _then(_ServerSettings(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,scannerFindCovers: null == scannerFindCovers ? _self.scannerFindCovers : scannerFindCovers // ignore: cast_nullable_to_non_nullable
as bool,scannerCoverProvider: null == scannerCoverProvider ? _self.scannerCoverProvider : scannerCoverProvider // ignore: cast_nullable_to_non_nullable
as String,scannerParseSubtitle: null == scannerParseSubtitle ? _self.scannerParseSubtitle : scannerParseSubtitle // ignore: cast_nullable_to_non_nullable
as bool,scannerPreferMatchedMetadata: null == scannerPreferMatchedMetadata ? _self.scannerPreferMatchedMetadata : scannerPreferMatchedMetadata // ignore: cast_nullable_to_non_nullable
as bool,scannerDisableWatcher: null == scannerDisableWatcher ? _self.scannerDisableWatcher : scannerDisableWatcher // ignore: cast_nullable_to_non_nullable
as bool,storeCoverWithItem: null == storeCoverWithItem ? _self.storeCoverWithItem : storeCoverWithItem // ignore: cast_nullable_to_non_nullable
as bool,storeMetadataWithItem: null == storeMetadataWithItem ? _self.storeMetadataWithItem : storeMetadataWithItem // ignore: cast_nullable_to_non_nullable
as bool,metadataFileFormat: null == metadataFileFormat ? _self.metadataFileFormat : metadataFileFormat // ignore: cast_nullable_to_non_nullable
as String,rateLimitLoginRequests: null == rateLimitLoginRequests ? _self.rateLimitLoginRequests : rateLimitLoginRequests // ignore: cast_nullable_to_non_nullable
as int,rateLimitLoginWindow: null == rateLimitLoginWindow ? _self.rateLimitLoginWindow : rateLimitLoginWindow // ignore: cast_nullable_to_non_nullable
as int,backupSchedule: null == backupSchedule ? _self.backupSchedule : backupSchedule // ignore: cast_nullable_to_non_nullable
as bool,backupsToKeep: null == backupsToKeep ? _self.backupsToKeep : backupsToKeep // ignore: cast_nullable_to_non_nullable
as int,maxBackupSize: null == maxBackupSize ? _self.maxBackupSize : maxBackupSize // ignore: cast_nullable_to_non_nullable
as int,loggerDailyLogsToKeep: null == loggerDailyLogsToKeep ? _self.loggerDailyLogsToKeep : loggerDailyLogsToKeep // ignore: cast_nullable_to_non_nullable
as int,loggerScannerLogsToKeep: null == loggerScannerLogsToKeep ? _self.loggerScannerLogsToKeep : loggerScannerLogsToKeep // ignore: cast_nullable_to_non_nullable
as int,homeBookshelfView: null == homeBookshelfView ? _self.homeBookshelfView : homeBookshelfView // ignore: cast_nullable_to_non_nullable
as int,bookshelfView: null == bookshelfView ? _self.bookshelfView : bookshelfView // ignore: cast_nullable_to_non_nullable
as int,podcastEpisodeSchedule: null == podcastEpisodeSchedule ? _self.podcastEpisodeSchedule : podcastEpisodeSchedule // ignore: cast_nullable_to_non_nullable
as String,sortingIgnorePrefix: null == sortingIgnorePrefix ? _self.sortingIgnorePrefix : sortingIgnorePrefix // ignore: cast_nullable_to_non_nullable
as bool,sortingPrefixes: null == sortingPrefixes ? _self._sortingPrefixes : sortingPrefixes // ignore: cast_nullable_to_non_nullable
as List<String>,chromecastEnabled: null == chromecastEnabled ? _self.chromecastEnabled : chromecastEnabled // ignore: cast_nullable_to_non_nullable
as bool,dateFormat: null == dateFormat ? _self.dateFormat : dateFormat // ignore: cast_nullable_to_non_nullable
as String,timeFormat: null == timeFormat ? _self.timeFormat : timeFormat // ignore: cast_nullable_to_non_nullable
as String,language: null == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String,logLevel: null == logLevel ? _self.logLevel : logLevel // ignore: cast_nullable_to_non_nullable
as int,version: null == version ? _self.version : version // ignore: cast_nullable_to_non_nullable
as String,buildNumber: null == buildNumber ? _self.buildNumber : buildNumber // ignore: cast_nullable_to_non_nullable
as int,authLoginCustomMessage: freezed == authLoginCustomMessage ? _self.authLoginCustomMessage : authLoginCustomMessage // ignore: cast_nullable_to_non_nullable
as String?,authActiveAuthMethods: null == authActiveAuthMethods ? _self._authActiveAuthMethods : authActiveAuthMethods // ignore: cast_nullable_to_non_nullable
as List<String>,authOpenIDIssuerURL: freezed == authOpenIDIssuerURL ? _self.authOpenIDIssuerURL : authOpenIDIssuerURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAuthorizationURL: freezed == authOpenIDAuthorizationURL ? _self.authOpenIDAuthorizationURL : authOpenIDAuthorizationURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDTokenURL: freezed == authOpenIDTokenURL ? _self.authOpenIDTokenURL : authOpenIDTokenURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDJwksURL: freezed == authOpenIDJwksURL ? _self.authOpenIDJwksURL : authOpenIDJwksURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDLogoutURL: freezed == authOpenIDLogoutURL ? _self.authOpenIDLogoutURL : authOpenIDLogoutURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDUserInfoURL: freezed == authOpenIDUserInfoURL ? _self.authOpenIDUserInfoURL : authOpenIDUserInfoURL // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDButtonText: freezed == authOpenIDButtonText ? _self.authOpenIDButtonText : authOpenIDButtonText // ignore: cast_nullable_to_non_nullable
as String?,authOpenIDAutoLaunch: null == authOpenIDAutoLaunch ? _self.authOpenIDAutoLaunch : authOpenIDAutoLaunch // ignore: cast_nullable_to_non_nullable
as bool,authOpenIDAutoRegister: null == authOpenIDAutoRegister ? _self.authOpenIDAutoRegister : authOpenIDAutoRegister // ignore: cast_nullable_to_non_nullable
as bool,authOpenIDMatchExistingBy: freezed == authOpenIDMatchExistingBy ? _self.authOpenIDMatchExistingBy : authOpenIDMatchExistingBy // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
