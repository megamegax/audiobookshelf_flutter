// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media_progress.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MediaProgress implements DiagnosticableTreeMixin {

 String? get id; String? get userId; String? get libraryItemId; String? get episodeId; String? get mediaItemId; String? get mediaItemType; double? get duration; double? get progress; double? get currentTime; bool get isFinished; bool get hideFromContinueListening; String? get ebookLocation; double? get ebookProgress; int? get lastUpdate; int? get startedAt; int? get finishedAt;
/// Create a copy of MediaProgress
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaProgressCopyWith<MediaProgress> get copyWith => _$MediaProgressCopyWithImpl<MediaProgress>(this as MediaProgress, _$identity);

  /// Serializes this MediaProgress to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MediaProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('libraryItemId', libraryItemId))..add(DiagnosticsProperty('episodeId', episodeId))..add(DiagnosticsProperty('mediaItemId', mediaItemId))..add(DiagnosticsProperty('mediaItemType', mediaItemType))..add(DiagnosticsProperty('duration', duration))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('currentTime', currentTime))..add(DiagnosticsProperty('isFinished', isFinished))..add(DiagnosticsProperty('hideFromContinueListening', hideFromContinueListening))..add(DiagnosticsProperty('ebookLocation', ebookLocation))..add(DiagnosticsProperty('ebookProgress', ebookProgress))..add(DiagnosticsProperty('lastUpdate', lastUpdate))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('finishedAt', finishedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MediaProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaItemId, mediaItemId) || other.mediaItemId == mediaItemId)&&(identical(other.mediaItemType, mediaItemType) || other.mediaItemType == mediaItemType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening)&&(identical(other.ebookLocation, ebookLocation) || other.ebookLocation == ebookLocation)&&(identical(other.ebookProgress, ebookProgress) || other.ebookProgress == ebookProgress)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,libraryItemId,episodeId,mediaItemId,mediaItemType,duration,progress,currentTime,isFinished,hideFromContinueListening,ebookLocation,ebookProgress,lastUpdate,startedAt,finishedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MediaProgress(id: $id, userId: $userId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaItemId: $mediaItemId, mediaItemType: $mediaItemType, duration: $duration, progress: $progress, currentTime: $currentTime, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening, ebookLocation: $ebookLocation, ebookProgress: $ebookProgress, lastUpdate: $lastUpdate, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class $MediaProgressCopyWith<$Res>  {
  factory $MediaProgressCopyWith(MediaProgress value, $Res Function(MediaProgress) _then) = _$MediaProgressCopyWithImpl;
