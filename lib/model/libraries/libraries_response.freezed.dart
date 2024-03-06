// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'libraries_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LibrariesResponse _$LibrariesResponseFromJson(Map<String, dynamic> json) {
  return _LibrariesResponse.fromJson(json);
}

/// @nodoc
mixin _$LibrariesResponse {
  List<Library> get libraries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LibrariesResponseCopyWith<LibrariesResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibrariesResponseCopyWith<$Res> {
  factory $LibrariesResponseCopyWith(
          LibrariesResponse value, $Res Function(LibrariesResponse) then) =
      _$LibrariesResponseCopyWithImpl<$Res, LibrariesResponse>;
  @useResult
  $Res call({List<Library> libraries});
}

/// @nodoc
class _$LibrariesResponseCopyWithImpl<$Res, $Val extends LibrariesResponse>
    implements $LibrariesResponseCopyWith<$Res> {
  _$LibrariesResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraries = null,
  }) {
    return _then(_value.copyWith(
      libraries: null == libraries
          ? _value.libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$LibrariesResponseImplCopyWith<$Res>
    implements $LibrariesResponseCopyWith<$Res> {
  factory _$$LibrariesResponseImplCopyWith(_$LibrariesResponseImpl value,
          $Res Function(_$LibrariesResponseImpl) then) =
      __$$LibrariesResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({List<Library> libraries});
}

/// @nodoc
class __$$LibrariesResponseImplCopyWithImpl<$Res>
    extends _$LibrariesResponseCopyWithImpl<$Res, _$LibrariesResponseImpl>
    implements _$$LibrariesResponseImplCopyWith<$Res> {
  __$$LibrariesResponseImplCopyWithImpl(_$LibrariesResponseImpl _value,
      $Res Function(_$LibrariesResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? libraries = null,
  }) {
    return _then(_$LibrariesResponseImpl(
      libraries: null == libraries
          ? _value._libraries
          : libraries // ignore: cast_nullable_to_non_nullable
              as List<Library>,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LibrariesResponseImpl implements _LibrariesResponse {
  const _$LibrariesResponseImpl({required final List<Library> libraries})
      : _libraries = libraries;

  factory _$LibrariesResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibrariesResponseImplFromJson(json);

  final List<Library> _libraries;
  @override
  List<Library> get libraries {
    if (_libraries is EqualUnmodifiableListView) return _libraries;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_libraries);
  }

  @override
  String toString() {
    return 'LibrariesResponse(libraries: $libraries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibrariesResponseImpl &&
            const DeepCollectionEquality()
                .equals(other._libraries, _libraries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, const DeepCollectionEquality().hash(_libraries));

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibrariesResponseImplCopyWith<_$LibrariesResponseImpl> get copyWith =>
      __$$LibrariesResponseImplCopyWithImpl<_$LibrariesResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LibrariesResponseImplToJson(
      this,
    );
  }
}

abstract class _LibrariesResponse implements LibrariesResponse {
  const factory _LibrariesResponse({required final List<Library> libraries}) =
      _$LibrariesResponseImpl;

  factory _LibrariesResponse.fromJson(Map<String, dynamic> json) =
      _$LibrariesResponseImpl.fromJson;

  @override
  List<Library> get libraries;
  @override
  @JsonKey(ignore: true)
  _$$LibrariesResponseImplCopyWith<_$LibrariesResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
