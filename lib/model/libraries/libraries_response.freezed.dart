// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'libraries_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibrariesResponse {

 List<Library> get libraries;
/// Create a copy of LibrariesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibrariesResponseCopyWith<LibrariesResponse> get copyWith => _$LibrariesResponseCopyWithImpl<LibrariesResponse>(this as LibrariesResponse, _$identity);

  /// Serializes this LibrariesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibrariesResponse&&const DeepCollectionEquality().equals(other.libraries, libraries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(libraries));

@override
String toString() {
  return 'LibrariesResponse(libraries: $libraries)';
}


}

/// @nodoc
abstract mixin class $LibrariesResponseCopyWith<$Res>  {
  factory $LibrariesResponseCopyWith(LibrariesResponse value, $Res Function(LibrariesResponse) _then) = _$LibrariesResponseCopyWithImpl;
@useResult
$Res call({
 List<Library> libraries
});




}
/// @nodoc
class _$LibrariesResponseCopyWithImpl<$Res>
    implements $LibrariesResponseCopyWith<$Res> {
  _$LibrariesResponseCopyWithImpl(this._self, this._then);

  final LibrariesResponse _self;
  final $Res Function(LibrariesResponse) _then;

/// Create a copy of LibrariesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? libraries = null,}) {
  return _then(_self.copyWith(
libraries: null == libraries ? _self.libraries : libraries // ignore: cast_nullable_to_non_nullable
as List<Library>,
  ));
}

}


/// Adds pattern-matching-related methods to [LibrariesResponse].
extension LibrariesResponsePatterns on LibrariesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibrariesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibrariesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibrariesResponse value)  $default,){
final _that = this;
switch (_that) {
case _LibrariesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibrariesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LibrariesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<Library> libraries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibrariesResponse() when $default != null:
return $default(_that.libraries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<Library> libraries)  $default,) {final _that = this;
switch (_that) {
case _LibrariesResponse():
return $default(_that.libraries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<Library> libraries)?  $default,) {final _that = this;
switch (_that) {
case _LibrariesResponse() when $default != null:
return $default(_that.libraries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibrariesResponse implements LibrariesResponse {
  const _LibrariesResponse({required final  List<Library> libraries}): _libraries = libraries;
  factory _LibrariesResponse.fromJson(Map<String, dynamic> json) => _$LibrariesResponseFromJson(json);

 final  List<Library> _libraries;
@override List<Library> get libraries {
  if (_libraries is EqualUnmodifiableListView) return _libraries;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_libraries);
}


/// Create a copy of LibrariesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibrariesResponseCopyWith<_LibrariesResponse> get copyWith => __$LibrariesResponseCopyWithImpl<_LibrariesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibrariesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibrariesResponse&&const DeepCollectionEquality().equals(other._libraries, _libraries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_libraries));

@override
String toString() {
  return 'LibrariesResponse(libraries: $libraries)';
}


}

/// @nodoc
abstract mixin class _$LibrariesResponseCopyWith<$Res> implements $LibrariesResponseCopyWith<$Res> {
  factory _$LibrariesResponseCopyWith(_LibrariesResponse value, $Res Function(_LibrariesResponse) _then) = __$LibrariesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<Library> libraries
});




}
/// @nodoc
class __$LibrariesResponseCopyWithImpl<$Res>
    implements _$LibrariesResponseCopyWith<$Res> {
  __$LibrariesResponseCopyWithImpl(this._self, this._then);

  final _LibrariesResponse _self;
  final $Res Function(_LibrariesResponse) _then;

/// Create a copy of LibrariesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? libraries = null,}) {
  return _then(_LibrariesResponse(
libraries: null == libraries ? _self._libraries : libraries // ignore: cast_nullable_to_non_nullable
as List<Library>,
  ));
}


}

// dart format on
