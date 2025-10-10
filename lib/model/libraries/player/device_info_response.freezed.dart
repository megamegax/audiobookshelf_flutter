// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DeviceInfoResponse {

 String get clientVersion;
/// Create a copy of DeviceInfoResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DeviceInfoResponseCopyWith<DeviceInfoResponse> get copyWith => _$DeviceInfoResponseCopyWithImpl<DeviceInfoResponse>(this as DeviceInfoResponse, _$identity);

  /// Serializes this DeviceInfoResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DeviceInfoResponse&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientVersion);

@override
String toString() {
  return 'DeviceInfoResponse(clientVersion: $clientVersion)';
}


}

/// @nodoc
abstract mixin class $DeviceInfoResponseCopyWith<$Res>  {
  factory $DeviceInfoResponseCopyWith(DeviceInfoResponse value, $Res Function(DeviceInfoResponse) _then) = _$DeviceInfoResponseCopyWithImpl;
@useResult
$Res call({
 String clientVersion
});




}
/// @nodoc
class _$DeviceInfoResponseCopyWithImpl<$Res>
    implements $DeviceInfoResponseCopyWith<$Res> {
  _$DeviceInfoResponseCopyWithImpl(this._self, this._then);

  final DeviceInfoResponse _self;
  final $Res Function(DeviceInfoResponse) _then;

/// Create a copy of DeviceInfoResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? clientVersion = null,}) {
  return _then(_self.copyWith(
clientVersion: null == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [DeviceInfoResponse].
extension DeviceInfoResponsePatterns on DeviceInfoResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DeviceInfoResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DeviceInfoResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DeviceInfoResponse value)  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DeviceInfoResponse value)?  $default,){
final _that = this;
switch (_that) {
case _DeviceInfoResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String clientVersion)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DeviceInfoResponse() when $default != null:
return $default(_that.clientVersion);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String clientVersion)  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoResponse():
return $default(_that.clientVersion);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String clientVersion)?  $default,) {final _that = this;
switch (_that) {
case _DeviceInfoResponse() when $default != null:
return $default(_that.clientVersion);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DeviceInfoResponse implements DeviceInfoResponse {
  const _DeviceInfoResponse({required this.clientVersion});
  factory _DeviceInfoResponse.fromJson(Map<String, dynamic> json) => _$DeviceInfoResponseFromJson(json);

@override final  String clientVersion;

/// Create a copy of DeviceInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DeviceInfoResponseCopyWith<_DeviceInfoResponse> get copyWith => __$DeviceInfoResponseCopyWithImpl<_DeviceInfoResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DeviceInfoResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DeviceInfoResponse&&(identical(other.clientVersion, clientVersion) || other.clientVersion == clientVersion));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,clientVersion);

@override
String toString() {
  return 'DeviceInfoResponse(clientVersion: $clientVersion)';
}


}

/// @nodoc
abstract mixin class _$DeviceInfoResponseCopyWith<$Res> implements $DeviceInfoResponseCopyWith<$Res> {
  factory _$DeviceInfoResponseCopyWith(_DeviceInfoResponse value, $Res Function(_DeviceInfoResponse) _then) = __$DeviceInfoResponseCopyWithImpl;
@override @useResult
$Res call({
 String clientVersion
});




}
/// @nodoc
class __$DeviceInfoResponseCopyWithImpl<$Res>
    implements _$DeviceInfoResponseCopyWith<$Res> {
  __$DeviceInfoResponseCopyWithImpl(this._self, this._then);

  final _DeviceInfoResponse _self;
  final $Res Function(_DeviceInfoResponse) _then;

/// Create a copy of DeviceInfoResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? clientVersion = null,}) {
  return _then(_DeviceInfoResponse(
clientVersion: null == clientVersion ? _self.clientVersion : clientVersion // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
