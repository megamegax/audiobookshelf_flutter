// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryItemResponse {

 DetailedLibraryItem get result; int get total; int? get limit; int? get page; String? get sortBy; bool get sortDesc; String? get filterBy; String get mediaType; bool get minified; bool get collapseseries; String? get include;
/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemResponseCopyWith<LibraryItemResponse> get copyWith => _$LibraryItemResponseCopyWithImpl<LibraryItemResponse>(this as LibraryItemResponse, _$identity);

  /// Serializes this LibraryItemResponse to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemResponse&&(identical(other.result, result) || other.result == result)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDesc, sortDesc) || other.sortDesc == sortDesc)&&(identical(other.filterBy, filterBy) || other.filterBy == filterBy)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.minified, minified) || other.minified == minified)&&(identical(other.collapseseries, collapseseries) || other.collapseseries == collapseseries)&&(identical(other.include, include) || other.include == include));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,total,limit,page,sortBy,sortDesc,filterBy,mediaType,minified,collapseseries,include);

@override
String toString() {
  return 'LibraryItemResponse(result: $result, total: $total, limit: $limit, page: $page, sortBy: $sortBy, sortDesc: $sortDesc, filterBy: $filterBy, mediaType: $mediaType, minified: $minified, collapseseries: $collapseseries, include: $include)';
}


}

/// @nodoc
abstract mixin class $LibraryItemResponseCopyWith<$Res>  {
  factory $LibraryItemResponseCopyWith(LibraryItemResponse value, $Res Function(LibraryItemResponse) _then) = _$LibraryItemResponseCopyWithImpl;
@useResult
$Res call({
 DetailedLibraryItem result, int total, int? limit, int? page, String? sortBy, bool sortDesc, String? filterBy, String mediaType, bool minified, bool collapseseries, String? include
});


$DetailedLibraryItemCopyWith<$Res> get result;

}
/// @nodoc
class _$LibraryItemResponseCopyWithImpl<$Res>
    implements $LibraryItemResponseCopyWith<$Res> {
  _$LibraryItemResponseCopyWithImpl(this._self, this._then);

  final LibraryItemResponse _self;
  final $Res Function(LibraryItemResponse) _then;

/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? result = null,Object? total = null,Object? limit = freezed,Object? page = freezed,Object? sortBy = freezed,Object? sortDesc = null,Object? filterBy = freezed,Object? mediaType = null,Object? minified = null,Object? collapseseries = null,Object? include = freezed,}) {
  return _then(_self.copyWith(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDesc: null == sortDesc ? _self.sortDesc : sortDesc // ignore: cast_nullable_to_non_nullable
as bool,filterBy: freezed == filterBy ? _self.filterBy : filterBy // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,minified: null == minified ? _self.minified : minified // ignore: cast_nullable_to_non_nullable
as bool,collapseseries: null == collapseseries ? _self.collapseseries : collapseseries // ignore: cast_nullable_to_non_nullable
as bool,include: freezed == include ? _self.include : include // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res> get result {
  
  return $DetailedLibraryItemCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}


/// Adds pattern-matching-related methods to [LibraryItemResponse].
extension LibraryItemResponsePatterns on LibraryItemResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItemResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItemResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItemResponse value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItemResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItemResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItemResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DetailedLibraryItem result,  int total,  int? limit,  int? page,  String? sortBy,  bool sortDesc,  String? filterBy,  String mediaType,  bool minified,  bool collapseseries,  String? include)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItemResponse() when $default != null:
return $default(_that.result,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseseries,_that.include);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DetailedLibraryItem result,  int total,  int? limit,  int? page,  String? sortBy,  bool sortDesc,  String? filterBy,  String mediaType,  bool minified,  bool collapseseries,  String? include)  $default,) {final _that = this;
switch (_that) {
case _LibraryItemResponse():
return $default(_that.result,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseseries,_that.include);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DetailedLibraryItem result,  int total,  int? limit,  int? page,  String? sortBy,  bool sortDesc,  String? filterBy,  String mediaType,  bool minified,  bool collapseseries,  String? include)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItemResponse() when $default != null:
return $default(_that.result,_that.total,_that.limit,_that.page,_that.sortBy,_that.sortDesc,_that.filterBy,_that.mediaType,_that.minified,_that.collapseseries,_that.include);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryItemResponse implements LibraryItemResponse {
  const _LibraryItemResponse({required this.result, required this.total, this.limit, this.page, this.sortBy, required this.sortDesc, this.filterBy, required this.mediaType, required this.minified, required this.collapseseries, this.include});
  factory _LibraryItemResponse.fromJson(Map<String, dynamic> json) => _$LibraryItemResponseFromJson(json);

@override final  DetailedLibraryItem result;
@override final  int total;
@override final  int? limit;
@override final  int? page;
@override final  String? sortBy;
@override final  bool sortDesc;
@override final  String? filterBy;
@override final  String mediaType;
@override final  bool minified;
@override final  bool collapseseries;
@override final  String? include;

/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemResponseCopyWith<_LibraryItemResponse> get copyWith => __$LibraryItemResponseCopyWithImpl<_LibraryItemResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemResponseToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItemResponse&&(identical(other.result, result) || other.result == result)&&(identical(other.total, total) || other.total == total)&&(identical(other.limit, limit) || other.limit == limit)&&(identical(other.page, page) || other.page == page)&&(identical(other.sortBy, sortBy) || other.sortBy == sortBy)&&(identical(other.sortDesc, sortDesc) || other.sortDesc == sortDesc)&&(identical(other.filterBy, filterBy) || other.filterBy == filterBy)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.minified, minified) || other.minified == minified)&&(identical(other.collapseseries, collapseseries) || other.collapseseries == collapseseries)&&(identical(other.include, include) || other.include == include));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,result,total,limit,page,sortBy,sortDesc,filterBy,mediaType,minified,collapseseries,include);

