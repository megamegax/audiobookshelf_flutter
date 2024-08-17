// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LibraryFile _$LibraryFileFromJson(Map<String, dynamic> json) {
  return _LibraryFile.fromJson(json);
}

/// @nodoc
mixin _$LibraryFile {
  String get ino => throw _privateConstructorUsedError;
  FileMetadata? get metadata => throw _privateConstructorUsedError;
  String get isSupplementary => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  String? get fileType => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LibraryFileCopyWith<LibraryFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LibraryFileCopyWith<$Res> {
  factory $LibraryFileCopyWith(
          LibraryFile value, $Res Function(LibraryFile) then) =
      _$LibraryFileCopyWithImpl<$Res, LibraryFile>;
  @useResult
  $Res call(
      {String ino,
      FileMetadata? metadata,
      String isSupplementary,
      int addedAt,
      int? updatedAt,
      String? fileType});

  $FileMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class _$LibraryFileCopyWithImpl<$Res, $Val extends LibraryFile>
    implements $LibraryFileCopyWith<$Res> {
  _$LibraryFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = freezed,
    Object? isSupplementary = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
    Object? fileType = freezed,
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
      isSupplementary: null == isSupplementary
          ? _value.isSupplementary
          : isSupplementary // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
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
abstract class _$$LibraryFileImplCopyWith<$Res>
    implements $LibraryFileCopyWith<$Res> {
  factory _$$LibraryFileImplCopyWith(
          _$LibraryFileImpl value, $Res Function(_$LibraryFileImpl) then) =
      __$$LibraryFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String ino,
      FileMetadata? metadata,
      String isSupplementary,
      int addedAt,
      int? updatedAt,
      String? fileType});

  @override
  $FileMetadataCopyWith<$Res>? get metadata;
}

/// @nodoc
class __$$LibraryFileImplCopyWithImpl<$Res>
    extends _$LibraryFileCopyWithImpl<$Res, _$LibraryFileImpl>
    implements _$$LibraryFileImplCopyWith<$Res> {
  __$$LibraryFileImplCopyWithImpl(
      _$LibraryFileImpl _value, $Res Function(_$LibraryFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? ino = null,
    Object? metadata = freezed,
    Object? isSupplementary = null,
    Object? addedAt = null,
    Object? updatedAt = freezed,
    Object? fileType = freezed,
  }) {
    return _then(_$LibraryFileImpl(
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      isSupplementary: null == isSupplementary
          ? _value.isSupplementary
          : isSupplementary // ignore: cast_nullable_to_non_nullable
              as String,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      fileType: freezed == fileType
          ? _value.fileType
          : fileType // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LibraryFileImpl implements _LibraryFile {
  const _$LibraryFileImpl(
      {required this.ino,
      this.metadata,
      required this.isSupplementary,
      required this.addedAt,
      this.updatedAt,
      this.fileType});

  factory _$LibraryFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$LibraryFileImplFromJson(json);

  @override
  final String ino;
  @override
  final FileMetadata? metadata;
  @override
  final String isSupplementary;
  @override
  final int addedAt;
  @override
  final int? updatedAt;
  @override
  final String? fileType;

  @override
  String toString() {
    return 'LibraryFile(ino: $ino, metadata: $metadata, isSupplementary: $isSupplementary, addedAt: $addedAt, updatedAt: $updatedAt, fileType: $fileType)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LibraryFileImpl &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.isSupplementary, isSupplementary) ||
                other.isSupplementary == isSupplementary) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.fileType, fileType) ||
                other.fileType == fileType));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, ino, metadata, isSupplementary,
      addedAt, updatedAt, fileType);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LibraryFileImplCopyWith<_$LibraryFileImpl> get copyWith =>
      __$$LibraryFileImplCopyWithImpl<_$LibraryFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LibraryFileImplToJson(
      this,
    );
  }
}

abstract class _LibraryFile implements LibraryFile {
  const factory _LibraryFile(
      {required final String ino,
      final FileMetadata? metadata,
      required final String isSupplementary,
      required final int addedAt,
      final int? updatedAt,
      final String? fileType}) = _$LibraryFileImpl;

  factory _LibraryFile.fromJson(Map<String, dynamic> json) =
      _$LibraryFileImpl.fromJson;

  @override
  String get ino;
  @override
  FileMetadata? get metadata;
  @override
  String get isSupplementary;
  @override
  int get addedAt;
  @override
  int? get updatedAt;
  @override
  String? get fileType;
  @override
  @JsonKey(ignore: true)
  _$$LibraryFileImplCopyWith<_$LibraryFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}

FileMetadata _$FileMetadataFromJson(Map<String, dynamic> json) {
  return _FileMetadata.fromJson(json);
}

