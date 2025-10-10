// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalized_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$PersonalizedHome {

 SectionType get id; String get type; List<PersonalizedEntity> get entities;
/// Create a copy of PersonalizedHome
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalizedHomeCopyWith<PersonalizedHome> get copyWith => _$PersonalizedHomeCopyWithImpl<PersonalizedHome>(this as PersonalizedHome, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalizedHome&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.entities, entities));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(entities));

@override
String toString() {
  return 'PersonalizedHome(id: $id, type: $type, entities: $entities)';
}


}

/// @nodoc
abstract mixin class $PersonalizedHomeCopyWith<$Res>  {
  factory $PersonalizedHomeCopyWith(PersonalizedHome value, $Res Function(PersonalizedHome) _then) = _$PersonalizedHomeCopyWithImpl;
@useResult
$Res call({
 SectionType id, String type, List<PersonalizedEntity> entities
});




}
/// @nodoc
class _$PersonalizedHomeCopyWithImpl<$Res>
    implements $PersonalizedHomeCopyWith<$Res> {
  _$PersonalizedHomeCopyWithImpl(this._self, this._then);

  final PersonalizedHome _self;
  final $Res Function(PersonalizedHome) _then;

/// Create a copy of PersonalizedHome
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? entities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<PersonalizedEntity>,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalizedHome].
extension PersonalizedHomePatterns on PersonalizedHome {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalizedHome value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalizedHome() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalizedHome value)  $default,){
final _that = this;
switch (_that) {
case _PersonalizedHome():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalizedHome value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalizedHome() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionType id,  String type,  List<PersonalizedEntity> entities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalizedHome() when $default != null:
return $default(_that.id,_that.type,_that.entities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionType id,  String type,  List<PersonalizedEntity> entities)  $default,) {final _that = this;
switch (_that) {
case _PersonalizedHome():
return $default(_that.id,_that.type,_that.entities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionType id,  String type,  List<PersonalizedEntity> entities)?  $default,) {final _that = this;
switch (_that) {
case _PersonalizedHome() when $default != null:
return $default(_that.id,_that.type,_that.entities);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalizedHome implements PersonalizedHome {
  const _PersonalizedHome({required this.id, required this.type, required final  List<PersonalizedEntity> entities}): _entities = entities;
  

@override final  SectionType id;
@override final  String type;
 final  List<PersonalizedEntity> _entities;
@override List<PersonalizedEntity> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}


/// Create a copy of PersonalizedHome
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalizedHomeCopyWith<_PersonalizedHome> get copyWith => __$PersonalizedHomeCopyWithImpl<_PersonalizedHome>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalizedHome&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entities, _entities));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(_entities));

@override
String toString() {
  return 'PersonalizedHome(id: $id, type: $type, entities: $entities)';
}


}

/// @nodoc
abstract mixin class _$PersonalizedHomeCopyWith<$Res> implements $PersonalizedHomeCopyWith<$Res> {
  factory _$PersonalizedHomeCopyWith(_PersonalizedHome value, $Res Function(_PersonalizedHome) _then) = __$PersonalizedHomeCopyWithImpl;
@override @useResult
$Res call({
 SectionType id, String type, List<PersonalizedEntity> entities
});




}
/// @nodoc
class __$PersonalizedHomeCopyWithImpl<$Res>
    implements _$PersonalizedHomeCopyWith<$Res> {
  __$PersonalizedHomeCopyWithImpl(this._self, this._then);

  final _PersonalizedHome _self;
  final $Res Function(_PersonalizedHome) _then;

/// Create a copy of PersonalizedHome
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? entities = null,}) {
  return _then(_PersonalizedHome(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<PersonalizedEntity>,
  ));
}


}

/// @nodoc
mixin _$PersonalizedHomeEntity {

 SectionType get id; String get type; List<dynamic> get entities;
/// Create a copy of PersonalizedHomeEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalizedHomeEntityCopyWith<PersonalizedHomeEntity> get copyWith => _$PersonalizedHomeEntityCopyWithImpl<PersonalizedHomeEntity>(this as PersonalizedHomeEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalizedHomeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other.entities, entities));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(entities));

@override
String toString() {
  return 'PersonalizedHomeEntity(id: $id, type: $type, entities: $entities)';
}


}

