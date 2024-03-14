// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'series_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

SeriesItem _$SeriesItemFromJson(Map<String, dynamic> json) {
  return _SeriesItem.fromJson(json);
}

/// @nodoc
mixin _$SeriesItem {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameIgnorePrefix => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  String? get description => throw _privateConstructorUsedError;
  List<SeriesBook> get books => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesItemCopyWith<SeriesItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesItemCopyWith<$Res> {
  factory $SeriesItemCopyWith(
          SeriesItem value, $Res Function(SeriesItem) then) =
      _$SeriesItemCopyWithImpl<$Res, SeriesItem>;
  @useResult
  $Res call(
      {String id,
      String name,
      String nameIgnorePrefix,
      int addedAt,
      int? updatedAt,
      String? description,
      List<SeriesBook> books});
}

/// @nodoc
class _$SeriesItemCopyWithImpl<$Res, $Val extends SeriesItem>
    implements $SeriesItemCopyWith<$Res> {
  _$SeriesItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? books = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefix: null == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value.books
          : books // ignore: cast_nullable_to_non_nullable
              as List<SeriesBook>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$SeriesItemImplCopyWith<$Res>
    implements $SeriesItemCopyWith<$Res> {
  factory _$$SeriesItemImplCopyWith(
          _$SeriesItemImpl value, $Res Function(_$SeriesItemImpl) then) =
      __$$SeriesItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String name,
      String nameIgnorePrefix,
      int addedAt,
      int? updatedAt,
      String? description,
      List<SeriesBook> books});
}

/// @nodoc
class __$$SeriesItemImplCopyWithImpl<$Res>
    extends _$SeriesItemCopyWithImpl<$Res, _$SeriesItemImpl>
    implements _$$SeriesItemImplCopyWith<$Res> {
  __$$SeriesItemImplCopyWithImpl(
      _$SeriesItemImpl _value, $Res Function(_$SeriesItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
    Object? description = freezed,
    Object? books = null,
  }) {
    return _then(_$SeriesItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      name: null == name
          ? _value.name
          : name // ignore: cast_nullable_to_non_nullable
              as String,
      nameIgnorePrefix: null == nameIgnorePrefix
          ? _value.nameIgnorePrefix
          : nameIgnorePrefix // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      description: freezed == description
          ? _value.description
          : description // ignore: cast_nullable_to_non_nullable
              as String?,
      books: null == books
          ? _value._books
          : books // ignore: cast_nullable_to_non_nullable
              as List<SeriesBook>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesItemImpl implements _SeriesItem {
  const _$SeriesItemImpl(
      {required this.id,
      required this.name,
      required this.nameIgnorePrefix,
      required this.addedAt,
      this.updatedAt,
      this.description,
      required final List<SeriesBook> books})
      : _books = books;

  factory _$SeriesItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesItemImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameIgnorePrefix;
  @override
  final int addedAt;
  @override
  final int? updatedAt;
  @override
  final String? description;
  final List<SeriesBook> _books;
  @override
  List<SeriesBook> get books {
    if (_books is EqualUnmodifiableListView) return _books;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_books);
  }

  @override
  String toString() {
    return 'SeriesItem(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, addedAt: $addedAt, updatedAt: $updatedAt, description: $description, books: $books)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameIgnorePrefix, nameIgnorePrefix) ||
                other.nameIgnorePrefix == nameIgnorePrefix) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.description, description) ||
                other.description == description) &&
            const DeepCollectionEquality().equals(other._books, _books));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      name,
      nameIgnorePrefix,
      addedAt,
      updatedAt,
      description,
      const DeepCollectionEquality().hash(_books));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesItemImplCopyWith<_$SeriesItemImpl> get copyWith =>
      __$$SeriesItemImplCopyWithImpl<_$SeriesItemImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesItemImplToJson(
      this,
    );
  }
}

abstract class _SeriesItem implements SeriesItem {
  const factory _SeriesItem(
      {required final String id,
      required final String name,
      required final String nameIgnorePrefix,
      required final int addedAt,
      final int? updatedAt,
      final String? description,
      required final List<SeriesBook> books}) = _$SeriesItemImpl;

  factory _SeriesItem.fromJson(Map<String, dynamic> json) =
      _$SeriesItemImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameIgnorePrefix;
  @override
  int get addedAt;
  @override
  int? get updatedAt;
  @override
  String? get description;
  @override
  List<SeriesBook> get books;
  @override
  @JsonKey(ignore: true)
  _$$SeriesItemImplCopyWith<_$SeriesItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

SeriesBook _$SeriesBookFromJson(Map<String, dynamic> json) {
  return _SeriesBook.fromJson(json);
}

/// @nodoc
mixin _$SeriesBook {
  String get id => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $SeriesBookCopyWith<SeriesBook> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $SeriesBookCopyWith<$Res> {
  factory $SeriesBookCopyWith(
          SeriesBook value, $Res Function(SeriesBook) then) =
      _$SeriesBookCopyWithImpl<$Res, SeriesBook>;
  @useResult
  $Res call({String id});
}

/// @nodoc
class _$SeriesBookCopyWithImpl<$Res, $Val extends SeriesBook>
    implements $SeriesBookCopyWith<$Res> {
  _$SeriesBookCopyWithImpl(this._value, this._then);

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
abstract class _$$SeriesBookImplCopyWith<$Res>
    implements $SeriesBookCopyWith<$Res> {
  factory _$$SeriesBookImplCopyWith(
          _$SeriesBookImpl value, $Res Function(_$SeriesBookImpl) then) =
      __$$SeriesBookImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id});
}

/// @nodoc
class __$$SeriesBookImplCopyWithImpl<$Res>
    extends _$SeriesBookCopyWithImpl<$Res, _$SeriesBookImpl>
    implements _$$SeriesBookImplCopyWith<$Res> {
  __$$SeriesBookImplCopyWithImpl(
      _$SeriesBookImpl _value, $Res Function(_$SeriesBookImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
  }) {
    return _then(_$SeriesBookImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$SeriesBookImpl implements _SeriesBook {
  const _$SeriesBookImpl({required this.id});

  factory _$SeriesBookImpl.fromJson(Map<String, dynamic> json) =>
      _$$SeriesBookImplFromJson(json);

  @override
  final String id;

  @override
  String toString() {
    return 'SeriesBook(id: $id)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$SeriesBookImpl &&
            (identical(other.id, id) || other.id == id));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$SeriesBookImplCopyWith<_$SeriesBookImpl> get copyWith =>
      __$$SeriesBookImplCopyWithImpl<_$SeriesBookImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$SeriesBookImplToJson(
      this,
    );
  }
}

abstract class _SeriesBook implements SeriesBook {
  const factory _SeriesBook({required final String id}) = _$SeriesBookImpl;

  factory _SeriesBook.fromJson(Map<String, dynamic> json) =
      _$SeriesBookImpl.fromJson;

  @override
  String get id;
  @override
  @JsonKey(ignore: true)
  _$$SeriesBookImplCopyWith<_$SeriesBookImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
