// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_item_request_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlayItemRequestPayload {

 String get itemId; String get mediaType; String get mediaPlayer; bool get forceDirectPlay; bool get forceTranscode; DeviceInfo get deviceInfo;
/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlayItemRequestPayloadCopyWith<PlayItemRequestPayload> get copyWith => _$PlayItemRequestPayloadCopyWithImpl<PlayItemRequestPayload>(this as PlayItemRequestPayload, _$identity);

  /// Serializes this PlayItemRequestPayload to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlayItemRequestPayload&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer)&&(identical(other.forceDirectPlay, forceDirectPlay) || other.forceDirectPlay == forceDirectPlay)&&(identical(other.forceTranscode, forceTranscode) || other.forceTranscode == forceTranscode)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,mediaType,mediaPlayer,forceDirectPlay,forceTranscode,deviceInfo);

@override
String toString() {
  return 'PlayItemRequestPayload(itemId: $itemId, mediaType: $mediaType, mediaPlayer: $mediaPlayer, forceDirectPlay: $forceDirectPlay, forceTranscode: $forceTranscode, deviceInfo: $deviceInfo)';
}


}

/// @nodoc
abstract mixin class $PlayItemRequestPayloadCopyWith<$Res>  {
  factory $PlayItemRequestPayloadCopyWith(PlayItemRequestPayload value, $Res Function(PlayItemRequestPayload) _then) = _$PlayItemRequestPayloadCopyWithImpl;
@useResult
$Res call({
 String itemId, String mediaType, String mediaPlayer, bool forceDirectPlay, bool forceTranscode, DeviceInfo deviceInfo
});


$DeviceInfoCopyWith<$Res> get deviceInfo;

}
/// @nodoc
class _$PlayItemRequestPayloadCopyWithImpl<$Res>
    implements $PlayItemRequestPayloadCopyWith<$Res> {
  _$PlayItemRequestPayloadCopyWithImpl(this._self, this._then);

  final PlayItemRequestPayload _self;
  final $Res Function(PlayItemRequestPayload) _then;

/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? itemId = null,Object? mediaType = null,Object? mediaPlayer = null,Object? forceDirectPlay = null,Object? forceTranscode = null,Object? deviceInfo = null,}) {
  return _then(_self.copyWith(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaPlayer: null == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String,forceDirectPlay: null == forceDirectPlay ? _self.forceDirectPlay : forceDirectPlay // ignore: cast_nullable_to_non_nullable
as bool,forceTranscode: null == forceTranscode ? _self.forceTranscode : forceTranscode // ignore: cast_nullable_to_non_nullable
as bool,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfo,
  ));
}
/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<$Res> get deviceInfo {
  
  return $DeviceInfoCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlayItemRequestPayload].
extension PlayItemRequestPayloadPatterns on PlayItemRequestPayload {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlayItemRequestPayload value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlayItemRequestPayload() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlayItemRequestPayload value)  $default,){
final _that = this;
switch (_that) {
case _PlayItemRequestPayload():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlayItemRequestPayload value)?  $default,){
final _that = this;
switch (_that) {
case _PlayItemRequestPayload() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String itemId,  String mediaType,  String mediaPlayer,  bool forceDirectPlay,  bool forceTranscode,  DeviceInfo deviceInfo)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlayItemRequestPayload() when $default != null:
return $default(_that.itemId,_that.mediaType,_that.mediaPlayer,_that.forceDirectPlay,_that.forceTranscode,_that.deviceInfo);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String itemId,  String mediaType,  String mediaPlayer,  bool forceDirectPlay,  bool forceTranscode,  DeviceInfo deviceInfo)  $default,) {final _that = this;
switch (_that) {
case _PlayItemRequestPayload():
return $default(_that.itemId,_that.mediaType,_that.mediaPlayer,_that.forceDirectPlay,_that.forceTranscode,_that.deviceInfo);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String itemId,  String mediaType,  String mediaPlayer,  bool forceDirectPlay,  bool forceTranscode,  DeviceInfo deviceInfo)?  $default,) {final _that = this;
switch (_that) {
case _PlayItemRequestPayload() when $default != null:
return $default(_that.itemId,_that.mediaType,_that.mediaPlayer,_that.forceDirectPlay,_that.forceTranscode,_that.deviceInfo);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _PlayItemRequestPayload implements PlayItemRequestPayload {
  const _PlayItemRequestPayload({required this.itemId, required this.mediaType, required this.mediaPlayer, required this.forceDirectPlay, required this.forceTranscode, required this.deviceInfo});
  factory _PlayItemRequestPayload.fromJson(Map<String, dynamic> json) => _$PlayItemRequestPayloadFromJson(json);

@override final  String itemId;
@override final  String mediaType;
@override final  String mediaPlayer;
@override final  bool forceDirectPlay;
@override final  bool forceTranscode;
@override final  DeviceInfo deviceInfo;

/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlayItemRequestPayloadCopyWith<_PlayItemRequestPayload> get copyWith => __$PlayItemRequestPayloadCopyWithImpl<_PlayItemRequestPayload>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$PlayItemRequestPayloadToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlayItemRequestPayload&&(identical(other.itemId, itemId) || other.itemId == itemId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer)&&(identical(other.forceDirectPlay, forceDirectPlay) || other.forceDirectPlay == forceDirectPlay)&&(identical(other.forceTranscode, forceTranscode) || other.forceTranscode == forceTranscode)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,itemId,mediaType,mediaPlayer,forceDirectPlay,forceTranscode,deviceInfo);

@override
String toString() {
  return 'PlayItemRequestPayload(itemId: $itemId, mediaType: $mediaType, mediaPlayer: $mediaPlayer, forceDirectPlay: $forceDirectPlay, forceTranscode: $forceTranscode, deviceInfo: $deviceInfo)';
}


}

/// @nodoc
abstract mixin class _$PlayItemRequestPayloadCopyWith<$Res> implements $PlayItemRequestPayloadCopyWith<$Res> {
  factory _$PlayItemRequestPayloadCopyWith(_PlayItemRequestPayload value, $Res Function(_PlayItemRequestPayload) _then) = __$PlayItemRequestPayloadCopyWithImpl;
@override @useResult
$Res call({
 String itemId, String mediaType, String mediaPlayer, bool forceDirectPlay, bool forceTranscode, DeviceInfo deviceInfo
});


@override $DeviceInfoCopyWith<$Res> get deviceInfo;

}
/// @nodoc
class __$PlayItemRequestPayloadCopyWithImpl<$Res>
    implements _$PlayItemRequestPayloadCopyWith<$Res> {
  __$PlayItemRequestPayloadCopyWithImpl(this._self, this._then);

  final _PlayItemRequestPayload _self;
  final $Res Function(_PlayItemRequestPayload) _then;

/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? itemId = null,Object? mediaType = null,Object? mediaPlayer = null,Object? forceDirectPlay = null,Object? forceTranscode = null,Object? deviceInfo = null,}) {
  return _then(_PlayItemRequestPayload(
itemId: null == itemId ? _self.itemId : itemId // ignore: cast_nullable_to_non_nullable
as String,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,mediaPlayer: null == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String,forceDirectPlay: null == forceDirectPlay ? _self.forceDirectPlay : forceDirectPlay // ignore: cast_nullable_to_non_nullable
as bool,forceTranscode: null == forceTranscode ? _self.forceTranscode : forceTranscode // ignore: cast_nullable_to_non_nullable
as bool,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfo,
  ));
}

/// Create a copy of PlayItemRequestPayload
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoCopyWith<$Res> get deviceInfo {
  
  return $DeviceInfoCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}
}

// dart format on
