// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$SeriesItem {

 String get id; String get name; String get nameIgnorePrefix; int get addedAt; int? get updatedAt; String? get description; List<SeriesBook> get books;
/// Create a copy of SeriesItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesItemCopyWith<SeriesItem> get copyWith => _$SeriesItemCopyWithImpl<SeriesItem>(this as SeriesItem, _$identity);

  /// Serializes this SeriesItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other.books, books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameIgnorePrefix,addedAt,updatedAt,description,const DeepCollectionEquality().hash(books));

@override
String toString() {
  return 'SeriesItem(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, addedAt: $addedAt, updatedAt: $updatedAt, description: $description, books: $books)';
}


}

/// @nodoc
abstract mixin class $SeriesItemCopyWith<$Res>  {
  factory $SeriesItemCopyWith(SeriesItem value, $Res Function(SeriesItem) _then) = _$SeriesItemCopyWithImpl;
@useResult
$Res call({
 String id, String name, String nameIgnorePrefix, int addedAt, int? updatedAt, String? description, List<SeriesBook> books
});




}
/// @nodoc
class _$SeriesItemCopyWithImpl<$Res>
    implements $SeriesItemCopyWith<$Res> {
  _$SeriesItemCopyWithImpl(this._self, this._then);

  final SeriesItem _self;
  final $Res Function(SeriesItem) _then;

/// Create a copy of SeriesItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? name = null,Object? nameIgnorePrefix = null,Object? addedAt = null,Object? updatedAt = freezed,Object? description = freezed,Object? books = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: null == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,books: null == books ? _self.books : books // ignore: cast_nullable_to_non_nullable
as List<SeriesBook>,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesItem].
extension SeriesItemPatterns on SeriesItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesItem value)  $default,){
final _that = this;
switch (_that) {
case _SeriesItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesItem value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String name,  String nameIgnorePrefix,  int addedAt,  int? updatedAt,  String? description,  List<SeriesBook> books)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesItem() when $default != null:
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.addedAt,_that.updatedAt,_that.description,_that.books);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String name,  String nameIgnorePrefix,  int addedAt,  int? updatedAt,  String? description,  List<SeriesBook> books)  $default,) {final _that = this;
switch (_that) {
case _SeriesItem():
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.addedAt,_that.updatedAt,_that.description,_that.books);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String name,  String nameIgnorePrefix,  int addedAt,  int? updatedAt,  String? description,  List<SeriesBook> books)?  $default,) {final _that = this;
switch (_that) {
case _SeriesItem() when $default != null:
return $default(_that.id,_that.name,_that.nameIgnorePrefix,_that.addedAt,_that.updatedAt,_that.description,_that.books);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesItem implements SeriesItem {
  const _SeriesItem({required this.id, required this.name, required this.nameIgnorePrefix, required this.addedAt, this.updatedAt, this.description, required final  List<SeriesBook> books}): _books = books;
  factory _SeriesItem.fromJson(Map<String, dynamic> json) => _$SeriesItemFromJson(json);

@override final  String id;
@override final  String name;
@override final  String nameIgnorePrefix;
@override final  int addedAt;
@override final  int? updatedAt;
@override final  String? description;
 final  List<SeriesBook> _books;
@override List<SeriesBook> get books {
  if (_books is EqualUnmodifiableListView) return _books;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_books);
}


/// Create a copy of SeriesItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesItemCopyWith<_SeriesItem> get copyWith => __$SeriesItemCopyWithImpl<_SeriesItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesItem&&(identical(other.id, id) || other.id == id)&&(identical(other.name, name) || other.name == name)&&(identical(other.nameIgnorePrefix, nameIgnorePrefix) || other.nameIgnorePrefix == nameIgnorePrefix)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.description, description) || other.description == description)&&const DeepCollectionEquality().equals(other._books, _books));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,name,nameIgnorePrefix,addedAt,updatedAt,description,const DeepCollectionEquality().hash(_books));

@override
String toString() {
  return 'SeriesItem(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, addedAt: $addedAt, updatedAt: $updatedAt, description: $description, books: $books)';
}


}

/// @nodoc
abstract mixin class _$SeriesItemCopyWith<$Res> implements $SeriesItemCopyWith<$Res> {
  factory _$SeriesItemCopyWith(_SeriesItem value, $Res Function(_SeriesItem) _then) = __$SeriesItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String name, String nameIgnorePrefix, int addedAt, int? updatedAt, String? description, List<SeriesBook> books
});




}
/// @nodoc
class __$SeriesItemCopyWithImpl<$Res>
    implements _$SeriesItemCopyWith<$Res> {
  __$SeriesItemCopyWithImpl(this._self, this._then);

  final _SeriesItem _self;
  final $Res Function(_SeriesItem) _then;

/// Create a copy of SeriesItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? name = null,Object? nameIgnorePrefix = null,Object? addedAt = null,Object? updatedAt = freezed,Object? description = freezed,Object? books = null,}) {
  return _then(_SeriesItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,name: null == name ? _self.name : name // ignore: cast_nullable_to_non_nullable
as String,nameIgnorePrefix: null == nameIgnorePrefix ? _self.nameIgnorePrefix : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,books: null == books ? _self._books : books // ignore: cast_nullable_to_non_nullable
as List<SeriesBook>,
  ));
}


}


