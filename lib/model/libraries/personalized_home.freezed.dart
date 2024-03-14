// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'personalized_home.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PersonalizedHome _$PersonalizedHomeFromJson(Map<String, dynamic> json) {
  return _PersonalizedHome.fromJson(json);
}

/// @nodoc
mixin _$PersonalizedHome {
  SectionType get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<PersonalizedEntity> get entities => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalizedHomeCopyWith<PersonalizedHome> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizedHomeCopyWith<$Res> {
  factory $PersonalizedHomeCopyWith(
          PersonalizedHome value, $Res Function(PersonalizedHome) then) =
      _$PersonalizedHomeCopyWithImpl<$Res, PersonalizedHome>;
  @useResult
  $Res call({SectionType id, String type, List<PersonalizedEntity> entities});
}

/// @nodoc
class _$PersonalizedHomeCopyWithImpl<$Res, $Val extends PersonalizedHome>
    implements $PersonalizedHomeCopyWith<$Res> {
  _$PersonalizedHomeCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SectionType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<PersonalizedEntity>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizedHomeImplCopyWith<$Res>
    implements $PersonalizedHomeCopyWith<$Res> {
  factory _$$PersonalizedHomeImplCopyWith(_$PersonalizedHomeImpl value,
          $Res Function(_$PersonalizedHomeImpl) then) =
      __$$PersonalizedHomeImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SectionType id, String type, List<PersonalizedEntity> entities});
}