@useResult
$Res call({
 String? id, String? userId, String? libraryItemId, String? episodeId, String? mediaItemId, String? mediaItemType, double? duration, double? progress, double? currentTime, bool isFinished, bool hideFromContinueListening, String? ebookLocation, double? ebookProgress, int? lastUpdate, int? startedAt, int? finishedAt
});




}
/// @nodoc
class _$MediaProgressCopyWithImpl<$Res>
    implements $MediaProgressCopyWith<$Res> {
  _$MediaProgressCopyWithImpl(this._self, this._then);

  final MediaProgress _self;
  final $Res Function(MediaProgress) _then;

/// Create a copy of MediaProgress
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? userId = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,Object? mediaItemId = freezed,Object? mediaItemType = freezed,Object? duration = freezed,Object? progress = freezed,Object? currentTime = freezed,Object? isFinished = null,Object? hideFromContinueListening = null,Object? ebookLocation = freezed,Object? ebookProgress = freezed,Object? lastUpdate = freezed,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaItemId: freezed == mediaItemId ? _self.mediaItemId : mediaItemId // ignore: cast_nullable_to_non_nullable
as String?,mediaItemType: freezed == mediaItemType ? _self.mediaItemType : mediaItemType // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,currentTime: freezed == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double?,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,ebookLocation: freezed == ebookLocation ? _self.ebookLocation : ebookLocation // ignore: cast_nullable_to_non_nullable
as String?,ebookProgress: freezed == ebookProgress ? _self.ebookProgress : ebookProgress // ignore: cast_nullable_to_non_nullable
as double?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as int?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [MediaProgress].
extension MediaProgressPatterns on MediaProgress {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MediaProgress value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MediaProgress() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MediaProgress value)  $default,){
final _that = this;
switch (_that) {
case _MediaProgress():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MediaProgress value)?  $default,){
final _that = this;
switch (_that) {
case _MediaProgress() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? libraryItemId,  String? episodeId,  String? mediaItemId,  String? mediaItemType,  double? duration,  double? progress,  double? currentTime,  bool isFinished,  bool hideFromContinueListening,  String? ebookLocation,  double? ebookProgress,  int? lastUpdate,  int? startedAt,  int? finishedAt)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MediaProgress() when $default != null:
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaItemId,_that.mediaItemType,_that.duration,_that.progress,_that.currentTime,_that.isFinished,_that.hideFromContinueListening,_that.ebookLocation,_that.ebookProgress,_that.lastUpdate,_that.startedAt,_that.finishedAt);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? userId,  String? libraryItemId,  String? episodeId,  String? mediaItemId,  String? mediaItemType,  double? duration,  double? progress,  double? currentTime,  bool isFinished,  bool hideFromContinueListening,  String? ebookLocation,  double? ebookProgress,  int? lastUpdate,  int? startedAt,  int? finishedAt)  $default,) {final _that = this;
switch (_that) {
case _MediaProgress():
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaItemId,_that.mediaItemType,_that.duration,_that.progress,_that.currentTime,_that.isFinished,_that.hideFromContinueListening,_that.ebookLocation,_that.ebookProgress,_that.lastUpdate,_that.startedAt,_that.finishedAt);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? userId,  String? libraryItemId,  String? episodeId,  String? mediaItemId,  String? mediaItemType,  double? duration,  double? progress,  double? currentTime,  bool isFinished,  bool hideFromContinueListening,  String? ebookLocation,  double? ebookProgress,  int? lastUpdate,  int? startedAt,  int? finishedAt)?  $default,) {final _that = this;
switch (_that) {
case _MediaProgress() when $default != null:
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaItemId,_that.mediaItemType,_that.duration,_that.progress,_that.currentTime,_that.isFinished,_that.hideFromContinueListening,_that.ebookLocation,_that.ebookProgress,_that.lastUpdate,_that.startedAt,_that.finishedAt);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MediaProgress with DiagnosticableTreeMixin implements MediaProgress {
  const _MediaProgress({this.id, this.userId, this.libraryItemId, this.episodeId, this.mediaItemId, this.mediaItemType, this.duration, this.progress, this.currentTime, required this.isFinished, required this.hideFromContinueListening, this.ebookLocation, this.ebookProgress, this.lastUpdate, this.startedAt, this.finishedAt});
  factory _MediaProgress.fromJson(Map<String, dynamic> json) => _$MediaProgressFromJson(json);

@override final  String? id;
@override final  String? userId;
@override final  String? libraryItemId;
@override final  String? episodeId;
@override final  String? mediaItemId;
@override final  String? mediaItemType;
@override final  double? duration;
@override final  double? progress;
@override final  double? currentTime;
@override final  bool isFinished;
@override final  bool hideFromContinueListening;
@override final  String? ebookLocation;
@override final  double? ebookProgress;
@override final  int? lastUpdate;
@override final  int? startedAt;
@override final  int? finishedAt;

/// Create a copy of MediaProgress
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaProgressCopyWith<_MediaProgress> get copyWith => __$MediaProgressCopyWithImpl<_MediaProgress>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaProgressToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'MediaProgress'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('userId', userId))..add(DiagnosticsProperty('libraryItemId', libraryItemId))..add(DiagnosticsProperty('episodeId', episodeId))..add(DiagnosticsProperty('mediaItemId', mediaItemId))..add(DiagnosticsProperty('mediaItemType', mediaItemType))..add(DiagnosticsProperty('duration', duration))..add(DiagnosticsProperty('progress', progress))..add(DiagnosticsProperty('currentTime', currentTime))..add(DiagnosticsProperty('isFinished', isFinished))..add(DiagnosticsProperty('hideFromContinueListening', hideFromContinueListening))..add(DiagnosticsProperty('ebookLocation', ebookLocation))..add(DiagnosticsProperty('ebookProgress', ebookProgress))..add(DiagnosticsProperty('lastUpdate', lastUpdate))..add(DiagnosticsProperty('startedAt', startedAt))..add(DiagnosticsProperty('finishedAt', finishedAt));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MediaProgress&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaItemId, mediaItemId) || other.mediaItemId == mediaItemId)&&(identical(other.mediaItemType, mediaItemType) || other.mediaItemType == mediaItemType)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.hideFromContinueListening, hideFromContinueListening) || other.hideFromContinueListening == hideFromContinueListening)&&(identical(other.ebookLocation, ebookLocation) || other.ebookLocation == ebookLocation)&&(identical(other.ebookProgress, ebookProgress) || other.ebookProgress == ebookProgress)&&(identical(other.lastUpdate, lastUpdate) || other.lastUpdate == lastUpdate)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.finishedAt, finishedAt) || other.finishedAt == finishedAt));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,userId,libraryItemId,episodeId,mediaItemId,mediaItemType,duration,progress,currentTime,isFinished,hideFromContinueListening,ebookLocation,ebookProgress,lastUpdate,startedAt,finishedAt);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'MediaProgress(id: $id, userId: $userId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaItemId: $mediaItemId, mediaItemType: $mediaItemType, duration: $duration, progress: $progress, currentTime: $currentTime, isFinished: $isFinished, hideFromContinueListening: $hideFromContinueListening, ebookLocation: $ebookLocation, ebookProgress: $ebookProgress, lastUpdate: $lastUpdate, startedAt: $startedAt, finishedAt: $finishedAt)';
}


}

