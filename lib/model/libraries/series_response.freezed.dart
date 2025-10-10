// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesResponse {

 List<SeriesItem> get results;
/// Create a copy of SeriesResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesResponseCopyWith<SeriesResponse> get copyWith => _$SeriesResponseCopyWithImpl<SeriesResponse>(this as SeriesResponse, _$identity);

  /// Serializes this SeriesResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesResponse&&const DeepCollectionEquality().equals(other.results, results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results));

@override
String toString() {
  return 'SeriesResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class $SeriesResponseCopyWith<$Res>  {
  factory $SeriesResponseCopyWith(SeriesResponse value, $Res Function(SeriesResponse) _then) = _$SeriesResponseCopyWithImpl;
@useResult
$Res call({
 List<SeriesItem> results
});




}
/// @nodoc
class _$SeriesResponseCopyWithImpl<$Res>
    implements $SeriesResponseCopyWith<$Res> {
  _$SeriesResponseCopyWithImpl(this._self, this._then);

  final SeriesResponse _self;
  final $Res Function(SeriesResponse) _then;

/// Create a copy of SeriesResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SeriesItem>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesResponse].
extension SeriesResponsePatterns on SeriesResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesResponse value)  $default,){
final _that = this;
switch (_that) {
case _SeriesResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesResponse value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SeriesItem> results)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesResponse() when $default != null:
return $default(_that.results);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SeriesItem> results)  $default,) {final _that = this;
switch (_that) {
case _SeriesResponse():
return $default(_that.results);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SeriesItem> results)?  $default,) {final _that = this;
switch (_that) {
case _SeriesResponse() when $default != null:
return $default(_that.results);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesResponse implements SeriesResponse {
  const _SeriesResponse({required final  List<SeriesItem> results}): _results = results;
  factory _SeriesResponse.fromJson(Map<String, dynamic> json) => _$SeriesResponseFromJson(json);

 final  List<SeriesItem> _results;
@override List<SeriesItem> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}


/// Create a copy of SeriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesResponseCopyWith<_SeriesResponse> get copyWith => __$SeriesResponseCopyWithImpl<_SeriesResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesResponse&&const DeepCollectionEquality().equals(other._results, _results));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results));

@override
String toString() {
  return 'SeriesResponse(results: $results)';
}


}

/// @nodoc
abstract mixin class _$SeriesResponseCopyWith<$Res> implements $SeriesResponseCopyWith<$Res> {
  factory _$SeriesResponseCopyWith(_SeriesResponse value, $Res Function(_SeriesResponse) _then) = __$SeriesResponseCopyWithImpl;
@override @useResult
$Res call({
 List<SeriesItem> results
});




}
/// @nodoc
class __$SeriesResponseCopyWithImpl<$Res>
    implements _$SeriesResponseCopyWith<$Res> {
  __$SeriesResponseCopyWithImpl(this._self, this._then);

  final _SeriesResponse _self;
  final $Res Function(_SeriesResponse) _then;

/// Create a copy of SeriesResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,}) {
  return _then(_SeriesResponse(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SeriesItem>,
  ));
}


}

// dart format on
