// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'player_overlay_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PlayerOverlayState {

 Duration get position; Duration get duration; bool get isPlaying; bool get isChapterMode; double get progress; double get chapterProgress; Duration get currentChapterDuration;
/// Create a copy of PlayerOverlayState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayerOverlayStateCopyWith<PlayerOverlayState> get copyWith => _$PlayerOverlayStateCopyWithImpl<PlayerOverlayState>(this as PlayerOverlayState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayerOverlayState&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isChapterMode, isChapterMode) || other.isChapterMode == isChapterMode)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.chapterProgress, chapterProgress) || other.chapterProgress == chapterProgress)&&(identical(other.currentChapterDuration, currentChapterDuration) || other.currentChapterDuration == currentChapterDuration));
}


@override
int get hashCode => Object.hash(runtimeType,position,duration,isPlaying,isChapterMode,progress,chapterProgress,currentChapterDuration);

@override
String toString() {
  return 'PlayerOverlayState(position: $position, duration: $duration, isPlaying: $isPlaying, isChapterMode: $isChapterMode, progress: $progress, chapterProgress: $chapterProgress, currentChapterDuration: $currentChapterDuration)';
}


}

/// @nodoc
abstract mixin class $PlayerOverlayStateCopyWith<$Res>  {
  factory $PlayerOverlayStateCopyWith(PlayerOverlayState value, $Res Function(PlayerOverlayState) _then) = _$PlayerOverlayStateCopyWithImpl;
@useResult
$Res call({
 Duration position, Duration duration, bool isPlaying, bool isChapterMode, double progress, double chapterProgress, Duration currentChapterDuration
});




}
/// @nodoc
class _$PlayerOverlayStateCopyWithImpl<$Res>
    implements $PlayerOverlayStateCopyWith<$Res> {
  _$PlayerOverlayStateCopyWithImpl(this._self, this._then);

  final PlayerOverlayState _self;
  final $Res Function(PlayerOverlayState) _then;

/// Create a copy of PlayerOverlayState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? position = null,Object? duration = null,Object? isPlaying = null,Object? isChapterMode = null,Object? progress = null,Object? chapterProgress = null,Object? currentChapterDuration = null,}) {
  return _then(_self.copyWith(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isChapterMode: null == isChapterMode ? _self.isChapterMode : isChapterMode // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,chapterProgress: null == chapterProgress ? _self.chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as double,currentChapterDuration: null == currentChapterDuration ? _self.currentChapterDuration : currentChapterDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}

}


/// Adds pattern-matching-related methods to [PlayerOverlayState].
extension PlayerOverlayStatePatterns on PlayerOverlayState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayerOverlayState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayerOverlayState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayerOverlayState value)  $default,){
final _that = this;
switch (_that) {
case _PlayerOverlayState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayerOverlayState value)?  $default,){
final _that = this;
switch (_that) {
case _PlayerOverlayState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Duration position,  Duration duration,  bool isPlaying,  bool isChapterMode,  double progress,  double chapterProgress,  Duration currentChapterDuration)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayerOverlayState() when $default != null:
return $default(_that.position,_that.duration,_that.isPlaying,_that.isChapterMode,_that.progress,_that.chapterProgress,_that.currentChapterDuration);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Duration position,  Duration duration,  bool isPlaying,  bool isChapterMode,  double progress,  double chapterProgress,  Duration currentChapterDuration)  $default,) {final _that = this;
switch (_that) {
case _PlayerOverlayState():
return $default(_that.position,_that.duration,_that.isPlaying,_that.isChapterMode,_that.progress,_that.chapterProgress,_that.currentChapterDuration);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Duration position,  Duration duration,  bool isPlaying,  bool isChapterMode,  double progress,  double chapterProgress,  Duration currentChapterDuration)?  $default,) {final _that = this;
switch (_that) {
case _PlayerOverlayState() when $default != null:
return $default(_that.position,_that.duration,_that.isPlaying,_that.isChapterMode,_that.progress,_that.chapterProgress,_that.currentChapterDuration);case _:
  return null;

}
}

}

/// @nodoc


class _PlayerOverlayState implements PlayerOverlayState {
  const _PlayerOverlayState({this.position = Duration.zero, this.duration = Duration.zero, this.isPlaying = false, this.isChapterMode = false, this.progress = 0.0, this.chapterProgress = 0.0, this.currentChapterDuration = Duration.zero});
  

@override@JsonKey() final  Duration position;
@override@JsonKey() final  Duration duration;
@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  bool isChapterMode;
@override@JsonKey() final  double progress;
@override@JsonKey() final  double chapterProgress;
@override@JsonKey() final  Duration currentChapterDuration;

/// Create a copy of PlayerOverlayState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayerOverlayStateCopyWith<_PlayerOverlayState> get copyWith => __$PlayerOverlayStateCopyWithImpl<_PlayerOverlayState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayerOverlayState&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.isChapterMode, isChapterMode) || other.isChapterMode == isChapterMode)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.chapterProgress, chapterProgress) || other.chapterProgress == chapterProgress)&&(identical(other.currentChapterDuration, currentChapterDuration) || other.currentChapterDuration == currentChapterDuration));
}


@override
int get hashCode => Object.hash(runtimeType,position,duration,isPlaying,isChapterMode,progress,chapterProgress,currentChapterDuration);

@override
String toString() {
  return 'PlayerOverlayState(position: $position, duration: $duration, isPlaying: $isPlaying, isChapterMode: $isChapterMode, progress: $progress, chapterProgress: $chapterProgress, currentChapterDuration: $currentChapterDuration)';
}


}

/// @nodoc
abstract mixin class _$PlayerOverlayStateCopyWith<$Res> implements $PlayerOverlayStateCopyWith<$Res> {
  factory _$PlayerOverlayStateCopyWith(_PlayerOverlayState value, $Res Function(_PlayerOverlayState) _then) = __$PlayerOverlayStateCopyWithImpl;
@override @useResult
$Res call({
 Duration position, Duration duration, bool isPlaying, bool isChapterMode, double progress, double chapterProgress, Duration currentChapterDuration
});




}
/// @nodoc
class __$PlayerOverlayStateCopyWithImpl<$Res>
    implements _$PlayerOverlayStateCopyWith<$Res> {
  __$PlayerOverlayStateCopyWithImpl(this._self, this._then);

  final _PlayerOverlayState _self;
  final $Res Function(_PlayerOverlayState) _then;

/// Create a copy of PlayerOverlayState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? position = null,Object? duration = null,Object? isPlaying = null,Object? isChapterMode = null,Object? progress = null,Object? chapterProgress = null,Object? currentChapterDuration = null,}) {
  return _then(_PlayerOverlayState(
position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,isChapterMode: null == isChapterMode ? _self.isChapterMode : isChapterMode // ignore: cast_nullable_to_non_nullable
as bool,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,chapterProgress: null == chapterProgress ? _self.chapterProgress : chapterProgress // ignore: cast_nullable_to_non_nullable
as double,currentChapterDuration: null == currentChapterDuration ? _self.currentChapterDuration : currentChapterDuration // ignore: cast_nullable_to_non_nullable
as Duration,
  ));
}


}

// dart format on
