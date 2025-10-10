// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_settings.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibrarySettings {

 int get coverAspectRatio; bool get disableWatcher; bool get skipMatchingMediaWithAsin; bool get skipMatchingMediaWithIsbn; String? get autoScanCronExpression; bool get audiobooksOnly; bool get hideSingleBookSeries; List<String> get metadataPrecedence; int? get lastScan; String? get lastScanVersion; int? get createdAt; int? get lastUpdate;
/// Create a copy of LibrarySettings
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibrarySettingsCopyWith<LibrarySettings> get copyWith => _$LibrarySettingsCopyWithImpl<LibrarySettings>(this as LibrarySettings, _$identity);

  /// Serializes this LibrarySettings to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibrarySettings&&(identical(other.coverAspectRatio, coverAspectRatio) || other.coverAspectRatio == coverAspectRatio)&&(identical(other.disableWatcher, disableWatcher) || other.disableWatcher == disableWatcher)&&(identical(other.skipMatchingMediaWithAsin, skipMatchingMediaWithAsin) || other.skipMatchingMediaWithAsin == skipMatchingMediaWithAsin)&&(identical(other.skipMatchingMediaWithIsbn, skipMatchingMediaWithIsbn) || other.skipMatchingMediaWithIsbn == skipMatchingMediaWithIsbn)&&(identical(other.autoScanCronExpression, autoScanCronExpression) || other.autoScanCronExpression == autoScanCronExpression)&&(identical(other.audiobooksOnly, audiobooksOnly) || other.audiobooksOnly == audiobooksOnly)&&(identical(other.hideSingleBookSeries, hideSingleBookSeries) || other.hideSingleBookSeries == hideSingleBookSeries)&&const DeepCollectionEquality().equals(other.metadataPrecedence, metadataPrecedence)&&(identical(other.lastScan, lastScan) || other.lastScan == lastScan)&&(identical(other.lastScanVersion, lastScanVersion) || other.lastScanVersion == lastScanVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverAspectRatio,disableWatcher,skipMatchingMediaWithAsin,skipMatchingMediaWithIsbn,autoScanCronExpression,audiobooksOnly,hideSingleBookSeries,const DeepCollectionEquality().hash(metadataPrecedence),lastScan,lastScanVersion,createdAt,lastUpdate);