@override
String toString() {
  return 'LibraryItemResponse(result: $result, total: $total, limit: $limit, page: $page, sortBy: $sortBy, sortDesc: $sortDesc, filterBy: $filterBy, mediaType: $mediaType, minified: $minified, collapseseries: $collapseseries, include: $include)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemResponseCopyWith<$Res> implements $LibraryItemResponseCopyWith<$Res> {
  factory _$LibraryItemResponseCopyWith(_LibraryItemResponse value, $Res Function(_LibraryItemResponse) _then) = __$LibraryItemResponseCopyWithImpl;
@override @useResult
$Res call({
 DetailedLibraryItem result, int total, int? limit, int? page, String? sortBy, bool sortDesc, String? filterBy, String mediaType, bool minified, bool collapseseries, String? include
});


@override $DetailedLibraryItemCopyWith<$Res> get result;

}
/// @nodoc
class __$LibraryItemResponseCopyWithImpl<$Res>
    implements _$LibraryItemResponseCopyWith<$Res> {
  __$LibraryItemResponseCopyWithImpl(this._self, this._then);

  final _LibraryItemResponse _self;
  final $Res Function(_LibraryItemResponse) _then;

/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? result = null,Object? total = null,Object? limit = freezed,Object? page = freezed,Object? sortBy = freezed,Object? sortDesc = null,Object? filterBy = freezed,Object? mediaType = null,Object? minified = null,Object? collapseseries = null,Object? include = freezed,}) {
  return _then(_LibraryItemResponse(
result: null == result ? _self.result : result // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem,total: null == total ? _self.total : total // ignore: cast_nullable_to_non_nullable
as int,limit: freezed == limit ? _self.limit : limit // ignore: cast_nullable_to_non_nullable
as int?,page: freezed == page ? _self.page : page // ignore: cast_nullable_to_non_nullable
as int?,sortBy: freezed == sortBy ? _self.sortBy : sortBy // ignore: cast_nullable_to_non_nullable
as String?,sortDesc: null == sortDesc ? _self.sortDesc : sortDesc // ignore: cast_nullable_to_non_nullable
as bool,filterBy: freezed == filterBy ? _self.filterBy : filterBy // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,minified: null == minified ? _self.minified : minified // ignore: cast_nullable_to_non_nullable
as bool,collapseseries: null == collapseseries ? _self.collapseseries : collapseseries // ignore: cast_nullable_to_non_nullable
as bool,include: freezed == include ? _self.include : include // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LibraryItemResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res> get result {
  
  return $DetailedLibraryItemCopyWith<$Res>(_self.result, (value) {
    return _then(_self.copyWith(result: value));
  });
}
}

// dart format on
