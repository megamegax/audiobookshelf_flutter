// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

Media _$MediaFromJson(Map<String, dynamic> json) {
  return _Media.fromJson(json);
}

/// @nodoc
mixin _$Media {
  Metadata get metadata => throw _privateConstructorUsedError;
  String get coverPath => throw _privateConstructorUsedError;
  List<String>? get tags => throw _privateConstructorUsedError;
  int get numTracks => throw _privateConstructorUsedError;
  int get numAudioFiles => throw _privateConstructorUsedError;
  int get numChapters => throw _privateConstructorUsedError;
  int get numMissingParts => throw _privateConstructorUsedError;
  int get numInvalidAudioFiles => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  int get size => throw _privateConstructorUsedError;
  String? get ebookFileFormat => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $MediaCopyWith<Media> get copyWith => throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $MediaCopyWith<$Res> {
  factory $MediaCopyWith(Media value, $Res Function(Media) then) =
      _$MediaCopyWithImpl<$Res, Media>;
  @useResult
  $Res call(
      {Metadata metadata,
      String coverPath,
      List<String>? tags,
      int numTracks,
      int numAudioFiles,
      int numChapters,
      int numMissingParts,
      int numInvalidAudioFiles,
      double duration,
      int size,
      String? ebookFileFormat});

  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class _$MediaCopyWithImpl<$Res, $Val extends Media>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._value, this._then);

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
    Object? numTracks = null,
    Object? numAudioFiles = null,
    Object? numChapters = null,
    Object? numMissingParts = null,
    Object? numInvalidAudioFiles = null,
    Object? duration = null,
    Object? size = null,
    Object? ebookFileFormat = freezed,
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
      numTracks: null == numTracks
          ? _value.numTracks
          : numTracks // ignore: cast_nullable_to_non_nullable
              as int,
      numAudioFiles: null == numAudioFiles
          ? _value.numAudioFiles
          : numAudioFiles // ignore: cast_nullable_to_non_nullable
              as int,
      numChapters: null == numChapters
          ? _value.numChapters
          : numChapters // ignore: cast_nullable_to_non_nullable
              as int,
      numMissingParts: null == numMissingParts
          ? _value.numMissingParts
          : numMissingParts // ignore: cast_nullable_to_non_nullable
              as int,
      numInvalidAudioFiles: null == numInvalidAudioFiles
          ? _value.numInvalidAudioFiles
          : numInvalidAudioFiles // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      ebookFileFormat: freezed == ebookFileFormat
          ? _value.ebookFileFormat
          : ebookFileFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $MetadataCopyWith<$Res> get metadata {
    return $MetadataCopyWith<$Res>(_value.metadata, (value) {
      return _then(_value.copyWith(metadata: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$MediaImplCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$$MediaImplCopyWith(
          _$MediaImpl value, $Res Function(_$MediaImpl) then) =
      __$$MediaImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {Metadata metadata,
      String coverPath,
      List<String>? tags,
      int numTracks,
      int numAudioFiles,
      int numChapters,
      int numMissingParts,
      int numInvalidAudioFiles,
      double duration,
      int size,
      String? ebookFileFormat});

  @override
  $MetadataCopyWith<$Res> get metadata;
}

/// @nodoc
class __$$MediaImplCopyWithImpl<$Res>
    extends _$MediaCopyWithImpl<$Res, _$MediaImpl>
    implements _$$MediaImplCopyWith<$Res> {
  __$$MediaImplCopyWithImpl(
      _$MediaImpl _value, $Res Function(_$MediaImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? metadata = null,
    Object? coverPath = null,
    Object? tags = freezed,
    Object? numTracks = null,
    Object? numAudioFiles = null,
    Object? numChapters = null,
    Object? numMissingParts = null,
    Object? numInvalidAudioFiles = null,
    Object? duration = null,
    Object? size = null,
    Object? ebookFileFormat = freezed,
  }) {
    return _then(_$MediaImpl(
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
      numTracks: null == numTracks
          ? _value.numTracks
          : numTracks // ignore: cast_nullable_to_non_nullable
              as int,
      numAudioFiles: null == numAudioFiles
          ? _value.numAudioFiles
          : numAudioFiles // ignore: cast_nullable_to_non_nullable
              as int,
      numChapters: null == numChapters
          ? _value.numChapters
          : numChapters // ignore: cast_nullable_to_non_nullable
              as int,
      numMissingParts: null == numMissingParts
          ? _value.numMissingParts
          : numMissingParts // ignore: cast_nullable_to_non_nullable
              as int,
      numInvalidAudioFiles: null == numInvalidAudioFiles
          ? _value.numInvalidAudioFiles
          : numInvalidAudioFiles // ignore: cast_nullable_to_non_nullable
              as int,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      size: null == size
          ? _value.size
          : size // ignore: cast_nullable_to_non_nullable
              as int,
      ebookFileFormat: freezed == ebookFileFormat
          ? _value.ebookFileFormat
          : ebookFileFormat // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$MediaImpl implements _Media {
  const _$MediaImpl(
      {required this.metadata,
      required this.coverPath,
      final List<String>? tags,
      required this.numTracks,
      required this.numAudioFiles,
      required this.numChapters,
      required this.numMissingParts,
      required this.numInvalidAudioFiles,
      required this.duration,
      required this.size,
      this.ebookFileFormat})
      : _tags = tags;

  factory _$MediaImpl.fromJson(Map<String, dynamic> json) =>
      _$$MediaImplFromJson(json);

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

  @override
  final int numTracks;
  @override
  final int numAudioFiles;
  @override
  final int numChapters;
  @override
  final int numMissingParts;
  @override
  final int numInvalidAudioFiles;
  @override
  final double duration;
  @override
  final int size;
  @override
  final String? ebookFileFormat;

  @override
  String toString() {
    return 'Media(metadata: $metadata, coverPath: $coverPath, tags: $tags, numTracks: $numTracks, numAudioFiles: $numAudioFiles, numChapters: $numChapters, numMissingParts: $numMissingParts, numInvalidAudioFiles: $numInvalidAudioFiles, duration: $duration, size: $size, ebookFileFormat: $ebookFileFormat)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$MediaImpl &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            const DeepCollectionEquality().equals(other._tags, _tags) &&
            (identical(other.numTracks, numTracks) ||
                other.numTracks == numTracks) &&
            (identical(other.numAudioFiles, numAudioFiles) ||
                other.numAudioFiles == numAudioFiles) &&
            (identical(other.numChapters, numChapters) ||
                other.numChapters == numChapters) &&
            (identical(other.numMissingParts, numMissingParts) ||
                other.numMissingParts == numMissingParts) &&
            (identical(other.numInvalidAudioFiles, numInvalidAudioFiles) ||
                other.numInvalidAudioFiles == numInvalidAudioFiles) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.size, size) || other.size == size) &&
            (identical(other.ebookFileFormat, ebookFileFormat) ||
                other.ebookFileFormat == ebookFileFormat));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      metadata,
      coverPath,
      const DeepCollectionEquality().hash(_tags),
      numTracks,
      numAudioFiles,
      numChapters,
      numMissingParts,
      numInvalidAudioFiles,
      duration,
      size,
      ebookFileFormat);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      __$$MediaImplCopyWithImpl<_$MediaImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$MediaImplToJson(
      this,
    );
  }
}

abstract class _Media implements Media {
  const factory _Media(
      {required final Metadata metadata,
      required final String coverPath,
      final List<String>? tags,
      required final int numTracks,
      required final int numAudioFiles,
      required final int numChapters,
      required final int numMissingParts,
      required final int numInvalidAudioFiles,
      required final double duration,
      required final int size,
      final String? ebookFileFormat}) = _$MediaImpl;

  factory _Media.fromJson(Map<String, dynamic> json) = _$MediaImpl.fromJson;

  @override
  Metadata get metadata;
  @override
  String get coverPath;
  @override
  List<String>? get tags;
  @override
  int get numTracks;
  @override
  int get numAudioFiles;
  @override
  int get numChapters;
  @override
  int get numMissingParts;
  @override
  int get numInvalidAudioFiles;
  @override
  double get duration;
  @override
  int get size;
  @override
  String? get ebookFileFormat;
  @override
  @JsonKey(ignore: true)
  _$$MediaImplCopyWith<_$MediaImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