/// @nodoc
abstract mixin class $PersonalizedHomeEntityCopyWith<$Res>  {
  factory $PersonalizedHomeEntityCopyWith(PersonalizedHomeEntity value, $Res Function(PersonalizedHomeEntity) _then) = _$PersonalizedHomeEntityCopyWithImpl;
@useResult
$Res call({
 SectionType id, String type, List<dynamic> entities
});




}
/// @nodoc
class _$PersonalizedHomeEntityCopyWithImpl<$Res>
    implements $PersonalizedHomeEntityCopyWith<$Res> {
  _$PersonalizedHomeEntityCopyWithImpl(this._self, this._then);

  final PersonalizedHomeEntity _self;
  final $Res Function(PersonalizedHomeEntity) _then;

/// Create a copy of PersonalizedHomeEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? type = null,Object? entities = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self.entities : entities // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalizedHomeEntity].
extension PersonalizedHomeEntityPatterns on PersonalizedHomeEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalizedHomeEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalizedHomeEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalizedHomeEntity value)  $default,){
final _that = this;
switch (_that) {
case _PersonalizedHomeEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalizedHomeEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalizedHomeEntity() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( SectionType id,  String type,  List<dynamic> entities)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PersonalizedHomeEntity() when $default != null:
return $default(_that.id,_that.type,_that.entities);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( SectionType id,  String type,  List<dynamic> entities)  $default,) {final _that = this;
switch (_that) {
case _PersonalizedHomeEntity():
return $default(_that.id,_that.type,_that.entities);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( SectionType id,  String type,  List<dynamic> entities)?  $default,) {final _that = this;
switch (_that) {
case _PersonalizedHomeEntity() when $default != null:
return $default(_that.id,_that.type,_that.entities);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalizedHomeEntity implements PersonalizedHomeEntity {
  const _PersonalizedHomeEntity({required this.id, required this.type, required final  List<dynamic> entities}): _entities = entities;
  

@override final  SectionType id;
@override final  String type;
 final  List<dynamic> _entities;
@override List<dynamic> get entities {
  if (_entities is EqualUnmodifiableListView) return _entities;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_entities);
}


/// Create a copy of PersonalizedHomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalizedHomeEntityCopyWith<_PersonalizedHomeEntity> get copyWith => __$PersonalizedHomeEntityCopyWithImpl<_PersonalizedHomeEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalizedHomeEntity&&(identical(other.id, id) || other.id == id)&&(identical(other.type, type) || other.type == type)&&const DeepCollectionEquality().equals(other._entities, _entities));
}


@override
int get hashCode => Object.hash(runtimeType,id,type,const DeepCollectionEquality().hash(_entities));

@override
String toString() {
  return 'PersonalizedHomeEntity(id: $id, type: $type, entities: $entities)';
}


}

/// @nodoc
abstract mixin class _$PersonalizedHomeEntityCopyWith<$Res> implements $PersonalizedHomeEntityCopyWith<$Res> {
  factory _$PersonalizedHomeEntityCopyWith(_PersonalizedHomeEntity value, $Res Function(_PersonalizedHomeEntity) _then) = __$PersonalizedHomeEntityCopyWithImpl;
@override @useResult
$Res call({
 SectionType id, String type, List<dynamic> entities
});




}
/// @nodoc
class __$PersonalizedHomeEntityCopyWithImpl<$Res>
    implements _$PersonalizedHomeEntityCopyWith<$Res> {
  __$PersonalizedHomeEntityCopyWithImpl(this._self, this._then);

  final _PersonalizedHomeEntity _self;
  final $Res Function(_PersonalizedHomeEntity) _then;

/// Create a copy of PersonalizedHomeEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? type = null,Object? entities = null,}) {
  return _then(_PersonalizedHomeEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as SectionType,type: null == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String,entities: null == entities ? _self._entities : entities // ignore: cast_nullable_to_non_nullable
as List<dynamic>,
  ));
}


}

/// @nodoc
mixin _$PersonalizedEntity {

 String get id;
/// Create a copy of PersonalizedEntity
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PersonalizedEntityCopyWith<PersonalizedEntity> get copyWith => _$PersonalizedEntityCopyWithImpl<PersonalizedEntity>(this as PersonalizedEntity, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PersonalizedEntity&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PersonalizedEntity(id: $id)';
}


}

/// @nodoc
abstract mixin class $PersonalizedEntityCopyWith<$Res>  {
  factory $PersonalizedEntityCopyWith(PersonalizedEntity value, $Res Function(PersonalizedEntity) _then) = _$PersonalizedEntityCopyWithImpl;
@useResult
$Res call({
 String id
});




}
/// @nodoc
class _$PersonalizedEntityCopyWithImpl<$Res>
    implements $PersonalizedEntityCopyWith<$Res> {
  _$PersonalizedEntityCopyWithImpl(this._self, this._then);

  final PersonalizedEntity _self;
  final $Res Function(PersonalizedEntity) _then;

/// Create a copy of PersonalizedEntity
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

}


/// Adds pattern-matching-related methods to [PersonalizedEntity].
extension PersonalizedEntityPatterns on PersonalizedEntity {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PersonalizedEntity value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PersonalizedEntity() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PersonalizedEntity value)  $default,){
final _that = this;
switch (_that) {
case _PersonalizedEntity():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PersonalizedEntity value)?  $default,){
final _that = this;
switch (_that) {
case _PersonalizedEntity() when $default != null:
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
case _PersonalizedEntity() when $default != null:
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
case _PersonalizedEntity():
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
case _PersonalizedEntity() when $default != null:
return $default(_that.id);case _:
  return null;

}
}

}

/// @nodoc


class _PersonalizedEntity implements PersonalizedEntity {
  const _PersonalizedEntity({required this.id});
  

@override final  String id;

/// Create a copy of PersonalizedEntity
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PersonalizedEntityCopyWith<_PersonalizedEntity> get copyWith => __$PersonalizedEntityCopyWithImpl<_PersonalizedEntity>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PersonalizedEntity&&(identical(other.id, id) || other.id == id));
}


@override
int get hashCode => Object.hash(runtimeType,id);

@override
String toString() {
  return 'PersonalizedEntity(id: $id)';
}


}

/// @nodoc
abstract mixin class _$PersonalizedEntityCopyWith<$Res> implements $PersonalizedEntityCopyWith<$Res> {
  factory _$PersonalizedEntityCopyWith(_PersonalizedEntity value, $Res Function(_PersonalizedEntity) _then) = __$PersonalizedEntityCopyWithImpl;
@override @useResult
$Res call({
 String id
});




}
/// @nodoc
class __$PersonalizedEntityCopyWithImpl<$Res>
    implements _$PersonalizedEntityCopyWith<$Res> {
  __$PersonalizedEntityCopyWithImpl(this._self, this._then);

  final _PersonalizedEntity _self;
  final $Res Function(_PersonalizedEntity) _then;

/// Create a copy of PersonalizedEntity
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,}) {
  return _then(_PersonalizedEntity(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,
  ));
}


}

// dart format on