/// @nodoc
class __$$PersonalizedHomeImplCopyWithImpl<$Res>
    extends _$PersonalizedHomeCopyWithImpl<$Res, _$PersonalizedHomeImpl>
    implements _$$PersonalizedHomeImplCopyWith<$Res> {
  __$$PersonalizedHomeImplCopyWithImpl(_$PersonalizedHomeImpl _value,
      $Res Function(_$PersonalizedHomeImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$PersonalizedHomeImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SectionType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<PersonalizedEntity>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizedHomeImpl implements _PersonalizedHome {
  const _$PersonalizedHomeImpl(
      {required this.id,
      required this.type,
      required final List<PersonalizedEntity> entities})
      : _entities = entities;

  factory _$PersonalizedHomeImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizedHomeImplFromJson(json);

  @override
  final SectionType id;
  @override
  final String type;
  final List<PersonalizedEntity> _entities;
  @override
  List<PersonalizedEntity> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'PersonalizedHome(id: $id, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizedHomeImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizedHomeImplCopyWith<_$PersonalizedHomeImpl> get copyWith =>
      __$$PersonalizedHomeImplCopyWithImpl<_$PersonalizedHomeImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizedHomeImplToJson(
      this,
    );
  }
}

abstract class _PersonalizedHome implements PersonalizedHome {
  const factory _PersonalizedHome(
          {required final SectionType id,
          required final String type,
          required final List<PersonalizedEntity> entities}) =
      _$PersonalizedHomeImpl;

  factory _PersonalizedHome.fromJson(Map<String, dynamic> json) =
      _$PersonalizedHomeImpl.fromJson;

  @override
  SectionType get id;
  @override
  String get type;
  @override
  List<PersonalizedEntity> get entities;
  @override
  @JsonKey(ignore: true)
  _$$PersonalizedHomeImplCopyWith<_$PersonalizedHomeImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
mixin _$PersonalizedHomeEntity {
  SectionType get id => throw _privateConstructorUsedError;
  String get type => throw _privateConstructorUsedError;
  List<dynamic> get entities => throw _privateConstructorUsedError;

  @JsonKey(ignore: true)
  $PersonalizedHomeEntityCopyWith<PersonalizedHomeEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizedHomeEntityCopyWith<$Res> {
  factory $PersonalizedHomeEntityCopyWith(PersonalizedHomeEntity value,
          $Res Function(PersonalizedHomeEntity) then) =
      _$PersonalizedHomeEntityCopyWithImpl<$Res, PersonalizedHomeEntity>;
  @useResult
  $Res call({SectionType id, String type, List<dynamic> entities});
}

/// @nodoc
class _$PersonalizedHomeEntityCopyWithImpl<$Res,
        $Val extends PersonalizedHomeEntity>
    implements $PersonalizedHomeEntityCopyWith<$Res> {
  _$PersonalizedHomeEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SectionType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value.entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizedHomeEntityImplCopyWith<$Res>
    implements $PersonalizedHomeEntityCopyWith<$Res> {
  factory _$$PersonalizedHomeEntityImplCopyWith(
          _$PersonalizedHomeEntityImpl value,
          $Res Function(_$PersonalizedHomeEntityImpl) then) =
      __$$PersonalizedHomeEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({SectionType id, String type, List<dynamic> entities});
}

/// @nodoc
class __$$PersonalizedHomeEntityImplCopyWithImpl<$Res>
    extends _$PersonalizedHomeEntityCopyWithImpl<$Res,
        _$PersonalizedHomeEntityImpl>
    implements _$$PersonalizedHomeEntityImplCopyWith<$Res> {
  __$$PersonalizedHomeEntityImplCopyWithImpl(
      _$PersonalizedHomeEntityImpl _value,
      $Res Function(_$PersonalizedHomeEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? type = null,
    Object? entities = null,
  }) {
    return _then(_$PersonalizedHomeEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as SectionType,
      type: null == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String,
      entities: null == entities
          ? _value._entities
          : entities // ignore: cast_nullable_to_non_nullable
              as List<dynamic>,
    ));
  }
}

/// @nodoc

class _$PersonalizedHomeEntityImpl implements _PersonalizedHomeEntity {
  const _$PersonalizedHomeEntityImpl(
      {required this.id,
      required this.type,
      required final List<dynamic> entities})
      : _entities = entities;

  @override
  final SectionType id;
  @override
  final String type;
  final List<dynamic> _entities;
  @override
  List<dynamic> get entities {
    if (_entities is EqualUnmodifiableListView) return _entities;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_entities);
  }

  @override
  String toString() {
    return 'PersonalizedHomeEntity(id: $id, type: $type, entities: $entities)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizedHomeEntityImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.type, type) || other.type == type) &&
            const DeepCollectionEquality().equals(other._entities, _entities));
  }

  @override
  int get hashCode => Object.hash(
      runtimeType, id, type, const DeepCollectionEquality().hash(_entities));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizedHomeEntityImplCopyWith<_$PersonalizedHomeEntityImpl>
      get copyWith => __$$PersonalizedHomeEntityImplCopyWithImpl<
          _$PersonalizedHomeEntityImpl>(this, _$identity);
}

abstract class _PersonalizedHomeEntity implements PersonalizedHomeEntity {
  const factory _PersonalizedHomeEntity(
      {required final SectionType id,
      required final String type,
      required final List<dynamic> entities}) = _$PersonalizedHomeEntityImpl;

  @override
  SectionType get id;
  @override
  String get type;
  @override
  List<dynamic> get entities;
  @override
  @JsonKey(ignore: true)
  _$$PersonalizedHomeEntityImplCopyWith<_$PersonalizedHomeEntityImpl>
      get copyWith => throw _privateConstructorUsedError;
}

PersonalizedEntity _$PersonalizedEntityFromJson(Map<String, dynamic> json) {
  return _PersonalizedEntity.fromJson(json);
}

/// @nodoc
mixin _$PersonalizedEntity {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PersonalizedEntityCopyWith<PersonalizedEntity> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PersonalizedEntityCopyWith<$Res> {
  factory $PersonalizedEntityCopyWith(
          PersonalizedEntity value, $Res Function(PersonalizedEntity) then) =
      _$PersonalizedEntityCopyWithImpl<$Res, PersonalizedEntity>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$PersonalizedEntityCopyWithImpl<$Res, $Val extends PersonalizedEntity>
    implements $PersonalizedEntityCopyWith<$Res> {
  _$PersonalizedEntityCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$PersonalizedEntityImplCopyWith<$Res>
    implements $PersonalizedEntityCopyWith<$Res> {
  factory _$$PersonalizedEntityImplCopyWith(_$PersonalizedEntityImpl value,
          $Res Function(_$PersonalizedEntityImpl) then) =
      __$$PersonalizedEntityImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$PersonalizedEntityImplCopyWithImpl<$Res>
    extends _$PersonalizedEntityCopyWithImpl<$Res, _$PersonalizedEntityImpl>
    implements _$$PersonalizedEntityImplCopyWith<$Res> {
  __$$PersonalizedEntityImplCopyWithImpl(_$PersonalizedEntityImpl _value,
      $Res Function(_$PersonalizedEntityImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$PersonalizedEntityImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PersonalizedEntityImpl implements _PersonalizedEntity {
  const _$PersonalizedEntityImpl({required this.id});

  factory _$PersonalizedEntityImpl.fromJson(Map<String, dynamic> json) =>
      _$$PersonalizedEntityImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'PersonalizedEntity(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PersonalizedEntityImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PersonalizedEntityImplCopyWith<_$PersonalizedEntityImpl> get copyWith =>
      __$$PersonalizedEntityImplCopyWithImpl<_$PersonalizedEntityImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PersonalizedEntityImplToJson(
      this,
    );
  }
}

abstract class _PersonalizedEntity implements PersonalizedEntity {
  const factory _PersonalizedEntity({required final String id}) =
      _$PersonalizedEntityImpl;

  factory _PersonalizedEntity.fromJson(Map<String, dynamic> json) =
      _$PersonalizedEntityImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$PersonalizedEntityImplCopyWith<_$PersonalizedEntityImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
