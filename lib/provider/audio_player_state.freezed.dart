// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_player_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AudioPlayerState {

 bool get isPlaying; Duration get position; Duration? get duration; double get progress; AudioSource? get audioSource; ProcessingState get processingState; LibraryItemEntity? get currentItem;// MediaItem? currentMediaItem, // TODO: Import MediaItem from just_audio
 bool get isPrepared; bool get isLoading; String? get error;
/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioPlayerStateCopyWith<AudioPlayerState> get copyWith => _$AudioPlayerStateCopyWithImpl<AudioPlayerState>(this as AudioPlayerState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioPlayerState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.audioSource, audioSource) || other.audioSource == audioSource)&&(identical(other.processingState, processingState) || other.processingState == processingState)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.isPrepared, isPrepared) || other.isPrepared == isPrepared)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,position,duration,progress,audioSource,processingState,currentItem,isPrepared,isLoading,error);

@override
String toString() {
  return 'AudioPlayerState(isPlaying: $isPlaying, position: $position, duration: $duration, progress: $progress, audioSource: $audioSource, processingState: $processingState, currentItem: $currentItem, isPrepared: $isPrepared, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $AudioPlayerStateCopyWith<$Res>  {
  factory $AudioPlayerStateCopyWith(AudioPlayerState value, $Res Function(AudioPlayerState) _then) = _$AudioPlayerStateCopyWithImpl;
@useResult
$Res call({
 bool isPlaying, Duration position, Duration? duration, double progress, AudioSource? audioSource, ProcessingState processingState, LibraryItemEntity? currentItem, bool isPrepared, bool isLoading, String? error
});




}
/// @nodoc
class _$AudioPlayerStateCopyWithImpl<$Res>
    implements $AudioPlayerStateCopyWith<$Res> {
  _$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final AudioPlayerState _self;
  final $Res Function(AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isPlaying = null,Object? position = null,Object? duration = freezed,Object? progress = null,Object? audioSource = freezed,Object? processingState = null,Object? currentItem = freezed,Object? isPrepared = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,audioSource: freezed == audioSource ? _self.audioSource : audioSource // ignore: cast_nullable_to_non_nullable
as AudioSource?,processingState: null == processingState ? _self.processingState : processingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as LibraryItemEntity?,isPrepared: null == isPrepared ? _self.isPrepared : isPrepared // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [AudioPlayerState].
extension AudioPlayerStatePatterns on AudioPlayerState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioPlayerState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioPlayerState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioPlayerState value)  $default,){
final _that = this;
switch (_that) {
case _AudioPlayerState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioPlayerState value)?  $default,){
final _that = this;
switch (_that) {
case _AudioPlayerState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isPlaying,  Duration position,  Duration? duration,  double progress,  AudioSource? audioSource,  ProcessingState processingState,  LibraryItemEntity? currentItem,  bool isPrepared,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioPlayerState() when $default != null:
return $default(_that.isPlaying,_that.position,_that.duration,_that.progress,_that.audioSource,_that.processingState,_that.currentItem,_that.isPrepared,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isPlaying,  Duration position,  Duration? duration,  double progress,  AudioSource? audioSource,  ProcessingState processingState,  LibraryItemEntity? currentItem,  bool isPrepared,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _AudioPlayerState():
return $default(_that.isPlaying,_that.position,_that.duration,_that.progress,_that.audioSource,_that.processingState,_that.currentItem,_that.isPrepared,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isPlaying,  Duration position,  Duration? duration,  double progress,  AudioSource? audioSource,  ProcessingState processingState,  LibraryItemEntity? currentItem,  bool isPrepared,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _AudioPlayerState() when $default != null:
return $default(_that.isPlaying,_that.position,_that.duration,_that.progress,_that.audioSource,_that.processingState,_that.currentItem,_that.isPrepared,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _AudioPlayerState extends AudioPlayerState {
  const _AudioPlayerState({this.isPlaying = false, this.position = Duration.zero, this.duration, this.progress = 0.0, this.audioSource, this.processingState = ProcessingState.idle, this.currentItem, this.isPrepared = false, this.isLoading = false, this.error}): super._();
  

@override@JsonKey() final  bool isPlaying;
@override@JsonKey() final  Duration position;
@override final  Duration? duration;
@override@JsonKey() final  double progress;
@override final  AudioSource? audioSource;
@override@JsonKey() final  ProcessingState processingState;
@override final  LibraryItemEntity? currentItem;
// MediaItem? currentMediaItem, // TODO: Import MediaItem from just_audio
@override@JsonKey() final  bool isPrepared;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioPlayerStateCopyWith<_AudioPlayerState> get copyWith => __$AudioPlayerStateCopyWithImpl<_AudioPlayerState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioPlayerState&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying)&&(identical(other.position, position) || other.position == position)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.audioSource, audioSource) || other.audioSource == audioSource)&&(identical(other.processingState, processingState) || other.processingState == processingState)&&(identical(other.currentItem, currentItem) || other.currentItem == currentItem)&&(identical(other.isPrepared, isPrepared) || other.isPrepared == isPrepared)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,isPlaying,position,duration,progress,audioSource,processingState,currentItem,isPrepared,isLoading,error);

@override
String toString() {
  return 'AudioPlayerState(isPlaying: $isPlaying, position: $position, duration: $duration, progress: $progress, audioSource: $audioSource, processingState: $processingState, currentItem: $currentItem, isPrepared: $isPrepared, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$AudioPlayerStateCopyWith<$Res> implements $AudioPlayerStateCopyWith<$Res> {
  factory _$AudioPlayerStateCopyWith(_AudioPlayerState value, $Res Function(_AudioPlayerState) _then) = __$AudioPlayerStateCopyWithImpl;
@override @useResult
$Res call({
 bool isPlaying, Duration position, Duration? duration, double progress, AudioSource? audioSource, ProcessingState processingState, LibraryItemEntity? currentItem, bool isPrepared, bool isLoading, String? error
});




}
/// @nodoc
class __$AudioPlayerStateCopyWithImpl<$Res>
    implements _$AudioPlayerStateCopyWith<$Res> {
  __$AudioPlayerStateCopyWithImpl(this._self, this._then);

  final _AudioPlayerState _self;
  final $Res Function(_AudioPlayerState) _then;

/// Create a copy of AudioPlayerState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isPlaying = null,Object? position = null,Object? duration = freezed,Object? progress = null,Object? audioSource = freezed,Object? processingState = null,Object? currentItem = freezed,Object? isPrepared = null,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_AudioPlayerState(
isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,position: null == position ? _self.position : position // ignore: cast_nullable_to_non_nullable
as Duration,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as Duration?,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,audioSource: freezed == audioSource ? _self.audioSource : audioSource // ignore: cast_nullable_to_non_nullable
as AudioSource?,processingState: null == processingState ? _self.processingState : processingState // ignore: cast_nullable_to_non_nullable
as ProcessingState,currentItem: freezed == currentItem ? _self.currentItem : currentItem // ignore: cast_nullable_to_non_nullable
as LibraryItemEntity?,isPrepared: null == isPrepared ? _self.isPrepared : isPrepared // ignore: cast_nullable_to_non_nullable
as bool,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
