// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'collapsed_series.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

CollapsedSeries _$CollapsedSeriesFromJson(Map<String, dynamic> json) {
  return _CollapsedSeries.fromJson(json);
}

/// @nodoc
mixin _$CollapsedSeries {
  String get id => throw _privateConstructorUsedError;
  String get name => throw _privateConstructorUsedError;
  String get nameIgnorePrefix => throw _privateConstructorUsedError;
  int get numBooks => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $CollapsedSeriesCopyWith<CollapsedSeries> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $CollapsedSeriesCopyWith<$Res> {
  factory $CollapsedSeriesCopyWith(
          CollapsedSeries value, $Res Function(CollapsedSeries) then) =
      _$CollapsedSeriesCopyWithImpl<$Res, CollapsedSeries>;
  @useResult
  $Res call({String id, String name, String nameIgnorePrefix, int numBooks});
}

/// @nodoc
class _$CollapsedSeriesCopyWithImpl<$Res, $Val extends CollapsedSeries>
    implements $CollapsedSeriesCopyWith<$Res> {
  _$CollapsedSeriesCopyWithImpl(this._value, this._then);

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
    Object? numBooks = null,
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
      numBooks: null == numBooks
          ? _value.numBooks
          : numBooks // ignore: cast_nullable_to_non_nullable
              as int,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$CollapsedSeriesImplCopyWith<$Res>
    implements $CollapsedSeriesCopyWith<$Res> {
  factory _$$CollapsedSeriesImplCopyWith(_$CollapsedSeriesImpl value,
          $Res Function(_$CollapsedSeriesImpl) then) =
      __$$CollapsedSeriesImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String id, String name, String nameIgnorePrefix, int numBooks});
}

/// @nodoc
class __$$CollapsedSeriesImplCopyWithImpl<$Res>
    extends _$CollapsedSeriesCopyWithImpl<$Res, _$CollapsedSeriesImpl>
    implements _$$CollapsedSeriesImplCopyWith<$Res> {
  __$$CollapsedSeriesImplCopyWithImpl(
      _$CollapsedSeriesImpl _value, $Res Function(_$CollapsedSeriesImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? name = null,
    Object? nameIgnorePrefix = null,
    Object? numBooks = null,
  }) {
    return _then(_$CollapsedSeriesImpl(
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
      numBooks: null == numBooks
          ? _value.numBooks
          : numBooks // ignore: cast_nullable_to_non_nullable
              as int,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$CollapsedSeriesImpl implements _CollapsedSeries {
  const _$CollapsedSeriesImpl(
      {required this.id,
      required this.name,
      required this.nameIgnorePrefix,
      required this.numBooks});

  factory _$CollapsedSeriesImpl.fromJson(Map<String, dynamic> json) =>
      _$$CollapsedSeriesImplFromJson(json);

  @override
  final String id;
  @override
  final String name;
  @override
  final String nameIgnorePrefix;
  @override
  final int numBooks;

  @override
  String toString() {
    return 'CollapsedSeries(id: $id, name: $name, nameIgnorePrefix: $nameIgnorePrefix, numBooks: $numBooks)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$CollapsedSeriesImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.name, name) || other.name == name) &&
            (identical(other.nameIgnorePrefix, nameIgnorePrefix) ||
                other.nameIgnorePrefix == nameIgnorePrefix) &&
            (identical(other.numBooks, numBooks) ||
                other.numBooks == numBooks));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, id, name, nameIgnorePrefix, numBooks);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$CollapsedSeriesImplCopyWith<_$CollapsedSeriesImpl> get copyWith =>
      __$$CollapsedSeriesImplCopyWithImpl<_$CollapsedSeriesImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$CollapsedSeriesImplToJson(
      this,
    );
  }
}

abstract class _CollapsedSeries implements CollapsedSeries {
  const factory _CollapsedSeries(
      {required final String id,
      required final String name,
      required final String nameIgnorePrefix,
      required final int numBooks}) = _$CollapsedSeriesImpl;

  factory _CollapsedSeries.fromJson(Map<String, dynamic> json) =
      _$CollapsedSeriesImpl.fromJson;

  @override
  String get id;
  @override
  String get name;
  @override
  String get nameIgnorePrefix;
  @override
  int get numBooks;
  @override
  @JsonKey(ignore: true)
  _$$CollapsedSeriesImplCopyWith<_$CollapsedSeriesImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