@override
String toString() {
  return 'LibrarySettings(coverAspectRatio: $coverAspectRatio, disableWatcher: $disableWatcher, skipMatchingMediaWithAsin: $skipMatchingMediaWithAsin, skipMatchingMediaWithIsbn: $skipMatchingMediaWithIsbn, autoScanCronExpression: $autoScanCronExpression, audiobooksOnly: $audiobooksOnly, hideSingleBookSeries: $hideSingleBookSeries, metadataPrecedence: $metadataPrecedence, lastScan: $lastScan, lastScanVersion: $lastScanVersion, createdAt: $createdAt, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class $LibrarySettingsCopyWith<$Res>  {
  factory $LibrarySettingsCopyWith(LibrarySettings value, $Res Function(LibrarySettings) _then) = _$LibrarySettingsCopyWithImpl;
@useResult
$Res call({
 int coverAspectRatio, bool disableWatcher, bool skipMatchingMediaWithAsin, bool skipMatchingMediaWithIsbn, String? autoScanCronExpression, bool audiobooksOnly, bool hideSingleBookSeries, List<String> metadataPrecedence, int? lastScan, String? lastScanVersion, int? createdAt, int? lastUpdate
});




}
/// @nodoc
class _$LibrarySettingsCopyWithImpl<$Res>
    implements $LibrarySettingsCopyWith<$Res> {
  _$LibrarySettingsCopyWithImpl(this._self, this._then);

  final LibrarySettings _self;
  final $Res Function(LibrarySettings) _then;

/// Create a copy of LibrarySettings
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? coverAspectRatio = null,Object? disableWatcher = null,Object? skipMatchingMediaWithAsin = null,Object? skipMatchingMediaWithIsbn = null,Object? autoScanCronExpression = freezed,Object? audiobooksOnly = null,Object? hideSingleBookSeries = null,Object? metadataPrecedence = null,Object? lastScan = freezed,Object? lastScanVersion = freezed,Object? createdAt = freezed,Object? lastUpdate = freezed,}) {
  return _then(_self.copyWith(
coverAspectRatio: null == coverAspectRatio ? _self.coverAspectRatio : coverAspectRatio // ignore: cast_nullable_to_non_nullable
as int,disableWatcher: null == disableWatcher ? _self.disableWatcher : disableWatcher // ignore: cast_nullable_to_non_nullable
as bool,skipMatchingMediaWithAsin: null == skipMatchingMediaWithAsin ? _self.skipMatchingMediaWithAsin : skipMatchingMediaWithAsin // ignore: cast_nullable_to_non_nullable
as bool,skipMatchingMediaWithIsbn: null == skipMatchingMediaWithIsbn ? _self.skipMatchingMediaWithIsbn : skipMatchingMediaWithIsbn // ignore: cast_nullable_to_non_nullable
as bool,autoScanCronExpression: freezed == autoScanCronExpression ? _self.autoScanCronExpression : autoScanCronExpression // ignore: cast_nullable_to_non_nullable
as String?,audiobooksOnly: null == audiobooksOnly ? _self.audiobooksOnly : audiobooksOnly // ignore: cast_nullable_to_non_nullable
as bool,hideSingleBookSeries: null == hideSingleBookSeries ? _self.hideSingleBookSeries : hideSingleBookSeries // ignore: cast_nullable_to_non_nullable
as bool,metadataPrecedence: null == metadataPrecedence ? _self.metadataPrecedence : metadataPrecedence // ignore: cast_nullable_to_non_nullable
as List<String>,lastScan: freezed == lastScan ? _self.lastScan : lastScan // ignore: cast_nullable_to_non_nullable
as int?,lastScanVersion: freezed == lastScanVersion ? _self.lastScanVersion : lastScanVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [LibrarySettings].
extension LibrarySettingsPatterns on LibrarySettings {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibrarySettings value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibrarySettings() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibrarySettings value)  $default,){
final _that = this;
switch (_that) {
case _LibrarySettings():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibrarySettings value)?  $default,){
final _that = this;
switch (_that) {
case _LibrarySettings() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int coverAspectRatio,  bool disableWatcher,  bool skipMatchingMediaWithAsin,  bool skipMatchingMediaWithIsbn,  String? autoScanCronExpression,  bool audiobooksOnly,  bool hideSingleBookSeries,  List<String> metadataPrecedence,  int? lastScan,  String? lastScanVersion,  int? createdAt,  int? lastUpdate)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibrarySettings() when $default != null:
return $default(_that.coverAspectRatio,_that.disableWatcher,_that.skipMatchingMediaWithAsin,_that.skipMatchingMediaWithIsbn,_that.autoScanCronExpression,_that.audiobooksOnly,_that.hideSingleBookSeries,_that.metadataPrecedence,_that.lastScan,_that.lastScanVersion,_that.createdAt,_that.lastUpdate);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int coverAspectRatio,  bool disableWatcher,  bool skipMatchingMediaWithAsin,  bool skipMatchingMediaWithIsbn,  String? autoScanCronExpression,  bool audiobooksOnly,  bool hideSingleBookSeries,  List<String> metadataPrecedence,  int? lastScan,  String? lastScanVersion,  int? createdAt,  int? lastUpdate)  $default,) {final _that = this;
switch (_that) {
case _LibrarySettings():
return $default(_that.coverAspectRatio,_that.disableWatcher,_that.skipMatchingMediaWithAsin,_that.skipMatchingMediaWithIsbn,_that.autoScanCronExpression,_that.audiobooksOnly,_that.hideSingleBookSeries,_that.metadataPrecedence,_that.lastScan,_that.lastScanVersion,_that.createdAt,_that.lastUpdate);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int coverAspectRatio,  bool disableWatcher,  bool skipMatchingMediaWithAsin,  bool skipMatchingMediaWithIsbn,  String? autoScanCronExpression,  bool audiobooksOnly,  bool hideSingleBookSeries,  List<String> metadataPrecedence,  int? lastScan,  String? lastScanVersion,  int? createdAt,  int? lastUpdate)?  $default,) {final _that = this;
switch (_that) {
case _LibrarySettings() when $default != null:
return $default(_that.coverAspectRatio,_that.disableWatcher,_that.skipMatchingMediaWithAsin,_that.skipMatchingMediaWithIsbn,_that.autoScanCronExpression,_that.audiobooksOnly,_that.hideSingleBookSeries,_that.metadataPrecedence,_that.lastScan,_that.lastScanVersion,_that.createdAt,_that.lastUpdate);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibrarySettings implements LibrarySettings {
  const _LibrarySettings({required this.coverAspectRatio, required this.disableWatcher, required this.skipMatchingMediaWithAsin, required this.skipMatchingMediaWithIsbn, this.autoScanCronExpression, required this.audiobooksOnly, required this.hideSingleBookSeries, required final  List<String> metadataPrecedence, this.lastScan, this.lastScanVersion, this.createdAt, this.lastUpdate}): _metadataPrecedence = metadataPrecedence;
  factory _LibrarySettings.fromJson(Map<String, dynamic> json) => _$LibrarySettingsFromJson(json);

@override final  int coverAspectRatio;
@override final  bool disableWatcher;
@override final  bool skipMatchingMediaWithAsin;
@override final  bool skipMatchingMediaWithIsbn;
@override final  String? autoScanCronExpression;
@override final  bool audiobooksOnly;
@override final  bool hideSingleBookSeries;
 final  List<String> _metadataPrecedence;
@override List<String> get metadataPrecedence {
  if (_metadataPrecedence is EqualUnmodifiableListView) return _metadataPrecedence;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_metadataPrecedence);
}

@override final  int? lastScan;
@override final  String? lastScanVersion;
@override final  int? createdAt;
@override final  int? lastUpdate;

/// Create a copy of LibrarySettings
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibrarySettingsCopyWith<_LibrarySettings> get copyWith => __$LibrarySettingsCopyWithImpl<_LibrarySettings>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibrarySettingsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibrarySettings&&(identical(other.coverAspectRatio, coverAspectRatio) || other.coverAspectRatio == coverAspectRatio)&&(identical(other.disableWatcher, disableWatcher) || other.disableWatcher == disableWatcher)&&(identical(other.skipMatchingMediaWithAsin, skipMatchingMediaWithAsin) || other.skipMatchingMediaWithAsin == skipMatchingMediaWithAsin)&&(identical(other.skipMatchingMediaWithIsbn, skipMatchingMediaWithIsbn) || other.skipMatchingMediaWithIsbn == skipMatchingMediaWithIsbn)&&(identical(other.autoScanCronExpression, autoScanCronExpression) || other.autoScanCronExpression == autoScanCronExpression)&&(identical(other.audiobooksOnly, audiobooksOnly) || other.audiobooksOnly == audiobooksOnly)&&(identical(other.hideSingleBookSeries, hideSingleBookSeries) || other.hideSingleBookSeries == hideSingleBookSeries)&&const DeepCollectionEquality().equals(other._metadataPrecedence, _metadataPrecedence)&&(identical(other.lastScan, lastScan) || other.lastScan == lastScan)&&(identical(other.lastScanVersion, lastScanVersion) || other.lastScanVersion == lastScanVersion)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,coverAspectRatio,disableWatcher,skipMatchingMediaWithAsin,skipMatchingMediaWithIsbn,autoScanCronExpression,audiobooksOnly,hideSingleBookSeries,const DeepCollectionEquality().hash(_metadataPrecedence),lastScan,lastScanVersion,createdAt,lastUpdate);

@override
String toString() {
  return 'LibrarySettings(coverAspectRatio: $coverAspectRatio, disableWatcher: $disableWatcher, skipMatchingMediaWithAsin: $skipMatchingMediaWithAsin, skipMatchingMediaWithIsbn: $skipMatchingMediaWithIsbn, autoScanCronExpression: $autoScanCronExpression, audiobooksOnly: $audiobooksOnly, hideSingleBookSeries: $hideSingleBookSeries, metadataPrecedence: $metadataPrecedence, lastScan: $lastScan, lastScanVersion: $lastScanVersion, createdAt: $createdAt, lastUpdate: $lastUpdate)';
}


}

/// @nodoc
abstract mixin class _$LibrarySettingsCopyWith<$Res> implements $LibrarySettingsCopyWith<$Res> {
  factory _$LibrarySettingsCopyWith(_LibrarySettings value, $Res Function(_LibrarySettings) _then) = __$LibrarySettingsCopyWithImpl;
@override @useResult
$Res call({
 int coverAspectRatio, bool disableWatcher, bool skipMatchingMediaWithAsin, bool skipMatchingMediaWithIsbn, String? autoScanCronExpression, bool audiobooksOnly, bool hideSingleBookSeries, List<String> metadataPrecedence, int? lastScan, String? lastScanVersion, int? createdAt, int? lastUpdate
});




}
/// @nodoc
class __$LibrarySettingsCopyWithImpl<$Res>
    implements _$LibrarySettingsCopyWith<$Res> {
  __$LibrarySettingsCopyWithImpl(this._self, this._then);

  final _LibrarySettings _self;
  final $Res Function(_LibrarySettings) _then;

/// Create a copy of LibrarySettings
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? coverAspectRatio = null,Object? disableWatcher = null,Object? skipMatchingMediaWithAsin = null,Object? skipMatchingMediaWithIsbn = null,Object? autoScanCronExpression = freezed,Object? audiobooksOnly = null,Object? hideSingleBookSeries = null,Object? metadataPrecedence = null,Object? lastScan = freezed,Object? lastScanVersion = freezed,Object? createdAt = freezed,Object? lastUpdate = freezed,}) {
  return _then(_LibrarySettings(
coverAspectRatio: null == coverAspectRatio ? _self.coverAspectRatio : coverAspectRatio // ignore: cast_nullable_to_non_nullable
as int,disableWatcher: null == disableWatcher ? _self.disableWatcher : disableWatcher // ignore: cast_nullable_to_non_nullable
as bool,skipMatchingMediaWithAsin: null == skipMatchingMediaWithAsin ? _self.skipMatchingMediaWithAsin : skipMatchingMediaWithAsin // ignore: cast_nullable_to_non_nullable
as bool,skipMatchingMediaWithIsbn: null == skipMatchingMediaWithIsbn ? _self.skipMatchingMediaWithIsbn : skipMatchingMediaWithIsbn // ignore: cast_nullable_to_non_nullable
as bool,autoScanCronExpression: freezed == autoScanCronExpression ? _self.autoScanCronExpression : autoScanCronExpression // ignore: cast_nullable_to_non_nullable
as String?,audiobooksOnly: null == audiobooksOnly ? _self.audiobooksOnly : audiobooksOnly // ignore: cast_nullable_to_non_nullable
as bool,hideSingleBookSeries: null == hideSingleBookSeries ? _self.hideSingleBookSeries : hideSingleBookSeries // ignore: cast_nullable_to_non_nullable
as bool,metadataPrecedence: null == metadataPrecedence ? _self._metadataPrecedence : metadataPrecedence // ignore: cast_nullable_to_non_nullable
as List<String>,lastScan: freezed == lastScan ? _self.lastScan : lastScan // ignore: cast_nullable_to_non_nullable
as int?,lastScanVersion: freezed == lastScanVersion ? _self.lastScanVersion : lastScanVersion // ignore: cast_nullable_to_non_nullable
as String?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
