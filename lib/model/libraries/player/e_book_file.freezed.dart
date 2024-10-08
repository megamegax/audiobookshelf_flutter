// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'e_book_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

EBookFile _$EBookFileFromJson(Map<String, dynamic> json) {
  return _EBookFile.fromJson(json);
}

/// @nodoc
mixin _$EBookFile {
  String get ino => throw _privateConstructorUsedError;
  FileMetadata? get metadata => throw _privateConstructorUsedError;
  String get ebookFormat => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $EBookFileCopyWith<EBookFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $EBookFileCopyWith<$Res> {
  factory $EBookFileCopyWith(EBookFile value, $Res Function(EBookFile) then) =
      _$EBookFileCopyWithImpl<$Res, EBookFile>;
  @useResult
  $Res call(
      {String ino,
      FileMetadata? metadata,
      String ebookFormat,
      int addedAt,
      int? updatedAt});

  $FileMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$EBookFileCopyWithImpl<$Res, $Val extends EBookFile>
    implements $EBookFileCopyWith<$Res> {
  _$EBookFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = freezed,
    Object? ebookFormat = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_value.copyWith(
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      ebookFormat: null == ebookFormat
          ? _value.ebookFormat
          : ebookFormat // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $FileMetadataCopyWith<$Res>? get metadata {
    if (_value.metadata == null) {
      return null;
    }

    return $FileMetadataCopyWith<$Res>(_value.metadata!, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$EBookFileImplCopyWith<$Res>
    implements $EBookFileCopyWith<$Res> {
  factory _$$EBookFileImplCopyWith(
          _$EBookFileImpl value, $Res Function(_$EBookFileImpl) then) =
      __$$EBookFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ino,
      FileMetadata? metadata,
      String ebookFormat,
      int addedAt,
      int? updatedAt});

  @override
  $FileMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$EBookFileImplCopyWithImpl<$Res>
    extends _$EBookFileCopyWithImpl<$Res, _$EBookFileImpl>
    implements _$$EBookFileImplCopyWith<$Res> {
  __$$EBookFileImplCopyWithImpl(
      _$EBookFileImpl _value, $Res Function(_$EBookFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = freezed,
    Object? ebookFormat = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
  }) {
    return _then(_$EBookFileImpl(
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      ebookFormat: null == ebookFormat
          ? _value.ebookFormat
          : ebookFormat // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$EBookFileImpl implements _EBookFile {
  const _$EBookFileImpl(
      {required this.ino,
      this.metadata,
      required this.ebookFormat,
      required this.addedAt,
      this.updatedAt});

  factory _$EBookFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$EBookFileImplFromJson(json);

  @override
  final String ino;
  @override
  final FileMetadata? metadata;
  @override
  final String ebookFormat;
  @override
  final int addedAt;
  @override
  final int? updatedAt;

  @override
  String toString() {
    return 'EBookFile(ino: $ino, metadata: $metadata, ebookFormat: $ebookFormat, addedAt: $addedAt, updatedAt: $updatedAt)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$EBookFileImpl &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.ebookFormat, ebookFormat) ||
                other.ebookFormat == ebookFormat) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode =>
      Object.hash(runtimeType, ino, metadata, ebookFormat, addedAt, updatedAt);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$EBookFileImplCopyWith<_$EBookFileImpl> get copyWith =>
      __$$EBookFileImplCopyWithImpl<_$EBookFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$EBookFileImplToJson(
      this,
    );
  }
}

abstract class _EBookFile implements EBookFile {
  const factory _EBookFile(
      {required final String ino,
      final FileMetadata? metadata,
      required final String ebookFormat,
      required final int addedAt,
      final int? updatedAt}) = _$EBookFileImpl;

  factory _EBookFile.fromJson(Map<String, dynamic> json) =
      _$EBookFileImpl.fromJson;

  @override
  String get ino;
  @override
  FileMetadata? get metadata;
  @override
  String get ebookFormat;
  @override
  int get addedAt;
  @override
  int? get updatedAt;
  @override
  @JsonKey(ignore: true)
  _$$EBookFileImplCopyWith<_$EBookFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