/// @nodoc
mixin _$FileMetadata {
  String? get filename => throw _privateConstructorUsedError;
  String? get ext => throw _privateConstructorUsedError;
  String? get path => throw _privateConstructorUsedError;
  String? get relPath => throw _privateConstructorUsedError;
  int? get size => throw _privateConstructorUsedError;
  int? get mtimeMs => throw _privateConstructorUsedError;
  int? get ctimeMs => throw _privateConstructorUsedError;
  int? get birthtimeMs => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $FileMetadataCopyWith<FileMetadata> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $FileMetadataCopyWith<$Res> {
  factory $FileMetadataCopyWith(
          FileMetadata value, $Res Function(FileMetadata) then) =
      _$FileMetadataCopyWithImpl<$Res, FileMetadata>;
  @useResult
  $Res call(
      {String? filename,
      String? ext,
      String? path,
      String? relPath,
      int? size,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs});
}

/// @nodoc
class _$FileMetadataCopyWithImpl<$Res, $Val extends FileMetadata>
    implements $FileMetadataCopyWith<$Res> {
  _$FileMetadataCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = freezed,
    Object? ext = freezed,
    Object? path = freezed,
    Object? relPath = freezed,
    Object? size = freezed,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
  }) {
    return _then(_value.copyWith(
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      relPath: freezed == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$FileMetadataImplCopyWith<$Res>
    implements $FileMetadataCopyWith<$Res> {
  factory _$$FileMetadataImplCopyWith(
          _$FileMetadataImpl value, $Res Function(_$FileMetadataImpl) then) =
      __$$FileMetadataImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? filename,
      String? ext,
      String? path,
      String? relPath,
      int? size,
      int? mtimeMs,
      int? ctimeMs,
      int? birthtimeMs});
}

/// @nodoc
class __$$FileMetadataImplCopyWithImpl<$Res>
    extends _$FileMetadataCopyWithImpl<$Res, _$FileMetadataImpl>
    implements _$$FileMetadataImplCopyWith<$Res> {
  __$$FileMetadataImplCopyWithImpl(
      _$FileMetadataImpl _value, $Res Function(_$FileMetadataImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? filename = freezed,
    Object? ext = freezed,
    Object? path = freezed,
    Object? relPath = freezed,
    Object? size = freezed,
    Object? mtimeMs = freezed,
    Object? ctimeMs = freezed,
    Object? birthtimeMs = freezed,
  }) {
    return _then(_$FileMetadataImpl(
      filename: freezed == filename
          ? _value.filename
          : filename // ignore: cast_nullable_to_non_nullable
              as String?,
      ext: freezed == ext
          ? _value.ext
          : ext // ignore: cast_nullable_to_non_nullable
              as String?,
      path: freezed == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String?,
      relPath: freezed == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String?,
      size: freezed == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int?,
      mtimeMs: freezed == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      ctimeMs: freezed == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
      birthtimeMs: freezed == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$FileMetadataImpl implements _FileMetadata {
  const _$FileMetadataImpl(
      {required this.filename,
      required this.ext,
      required this.path,
      this.relPath,
      required this.size,
      this.mtimeMs,
      this.ctimeMs,
      this.birthtimeMs});

  factory _$FileMetadataImpl.fromJson(Map<String, dynamic> json) =>
      _$$FileMetadataImplFromJson(json);

  @override
  final String? filename;
  @override
  final String? ext;
  @override
  final String? path;
  @override
  final String? relPath;
  @override
  final int? size;
  @override
  final int? mtimeMs;
  @override
  final int? ctimeMs;
  @override
  final int? birthtimeMs;

  @override
  String toString() {
    return 'FileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$FileMetadataImpl &&
            (identical(other.filename, filename) ||
                other.filename == filename) &&
            (identical(other.ext, ext) || other.ext == ext) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.relPath, relPath) || other.relPath == relPath) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs) &&
            (identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs) &&
            (identical(other.birthtimeMs, birthtimeMs) ||
                other.birthtimeMs == birthtimeMs));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, filename, ext, path, relPath,
      size, mtimeMs, ctimeMs, birthtimeMs);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$FileMetadataImplCopyWith<_$FileMetadataImpl> get copyWith =>
      __$$FileMetadataImplCopyWithImpl<_$FileMetadataImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$FileMetadataImplToJson(
      this,
    );
  }
}

abstract class _FileMetadata implements FileMetadata {
  const factory _FileMetadata(
      {required final String? filename,
      required final String? ext,
      required final String? path,
      final String? relPath,
      required final int? size,
      final int? mtimeMs,
      final int? ctimeMs,
      final int? birthtimeMs}) = _$FileMetadataImpl;

  factory _FileMetadata.fromJson(Map<String, dynamic> json) =
      _$FileMetadataImpl.fromJson;

  @override
  String? get filename;
  @override
  String? get ext;
  @override
  String? get path;
  @override
  String? get relPath;
  @override
  int? get size;
  @override
  int? get mtimeMs;
  @override
  int? get ctimeMs;
  @override
  int? get birthtimeMs;
  @override
  @JsonKey(ignore: true)
  _$$FileMetadataImplCopyWith<_$FileMetadataImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