/// @nodoc
abstract mixin class _$MediaProgressCopyWith<$Res> implements $MediaProgressCopyWith<$Res> {
  factory _$MediaProgressCopyWith(_MediaProgress value, $Res Function(_MediaProgress) _then) = __$MediaProgressCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? userId, String? libraryItemId, String? episodeId, String? mediaItemId, String? mediaItemType, double? duration, double? progress, double? currentTime, bool isFinished, bool hideFromContinueListening, String? ebookLocation, double? ebookProgress, int? lastUpdate, int? startedAt, int? finishedAt
});




}
/// @nodoc
class __$MediaProgressCopyWithImpl<$Res>
    implements _$MediaProgressCopyWith<$Res> {
  __$MediaProgressCopyWithImpl(this._self, this._then);

  final _MediaProgress _self;
  final $Res Function(_MediaProgress) _then;

/// Create a copy of MediaProgress
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? userId = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,Object? mediaItemId = freezed,Object? mediaItemType = freezed,Object? duration = freezed,Object? progress = freezed,Object? currentTime = freezed,Object? isFinished = null,Object? hideFromContinueListening = null,Object? ebookLocation = freezed,Object? ebookProgress = freezed,Object? lastUpdate = freezed,Object? startedAt = freezed,Object? finishedAt = freezed,}) {
  return _then(_MediaProgress(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaItemId: freezed == mediaItemId ? _self.mediaItemId : mediaItemId // ignore: cast_nullable_to_non_nullable
as String?,mediaItemType: freezed == mediaItemType ? _self.mediaItemType : mediaItemType // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,progress: freezed == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double?,currentTime: freezed == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double?,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,hideFromContinueListening: null == hideFromContinueListening ? _self.hideFromContinueListening : hideFromContinueListening // ignore: cast_nullable_to_non_nullable
as bool,ebookLocation: freezed == ebookLocation ? _self.ebookLocation : ebookLocation // ignore: cast_nullable_to_non_nullable
as String?,ebookProgress: freezed == ebookProgress ? _self.ebookProgress : ebookProgress // ignore: cast_nullable_to_non_nullable
as double?,lastUpdate: freezed == lastUpdate ? _self.lastUpdate : lastUpdate // ignore: cast_nullable_to_non_nullable
as int?,startedAt: freezed == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int?,finishedAt: freezed == finishedAt ? _self.finishedAt : finishedAt // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