/// @nodoc
mixin _$SeriesBook {

 String get id;
/// Create a copy of SeriesBook
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SeriesBookCopyWith<SeriesBook> get copyWith => _$SeriesBookCopyWithImpl<SeriesBook>(this as SeriesBook, _$identity);

  /// Serializes this SeriesBook to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SeriesBook&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SeriesBook(id: $id)';
}


}

/// @nodoc
abstract mixin class $SeriesBookCopyWith<$Res>  {
  factory $SeriesBookCopyWith(SeriesBook value, $Res Function(SeriesBook) _then) = _$SeriesBookCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$SeriesBookCopyWithImpl<$Res>
    implements $SeriesBookCopyWith<$Res> {
  _$SeriesBookCopyWithImpl(this._self, this._then);

  final SeriesBook _self;
  final $Res Function(SeriesBook) _then;

/// Create a copy of SeriesBook
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [SeriesBook].
extension SeriesBookPatterns on SeriesBook {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SeriesBook value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SeriesBook() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SeriesBook value)  $default,){
final _that = this;
switch (_that) {
case _SeriesBook():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SeriesBook value)?  $default,){
final _that = this;
switch (_that) {
case _SeriesBook() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SeriesBook() when $default != null:
return $default(_that.id);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id)  $default,) {final _that = this;
switch (_that) {
case _SeriesBook():
return $default(_that.id);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id)?  $default,) {final _that = this;
switch (_that) {
case _SeriesBook() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _SeriesBook implements SeriesBook {
  const _SeriesBook({required this.id});
  factory _SeriesBook.fromJson(Map<String, dynamic> json) => _$SeriesBookFromJson(json);

@override final  String id;

/// Create a copy of SeriesBook
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SeriesBookCopyWith<_SeriesBook> get copyWith => __$SeriesBookCopyWithImpl<_SeriesBook>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$SeriesBookToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SeriesBook&&(identical(other.id, id) || other.id == id));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'SeriesBook(id: $id)';
}


}

/// @nodoc
abstract mixin class _$SeriesBookCopyWith<$Res> implements $SeriesBookCopyWith<$Res> {
  factory _$SeriesBookCopyWith(_SeriesBook value, $Res Function(_SeriesBook) _then) = __$SeriesBookCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$SeriesBookCopyWithImpl<$Res>
    implements _$SeriesBookCopyWith<$Res> {
  __$SeriesBookCopyWithImpl(this._self, this._then);

  final _SeriesBook _self;
  final $Res Function(_SeriesBook) _then;

/// Create a copy of SeriesBook
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_SeriesBook(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
