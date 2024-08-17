// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_library_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailedLibraryItem _$DetailedLibraryItemFromJson(Map<String, dynamic> json) {
  return _DetailedLibraryItem.fromJson(json);
}

/// @nodoc
mixin _$DetailedLibraryItem {
  String get id => throw _privateConstructorUsedError;
  String get ino => throw _privateConstructorUsedError;
  String get libraryId => throw _privateConstructorUsedError;
  String get folderId => throw _privateConstructorUsedError;
  String get path => throw _privateConstructorUsedError;
  String get relPath => throw _privateConstructorUsedError;
  bool get isFile => throw _privateConstructorUsedError;
  int get mtimeMs => throw _privateConstructorUsedError;
  int get ctimeMs => throw _privateConstructorUsedError;
  int get birthtimeMs => throw _privateConstructorUsedError;
  int get addedAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get lastScan => throw _privateConstructorUsedError;
  String get scanVersion => throw _privateConstructorUsedError;
  bool get isMissing => throw _privateConstructorUsedError;
  bool get isInvalid => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  DetailedMedia get media => throw _privateConstructorUsedError;
  List<FileMetadata>? get libraryFiles => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  CollapsedSeries? get collapsedSeries => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedLibraryItemCopyWith<DetailedLibraryItem> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedLibraryItemCopyWith<$Res> {
  factory $DetailedLibraryItemCopyWith(
          DetailedLibraryItem value, $Res Function(DetailedLibraryItem) then) =
      _$DetailedLibraryItemCopyWithImpl<$Res, DetailedLibraryItem>;
  @useResult
  $Res call(
      {String id,
      String ino,
      String libraryId,
      String folderId,
      String path,
      String relPath,
      bool isFile,
      int mtimeMs,
      int ctimeMs,
      int birthtimeMs,
      int addedAt,
      int updatedAt,
      int lastScan,
      String scanVersion,
      bool isMissing,
      bool isInvalid,
      String mediaType,
      DetailedMedia media,
      List<FileMetadata>? libraryFiles,
      int size,
      CollapsedSeries? collapsedSeries});

  $DetailedMediaCopyWith<$Res> get media;
  $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;
}

/// @nodoc
class _$DetailedLibraryItemCopyWithImpl<$Res, $Val extends DetailedLibraryItem>
    implements $DetailedLibraryItemCopyWith<$Res> {
  _$DetailedLibraryItemCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ino = null,
    Object? libraryId = null,
    Object? folderId = null,
    Object? path = null,
    Object? relPath = null,
    Object? isFile = null,
    Object? mtimeMs = null,
    Object? ctimeMs = null,
    Object? birthtimeMs = null,
    Object? addedAt = null,
    Object? updatedAt = null,
    Object? lastScan = null,
    Object? scanVersion = null,
    Object? isMissing = null,
    Object? isInvalid = null,
    Object? mediaType = null,
    Object? media = null,
    Object? libraryFiles = freezed,
    Object? size = null,
    Object? collapsedSeries = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFile: null == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool,
      mtimeMs: null == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      ctimeMs: null == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      birthtimeMs: null == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastScan: null == lastScan
          ? _value.lastScan
          : lastScan // ignore: cast_nullable_to_non_nullable
              as int,
      scanVersion: null == scanVersion
          ? _value.scanVersion
          : scanVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isMissing: null == isMissing
          ? _value.isMissing
          : isMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvalid: null == isInvalid
          ? _value.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as DetailedMedia,
      libraryFiles: freezed == libraryFiles
          ? _value.libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      collapsedSeries: freezed == collapsedSeries
          ? _value.collapsedSeries
          : collapsedSeries // ignore: cast_nullable_to_non_nullable
              as CollapsedSeries?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DetailedMediaCopyWith<$Res> get media {
    return $DetailedMediaCopyWith<$Res>(_value.media, (value) {
      return _then(_value.copyWith(media: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $CollapsedSeriesCopyWith<$Res>? get collapsedSeries {
    if (_value.collapsedSeries == null) {
      return null;
    }

    return $CollapsedSeriesCopyWith<$Res>(_value.collapsedSeries!, (value) {
      return _then(_value.copyWith(collapsedSeries: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailedLibraryItemImplCopyWith<$Res>
    implements $DetailedLibraryItemCopyWith<$Res> {
  factory _$$DetailedLibraryItemImplCopyWith(_$DetailedLibraryItemImpl value,
          $Res Function(_$DetailedLibraryItemImpl) then) =
      __$$DetailedLibraryItemImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String ino,
      String libraryId,
      String folderId,
      String path,
      String relPath,
      bool isFile,
      int mtimeMs,
      int ctimeMs,
      int birthtimeMs,
      int addedAt,
      int updatedAt,
      int lastScan,
      String scanVersion,
      bool isMissing,
      bool isInvalid,
      String mediaType,
      DetailedMedia media,
      List<FileMetadata>? libraryFiles,
      int size,
      CollapsedSeries? collapsedSeries});

  @override
  $DetailedMediaCopyWith<$Res> get media;
  @override
  $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;
}

/// @nodoc
class __$$DetailedLibraryItemImplCopyWithImpl<$Res>
    extends _$DetailedLibraryItemCopyWithImpl<$Res, _$DetailedLibraryItemImpl>
    implements _$$DetailedLibraryItemImplCopyWith<$Res> {
  __$$DetailedLibraryItemImplCopyWithImpl(_$DetailedLibraryItemImpl _value,
      $Res Function(_$DetailedLibraryItemImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? ino = null,
    Object? libraryId = null,
    Object? folderId = null,
    Object? path = null,
    Object? relPath = null,
    Object? isFile = null,
    Object? mtimeMs = null,
    Object? ctimeMs = null,
    Object? birthtimeMs = null,
    Object? addedAt = null,
    Object? updatedAt = null,
    Object? lastScan = null,
    Object? scanVersion = null,
    Object? isMissing = null,
    Object? isInvalid = null,
    Object? mediaType = null,
    Object? media = null,
    Object? libraryFiles = freezed,
    Object? size = null,
    Object? collapsedSeries = freezed,
  }) {
    return _then(_$DetailedLibraryItemImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      ino: null == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String,
      libraryId: null == libraryId
          ? _value.libraryId
          : libraryId // ignore: cast_nullable_to_non_nullable
              as String,
      folderId: null == folderId
          ? _value.folderId
          : folderId // ignore: cast_nullable_to_non_nullable
              as String,
      path: null == path
          ? _value.path
          : path // ignore: cast_nullable_to_non_nullable
              as String,
      relPath: null == relPath
          ? _value.relPath
          : relPath // ignore: cast_nullable_to_non_nullable
              as String,
      isFile: null == isFile
          ? _value.isFile
          : isFile // ignore: cast_nullable_to_non_nullable
              as bool,
      mtimeMs: null == mtimeMs
          ? _value.mtimeMs
          : mtimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      ctimeMs: null == ctimeMs
          ? _value.ctimeMs
          : ctimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      birthtimeMs: null == birthtimeMs
          ? _value.birthtimeMs
          : birthtimeMs // ignore: cast_nullable_to_non_nullable
              as int,
      addedAt: null == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      lastScan: null == lastScan
          ? _value.lastScan
          : lastScan // ignore: cast_nullable_to_non_nullable
              as int,
      scanVersion: null == scanVersion
          ? _value.scanVersion
          : scanVersion // ignore: cast_nullable_to_non_nullable
              as String,
      isMissing: null == isMissing
          ? _value.isMissing
          : isMissing // ignore: cast_nullable_to_non_nullable
              as bool,
      isInvalid: null == isInvalid
          ? _value.isInvalid
          : isInvalid // ignore: cast_nullable_to_non_nullable
              as bool,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      media: null == media
          ? _value.media
          : media // ignore: cast_nullable_to_non_nullable
              as DetailedMedia,
      libraryFiles: freezed == libraryFiles
          ? _value._libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<FileMetadata>?,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      collapsedSeries: freezed == collapsedSeries
          ? _value.collapsedSeries
          : collapsedSeries // ignore: cast_nullable_to_non_nullable
              as CollapsedSeries?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedLibraryItemImpl implements _DetailedLibraryItem {
  const _$DetailedLibraryItemImpl(
      {required this.id,
      required this.ino,
      required this.libraryId,
      required this.folderId,
      required this.path,
      required this.relPath,
      required this.isFile,
      required this.mtimeMs,
      required this.ctimeMs,
      required this.birthtimeMs,
      required this.addedAt,
      required this.updatedAt,
      required this.lastScan,
      required this.scanVersion,
      required this.isMissing,
      required this.isInvalid,
      required this.mediaType,
      required this.media,
      required final List<FileMetadata>? libraryFiles,
      required this.size,
      required this.collapsedSeries})
      : _libraryFiles = libraryFiles;

  factory _$DetailedLibraryItemImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedLibraryItemImplFromJson(json);

  @override
  final String id;
  @override
  final String ino;
  @override
  final String libraryId;
  @override
  final String folderId;
  @override
  final String path;
  @override
  final String relPath;
  @override
  final bool isFile;
  @override
  final int mtimeMs;
  @override
  final int ctimeMs;
  @override
  final int birthtimeMs;
  @override
  final int addedAt;
  @override
  final int updatedAt;
  @override
  final int lastScan;
  @override
  final String scanVersion;
  @override
  final bool isMissing;
  @override
  final bool isInvalid;
  @override
  final String mediaType;
  @override
  final DetailedMedia media;
  final List<FileMetadata>? _libraryFiles;
  @override
  List<FileMetadata>? get libraryFiles {
    final value = _libraryFiles;
    if (value == null) return null;
    if (_libraryFiles is EqualUnmodifiableListView) return _libraryFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final int size;
  @override
  final CollapsedSeries? collapsedSeries;

  @override
  String toString() {
    return 'DetailedLibraryItem(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, lastScan: $lastScan, scanVersion: $scanVersion, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, libraryFiles: $libraryFiles, size: $size, collapsedSeries: $collapsedSeries)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedLibraryItemImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.libraryId, libraryId) ||
                other.libraryId == libraryId) &&
            (identical(other.folderId, folderId) ||
                other.folderId == folderId) &&
            (identical(other.path, path) || other.path == path) &&
            (identical(other.relPath, relPath) || other.relPath == relPath) &&
            (identical(other.isFile, isFile) || other.isFile == isFile) &&
            (identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs) &&
            (identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs) &&
            (identical(other.birthtimeMs, birthtimeMs) ||
                other.birthtimeMs == birthtimeMs) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.lastScan, lastScan) ||
                other.lastScan == lastScan) &&
            (identical(other.scanVersion, scanVersion) ||
                other.scanVersion == scanVersion) &&
            (identical(other.isMissing, isMissing) ||
                other.isMissing == isMissing) &&
            (identical(other.isInvalid, isInvalid) ||
                other.isInvalid == isInvalid) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.media, media) || other.media == media) &&
            const DeepCollectionEquality()
                .equals(other._libraryFiles, _libraryFiles) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.collapsedSeries, collapsedSeries) ||
                other.collapsedSeries == collapsedSeries));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        ino,
        libraryId,
        folderId,
        path,
        relPath,
        isFile,
        mtimeMs,
        ctimeMs,
        birthtimeMs,
        addedAt,
        updatedAt,
        lastScan,
        scanVersion,
        isMissing,
        isInvalid,
        mediaType,
        media,
        const DeepCollectionEquality().hash(_libraryFiles),
        size,
        collapsedSeries
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedLibraryItemImplCopyWith<_$DetailedLibraryItemImpl> get copyWith =>
      __$$DetailedLibraryItemImplCopyWithImpl<_$DetailedLibraryItemImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedLibraryItemImplToJson(
      this,
    );
  }
}

abstract class _DetailedLibraryItem implements DetailedLibraryItem {
  const factory _DetailedLibraryItem(
          {required final String id,
          required final String ino,
          required final String libraryId,
          required final String folderId,
          required final String path,
          required final String relPath,
          required final bool isFile,
          required final int mtimeMs,
          required final int ctimeMs,
          required final int birthtimeMs,
          required final int addedAt,
          required final int updatedAt,
          required final int lastScan,
          required final String scanVersion,
          required final bool isMissing,
          required final bool isInvalid,
          required final String mediaType,
          required final DetailedMedia media,
          required final List<FileMetadata>? libraryFiles,
          required final int size,
          required final CollapsedSeries? collapsedSeries}) =
      _$DetailedLibraryItemImpl;

  factory _DetailedLibraryItem.fromJson(Map<String, dynamic> json) =
      _$DetailedLibraryItemImpl.fromJson;

  @override
  String get id;
  @override
  String get ino;
  @override
  String get libraryId;
  @override
  String get folderId;
  @override
  String get path;
  @override
  String get relPath;
  @override
  bool get isFile;
  @override
  int get mtimeMs;
  @override
  int get ctimeMs;
  @override
  int get birthtimeMs;
  @override
  int get addedAt;
  @override
  int get updatedAt;
  @override
  int get lastScan;
  @override
  String get scanVersion;
  @override
  bool get isMissing;
  @override
  bool get isInvalid;
  @override
  String get mediaType;
  @override
  DetailedMedia get media;
  @override
  List<FileMetadata>? get libraryFiles;
  @override
  int get size;
  @override
  CollapsedSeries? get collapsedSeries;
  @override
  @JsonKey(ignore: true)
  _$$DetailedLibraryItemImplCopyWith<_$DetailedLibraryItemImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
