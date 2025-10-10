// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_progress_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookProgressState {

 String get itemId; double get progress;// 0.0 to 1.0
 double get currentTime;// in seconds
 double get duration;// in seconds
 bool get isFinished; bool get isPlaying;
/// Create a copy of BookProgressState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookProgressStateCopyWith<BookProgressState> get copyWith => _$BookProgressStateCopyWithImpl<BookProgressState>(this as BookProgressState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookProgressState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,progress,currentTime,duration,isFinished,isPlaying);

@override
String toString() {
  return 'BookProgressState(itemId: $itemId, progress: $progress, currentTime: $currentTime, duration: $duration, isFinished: $isFinished, isPlaying: $isPlaying)';
}


}

/// @nodoc
abstract mixin class $BookProgressStateCopyWith<$Res>  {
  factory $BookProgressStateCopyWith(BookProgressState value, $Res Function(BookProgressState) _then) = _$BookProgressStateCopyWithImpl;
@useResult
$Res call({
 String itemId, double progress, double currentTime, double duration, bool isFinished, bool isPlaying
});




}
/// @nodoc
class _$BookProgressStateCopyWithImpl<$Res>
    implements $BookProgressStateCopyWith<$Res> {
  _$BookProgressStateCopyWithImpl(this._self, this._then);

  final BookProgressState _self;
  final $Res Function(BookProgressState) _then;

/// Create a copy of BookProgressState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? progress = null,Object? currentTime = null,Object? duration = null,Object? isFinished = null,Object? isPlaying = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [BookProgressState].
extension BookProgressStatePatterns on BookProgressState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookProgressState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookProgressState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookProgressState value)  $default,){
final _that = this;
switch (_that) {
case _BookProgressState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookProgressState value)?  $default,){
final _that = this;
switch (_that) {
case _BookProgressState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  double progress,  double currentTime,  double duration,  bool isFinished,  bool isPlaying)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookProgressState() when $default != null:
return $default(_that.itemId,_that.progress,_that.currentTime,_that.duration,_that.isFinished,_that.isPlaying);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  double progress,  double currentTime,  double duration,  bool isFinished,  bool isPlaying)  $default,) {final _that = this;
switch (_that) {
case _BookProgressState():
return $default(_that.itemId,_that.progress,_that.currentTime,_that.duration,_that.isFinished,_that.isPlaying);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  double progress,  double currentTime,  double duration,  bool isFinished,  bool isPlaying)?  $default,) {final _that = this;
switch (_that) {
case _BookProgressState() when $default != null:
return $default(_that.itemId,_that.progress,_that.currentTime,_that.duration,_that.isFinished,_that.isPlaying);case _:
  return null;

}
}

}

/// @nodoc


class _BookProgressState implements BookProgressState {
  const _BookProgressState({required this.itemId, this.progress = 0.0, this.currentTime = 0.0, this.duration = 0.0, this.isFinished = false, this.isPlaying = false});
  

@override final  String itemId;
@override@JsonKey() final  double progress;
// 0.0 to 1.0
@override@JsonKey() final  double currentTime;
// in seconds
@override@JsonKey() final  double duration;
// in seconds
@override@JsonKey() final  bool isFinished;
@override@JsonKey() final  bool isPlaying;

/// Create a copy of BookProgressState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookProgressStateCopyWith<_BookProgressState> get copyWith => __$BookProgressStateCopyWithImpl<_BookProgressState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookProgressState&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.progress, progress) || other.progress == progress)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.isFinished, isFinished) || other.isFinished == isFinished)&&(identical(other.isPlaying, isPlaying) || other.isPlaying == isPlaying));
}


@override
int get hashCode => Object.hash(runtimeType,itemId,progress,currentTime,duration,isFinished,isPlaying);

@override
String toString() {
  return 'BookProgressState(itemId: $itemId, progress: $progress, currentTime: $currentTime, duration: $duration, isFinished: $isFinished, isPlaying: $isPlaying)';
}


}

/// @nodoc
abstract mixin class _$BookProgressStateCopyWith<$Res> implements $BookProgressStateCopyWith<$Res> {
  factory _$BookProgressStateCopyWith(_BookProgressState value, $Res Function(_BookProgressState) _then) = __$BookProgressStateCopyWithImpl;
@override @useResult
$Res call({
 String itemId, double progress, double currentTime, double duration, bool isFinished, bool isPlaying
});




}
/// @nodoc
class __$BookProgressStateCopyWithImpl<$Res>
    implements _$BookProgressStateCopyWith<$Res> {
  __$BookProgressStateCopyWithImpl(this._self, this._then);

  final _BookProgressState _self;
  final $Res Function(_BookProgressState) _then;

/// Create a copy of BookProgressState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? progress = null,Object? currentTime = null,Object? duration = null,Object? isFinished = null,Object? isPlaying = null,}) {
  return _then(_BookProgressState(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,progress: null == progress ? _self.progress : progress // ignore: cast_nullable_to_non_nullable
as double,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,isFinished: null == isFinished ? _self.isFinished : isFinished // ignore: cast_nullable_to_non_nullable
as bool,isPlaying: null == isPlaying ? _self.isPlaying : isPlaying // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
