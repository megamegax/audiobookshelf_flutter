// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DetailedMedia _$DetailedMediaFromJson(Map<String, dynamic> json) {
  return _DetailedMedia.fromJson(json);
}

/// @nodoc
mixin _$DetailedMedia {
  Metadata get metadata => throw _privateConstructorUsedError;
  String get coverPath => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  List<AudioFile>? get audioFiles => throw _privateConstructorUsedError;
  List<BookChapter>? get chapters => throw _privateConstructorUsedError;
  List<Track>? get tracks => throw _privateConstructorUsedError;
  List<LibraryFile>? get libraryFiles => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  EBookFile? get ebookFile => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DetailedMediaCopyWith<DetailedMedia> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DetailedMediaCopyWith<$Res> {
  factory $DetailedMediaCopyWith(
          DetailedMedia value, $Res Function(DetailedMedia) then) =
      _$DetailedMediaCopyWithImpl<$Res, DetailedMedia>;
  @useResult
  $Res call(
      {Metadata metadata,
      String coverPath,
      List<String>? tags,
      List<AudioFile>? audioFiles,
      List<BookChapter>? chapters,
      List<Track>? tracks,
      List<LibraryFile>? libraryFiles,
      double duration,
      int size,
      EBookFile? ebookFile});

  $MetadataCopyWith<$Res> get metadata;
  $EBookFileCopyWith<$Res>? get ebookFile;
}

/// @nodoc
class _$DetailedMediaCopyWithImpl<$Res, $Val extends DetailedMedia>
    implements $DetailedMediaCopyWith<$Res> {
  _$DetailedMediaCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? coverPath = null,
    Object? tags = freezed,
    Object? audioFiles = freezed,
    Object? chapters = freezed,
    Object? tracks = freezed,
    Object? libraryFiles = freezed,
    Object? duration = null,
    Object? size = null,
    Object? ebookFile = freezed,
  }) {
    return _then(_value.copyWith(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      coverPath: null == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value.tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioFiles: freezed == audioFiles
          ? _value.audioFiles
          : audioFiles // ignore: cast_nullable_to_non_nullable
              as List<AudioFile>?,
      chapters: freezed == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<BookChapter>?,
      tracks: freezed == tracks
          ? _value.tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>?,
      libraryFiles: freezed == libraryFiles
          ? _value.libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<LibraryFile>?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      ebookFile: freezed == ebookFile
          ? _value.ebookFile
          : ebookFile // ignore: cast_nullable_to_non_nullable
              as EBookFile?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $EBookFileCopyWith<$Res>? get ebookFile {
    if (_value.ebookFile == null) {
      return null;
    }

    return $EBookFileCopyWith<$Res>(_value.ebookFile!, (value) {
      return _then(_value.copyWith(ebookFile: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$DetailedMediaImplCopyWith<$Res>
    implements $DetailedMediaCopyWith<$Res> {
  factory _$$DetailedMediaImplCopyWith(
          _$DetailedMediaImpl value, $Res Function(_$DetailedMediaImpl) then) =
      __$$DetailedMediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Metadata metadata,
      String coverPath,
      List<String>? tags,
      List<AudioFile>? audioFiles,
      List<BookChapter>? chapters,
      List<Track>? tracks,
      List<LibraryFile>? libraryFiles,
      double duration,
      int size,
      EBookFile? ebookFile});

  @override
  $MetadataCopyWith<$Res> get metadata;
  @override
  $EBookFileCopyWith<$Res>? get ebookFile;
}

/// @nodoc
class __$$DetailedMediaImplCopyWithImpl<$Res>
    extends _$DetailedMediaCopyWithImpl<$Res, _$DetailedMediaImpl>
    implements _$$DetailedMediaImplCopyWith<$Res> {
  __$$DetailedMediaImplCopyWithImpl(
      _$DetailedMediaImpl _value, $Res Function(_$DetailedMediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? coverPath = null,
    Object? tags = freezed,
    Object? audioFiles = freezed,
    Object? chapters = freezed,
    Object? tracks = freezed,
    Object? libraryFiles = freezed,
    Object? duration = null,
    Object? size = null,
    Object? ebookFile = freezed,
  }) {
    return _then(_$DetailedMediaImpl(
      metadata: null == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as Metadata,
      coverPath: null == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String,
      tags: freezed == tags
          ? _value._tags
          : tags // ignore: cast_nullable_to_non_nullable
              as List<String>?,
      audioFiles: freezed == audioFiles
          ? _value._audioFiles
          : audioFiles // ignore: cast_nullable_to_non_nullable
              as List<AudioFile>?,
      chapters: freezed == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<BookChapter>?,
      tracks: freezed == tracks
          ? _value._tracks
          : tracks // ignore: cast_nullable_to_non_nullable
              as List<Track>?,
      libraryFiles: freezed == libraryFiles
          ? _value._libraryFiles
          : libraryFiles // ignore: cast_nullable_to_non_nullable
              as List<LibraryFile>?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      ebookFile: freezed == ebookFile
          ? _value.ebookFile
          : ebookFile // ignore: cast_nullable_to_non_nullable
              as EBookFile?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DetailedMediaImpl implements _DetailedMedia {
  const _$DetailedMediaImpl(
      {required this.metadata,
      required this.coverPath,
      final List<String>? tags,
      required final List<AudioFile>? audioFiles,
      required final List<BookChapter>? chapters,
      required final List<Track>? tracks,
      required final List<LibraryFile>? libraryFiles,
      required this.duration,
      required this.size,
      this.ebookFile})
      : _tags = tags,
        _audioFiles = audioFiles,
        _chapters = chapters,
        _tracks = tracks,
        _libraryFiles = libraryFiles;

  factory _$DetailedMediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$DetailedMediaImplFromJson(json);

  @override
  final Metadata metadata;
  @override
  final String coverPath;
  final List<String>? _tags;
  @override
  List<String>? get tags {
    final value = _tags;
    if (value == null) return null;
    if (_tags is EqualUnmodifiableListView) return _tags;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<AudioFile>? _audioFiles;
  @override
  List<AudioFile>? get audioFiles {
    final value = _audioFiles;
    if (value == null) return null;
    if (_audioFiles is EqualUnmodifiableListView) return _audioFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<BookChapter>? _chapters;
  @override
  List<BookChapter>? get chapters {
    final value = _chapters;
    if (value == null) return null;
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<Track>? _tracks;
  @override
  List<Track>? get tracks {
    final value = _tracks;
    if (value == null) return null;
    if (_tracks is EqualUnmodifiableListView) return _tracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<LibraryFile>? _libraryFiles;
  @override
  List<LibraryFile>? get libraryFiles {
    final value = _libraryFiles;
    if (value == null) return null;
    if (_libraryFiles is EqualUnmodifiableListView) return _libraryFiles;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final double duration;
  @override
  final int size;
  @override
  final EBookFile? ebookFile;

  @override
  String toString() {
    return 'DetailedMedia(metadata: $metadata, coverPath: $coverPath, tags: $tags, audioFiles: $audioFiles, chapters: $chapters, tracks: $tracks, libraryFiles: $libraryFiles, duration: $duration, size: $size, ebookFile: $ebookFile)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DetailedMediaImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            const DeepCollectionEquality()
                .equals(other._audioFiles, _audioFiles) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            const DeepCollectionEquality().equals(other._tracks, _tracks) &&
            const DeepCollectionEquality()
                .equals(other._libraryFiles, _libraryFiles) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.ebookFile, ebookFile) ||
                other.ebookFile == ebookFile));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metadata,
      coverPath,
      const DeepCollectionEquality().hash(_tags),
      const DeepCollectionEquality().hash(_audioFiles),
      const DeepCollectionEquality().hash(_chapters),
      const DeepCollectionEquality().hash(_tracks),
      const DeepCollectionEquality().hash(_libraryFiles),
      duration,
      size,
      ebookFile);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DetailedMediaImplCopyWith<_$DetailedMediaImpl> get copyWith =>
      __$$DetailedMediaImplCopyWithImpl<_$DetailedMediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DetailedMediaImplToJson(
      this,
    );
  }
}

abstract class _DetailedMedia implements DetailedMedia {
  const factory _DetailedMedia(
      {required final Metadata metadata,
      required final String coverPath,
      final List<String>? tags,
      required final List<AudioFile>? audioFiles,
      required final List<BookChapter>? chapters,
      required final List<Track>? tracks,
      required final List<LibraryFile>? libraryFiles,
      required final double duration,
      required final int size,
      final EBookFile? ebookFile}) = _$DetailedMediaImpl;

  factory _DetailedMedia.fromJson(Map<String, dynamic> json) =
      _$DetailedMediaImpl.fromJson;

  @override
  Metadata get metadata;
  @override
  String get coverPath;
  @override
  List<String>? get tags;
  @override
  List<AudioFile>? get audioFiles;
  @override
  List<BookChapter>? get chapters;
  @override
  List<Track>? get tracks;
  @override
  List<LibraryFile>? get libraryFiles;
  @override
  double get duration;
  @override
  int get size;
  @override
  EBookFile? get ebookFile;
  @override
  @JsonKey(ignore: true)
  _$$DetailedMediaImplCopyWith<_$DetailedMediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
