// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collapsed_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$CollapsedSeries {

 String get id; String get name; String get nameIgnorePrefix; int? get numBooks;
/// Create a copy of CollapsedSeries
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$CollapsedSeriesCopyWith<CollapsedSeries> get copyWith => _$CollapsedSeriesCopyWithImpl<CollapsedSeries>(this as CollapsedSeries, _$identity);

  /// Serializes this CollapsedSeries to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is CollapsedSeries&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameIgnorePrefix,numBooks);

@override
String toString() {
  return 'CollapsedSeries(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, numBooks: $numBooks)';
}


}

/// @nodoc
abstract mixin class $CollapsedSeriesCopyWith<$Res>  {
  factory $CollapsedSeriesCopyWith(CollapsedSeries value, $Res Function(CollapsedSeries) _then) = _$CollapsedSeriesCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameIgnorePrefix, int? numBooks
});




}
/// @nodoc
class _$CollapsedSeriesCopyWithImpl<$Res>
    implements $CollapsedSeriesCopyWith<$Res> {
  _$CollapsedSeriesCopyWithImpl(this._self, this._then);

  final CollapsedSeries _self;
  final $Res Function(CollapsedSeries) _then;

/// Create a copy of CollapsedSeries
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameIgnorePrefix = null,Object? numBooks = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: null == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [CollapsedSeries].
extension CollapsedSeriesPatterns on CollapsedSeries {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _CollapsedSeries value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _CollapsedSeries() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _CollapsedSeries value)  $default,){
final _that = this;
switch (_that) {
case _CollapsedSeries():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _CollapsedSeries value)?  $default,){
final _that = this;
switch (_that) {
case _CollapsedSeries() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameIgnorePrefix,  int? numBooks)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _CollapsedSeries() when $default != null:
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.numBooks);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameIgnorePrefix,  int? numBooks)  $default,) {final _that = this;
switch (_that) {
case _CollapsedSeries():
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.numBooks);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameIgnorePrefix,  int? numBooks)?  $default,) {final _that = this;
switch (_that) {
case _CollapsedSeries() when $default != null:
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.numBooks);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _CollapsedSeries implements CollapsedSeries {
  const _CollapsedSeries({required this.id, required this.name, required this.nameIgnorePrefix, this.numBooks});
  factory _CollapsedSeries.fromJson(Map<String, dynamic> json) => _$CollapsedSeriesFromJson(json);

@override final  String id;
@override final  String name;
@override final  String nameIgnorePrefix;
@override final  int? numBooks;

/// Create a copy of CollapsedSeries
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$CollapsedSeriesCopyWith<_CollapsedSeries> get copyWith => __$CollapsedSeriesCopyWithImpl<_CollapsedSeries>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$CollapsedSeriesToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _CollapsedSeries&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.numBooks, numBooks) || other.numBooks == numBooks));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameIgnorePrefix,numBooks);

@override
String toString() {
  return 'CollapsedSeries(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, numBooks: $numBooks)';
}


}

/// @nodoc
abstract mixin class _$CollapsedSeriesCopyWith<$Res> implements $CollapsedSeriesCopyWith<$Res> {
  factory _$CollapsedSeriesCopyWith(_CollapsedSeries value, $Res Function(_CollapsedSeries) _then) = __$CollapsedSeriesCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameIgnorePrefix, int? numBooks
});




}
/// @nodoc
class __$CollapsedSeriesCopyWithImpl<$Res>
    implements _$CollapsedSeriesCopyWith<$Res> {
  __$CollapsedSeriesCopyWithImpl(this._self, this._then);

  final _CollapsedSeries _self;
  final $Res Function(_CollapsedSeries) _then;

/// Create a copy of CollapsedSeries
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameIgnorePrefix = null,Object? numBooks = freezed,}) {
  return _then(_CollapsedSeries(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: null == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String,numBooks: freezed == numBooks ? _self.numBooks : numBooks // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
