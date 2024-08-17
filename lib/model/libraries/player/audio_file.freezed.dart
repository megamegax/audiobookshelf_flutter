// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

AudioFile _$AudioFileFromJson(Map<String, dynamic> json) {
  return _AudioFile.fromJson(json);
}

/// @nodoc
mixin _$AudioFile {
  int? get index => throw _privateConstructorUsedError;
  String? get ino => throw _privateConstructorUsedError;
  FileMetadata? get metadata => throw _privateConstructorUsedError;
  int? get addedAt => throw _privateConstructorUsedError;
  int? get updatedAt => throw _privateConstructorUsedError;
  String? get format => throw _privateConstructorUsedError;
  double? get duration => throw _privateConstructorUsedError;
  int? get bitRate => throw _privateConstructorUsedError;
  String? get language => throw _privateConstructorUsedError;
  String? get codec => throw _privateConstructorUsedError;
  String? get timeBase => throw _privateConstructorUsedError;
  int? get channels => throw _privateConstructorUsedError;
  String? get channelLayout => throw _privateConstructorUsedError;
  String? get mimeType => throw _privateConstructorUsedError;
  MetaTags? get metaTags => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $AudioFileCopyWith<AudioFile> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $AudioFileCopyWith<$Res> {
  factory $AudioFileCopyWith(AudioFile value, $Res Function(AudioFile) then) =
      _$AudioFileCopyWithImpl<$Res, AudioFile>;
  @useResult
  $Res call(
      {int? index,
      String? ino,
      FileMetadata? metadata,
      int? addedAt,
      int? updatedAt,
      String? format,
      double? duration,
      int? bitRate,
      String? language,
      String? codec,
      String? timeBase,
      int? channels,
      String? channelLayout,
      String? mimeType,
      MetaTags? metaTags});

  $FileMetadataCopyWith<$Res>? get metadata;
  $MetaTagsCopyWith<$Res>? get metaTags;
}

/// @nodoc
class _$AudioFileCopyWithImpl<$Res, $Val extends AudioFile>
    implements $AudioFileCopyWith<$Res> {
  _$AudioFileCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? ino = freezed,
    Object? metadata = freezed,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? format = freezed,
    Object? duration = freezed,
    Object? bitRate = freezed,
    Object? language = freezed,
    Object? codec = freezed,
    Object? timeBase = freezed,
    Object? channels = freezed,
    Object? channelLayout = freezed,
    Object? mimeType = freezed,
    Object? metaTags = freezed,
  }) {
    return _then(_value.copyWith(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      ino: freezed == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as int?,
      channelLayout: freezed == channelLayout
          ? _value.channelLayout
          : channelLayout // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTags: freezed == metaTags
          ? _value.metaTags
          : metaTags // ignore: cast_nullable_to_non_nullable
              as MetaTags?,
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

  @override
  @pragma('vm:prefer-inline')
  $MetaTagsCopyWith<$Res>? get metaTags {
    if (_value.metaTags == null) {
      return null;
    }

    return $MetaTagsCopyWith<$Res>(_value.metaTags!, (value) {
      return _then(_value.copyWith(metaTags: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$AudioFileImplCopyWith<$Res>
    implements $AudioFileCopyWith<$Res> {
  factory _$$AudioFileImplCopyWith(
          _$AudioFileImpl value, $Res Function(_$AudioFileImpl) then) =
      __$$AudioFileImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {int? index,
      String? ino,
      FileMetadata? metadata,
      int? addedAt,
      int? updatedAt,
      String? format,
      double? duration,
      int? bitRate,
      String? language,
      String? codec,
      String? timeBase,
      int? channels,
      String? channelLayout,
      String? mimeType,
      MetaTags? metaTags});

  @override
  $FileMetadataCopyWith<$Res>? get metadata;
  @override
  $MetaTagsCopyWith<$Res>? get metaTags;
}

/// @nodoc
class __$$AudioFileImplCopyWithImpl<$Res>
    extends _$AudioFileCopyWithImpl<$Res, _$AudioFileImpl>
    implements _$$AudioFileImplCopyWith<$Res> {
  __$$AudioFileImplCopyWithImpl(
      _$AudioFileImpl _value, $Res Function(_$AudioFileImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? index = freezed,
    Object? ino = freezed,
    Object? metadata = freezed,
    Object? addedAt = freezed,
    Object? updatedAt = freezed,
    Object? format = freezed,
    Object? duration = freezed,
    Object? bitRate = freezed,
    Object? language = freezed,
    Object? codec = freezed,
    Object? timeBase = freezed,
    Object? channels = freezed,
    Object? channelLayout = freezed,
    Object? mimeType = freezed,
    Object? metaTags = freezed,
  }) {
    return _then(_$AudioFileImpl(
      index: freezed == index
          ? _value.index
          : index // ignore: cast_nullable_to_non_nullable
              as int?,
      ino: freezed == ino
          ? _value.ino
          : ino // ignore: cast_nullable_to_non_nullable
              as String?,
      metadata: freezed == metadata
          ? _value.metadata
          : metadata // ignore: cast_nullable_to_non_nullable
              as FileMetadata?,
      addedAt: freezed == addedAt
          ? _value.addedAt
          : addedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      updatedAt: freezed == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int?,
      format: freezed == format
          ? _value.format
          : format // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: freezed == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double?,
      bitRate: freezed == bitRate
          ? _value.bitRate
          : bitRate // ignore: cast_nullable_to_non_nullable
              as int?,
      language: freezed == language
          ? _value.language
          : language // ignore: cast_nullable_to_non_nullable
              as String?,
      codec: freezed == codec
          ? _value.codec
          : codec // ignore: cast_nullable_to_non_nullable
              as String?,
      timeBase: freezed == timeBase
          ? _value.timeBase
          : timeBase // ignore: cast_nullable_to_non_nullable
              as String?,
      channels: freezed == channels
          ? _value.channels
          : channels // ignore: cast_nullable_to_non_nullable
              as int?,
      channelLayout: freezed == channelLayout
          ? _value.channelLayout
          : channelLayout // ignore: cast_nullable_to_non_nullable
              as String?,
      mimeType: freezed == mimeType
          ? _value.mimeType
          : mimeType // ignore: cast_nullable_to_non_nullable
              as String?,
      metaTags: freezed == metaTags
          ? _value.metaTags
          : metaTags // ignore: cast_nullable_to_non_nullable
              as MetaTags?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$AudioFileImpl implements _AudioFile {
  const _$AudioFileImpl(
      {required this.index,
      required this.ino,
      this.metadata,
      this.addedAt,
      this.updatedAt,
      this.format,
      this.duration,
      this.bitRate,
      this.language,
      this.codec,
      this.timeBase,
      this.channels,
      this.channelLayout,
      this.mimeType,
      this.metaTags});

  factory _$AudioFileImpl.fromJson(Map<String, dynamic> json) =>
      _$$AudioFileImplFromJson(json);

  @override
  final int? index;
  @override
  final String? ino;
  @override
  final FileMetadata? metadata;
  @override
  final int? addedAt;
  @override
  final int? updatedAt;
  @override
  final String? format;
  @override
  final double? duration;
  @override
  final int? bitRate;
  @override
  final String? language;
  @override
  final String? codec;
  @override
  final String? timeBase;
  @override
  final int? channels;
  @override
  final String? channelLayout;
  @override
  final String? mimeType;
  @override
  final MetaTags? metaTags;

  @override
  String toString() {
    return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, mimeType: $mimeType, metaTags: $metaTags)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$AudioFileImpl &&
            (identical(other.index, index) || other.index == index) &&
            (identical(other.ino, ino) || other.ino == ino) &&
            (identical(other.metadata, metadata) ||
                other.metadata == metadata) &&
            (identical(other.addedAt, addedAt) || other.addedAt == addedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.format, format) || other.format == format) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.bitRate, bitRate) || other.bitRate == bitRate) &&
            (identical(other.language, language) ||
                other.language == language) &&
            (identical(other.codec, codec) || other.codec == codec) &&
            (identical(other.timeBase, timeBase) ||
                other.timeBase == timeBase) &&
            (identical(other.channels, channels) ||
                other.channels == channels) &&
            (identical(other.channelLayout, channelLayout) ||
                other.channelLayout == channelLayout) &&
            (identical(other.mimeType, mimeType) ||
                other.mimeType == mimeType) &&
            (identical(other.metaTags, metaTags) ||
                other.metaTags == metaTags));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      index,
      ino,
      metadata,
      addedAt,
      updatedAt,
      format,
      duration,
      bitRate,
      language,
      codec,
      timeBase,
      channels,
      channelLayout,
      mimeType,
      metaTags);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$AudioFileImplCopyWith<_$AudioFileImpl> get copyWith =>
      __$$AudioFileImplCopyWithImpl<_$AudioFileImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$AudioFileImplToJson(
      this,
    );
  }
}

abstract class _AudioFile implements AudioFile {
  const factory _AudioFile(
      {required final int? index,
      required final String? ino,
      final FileMetadata? metadata,
      final int? addedAt,
      final int? updatedAt,
      final String? format,
      final double? duration,
      final int? bitRate,
      final String? language,
      final String? codec,
      final String? timeBase,
      final int? channels,
      final String? channelLayout,
      final String? mimeType,
      final MetaTags? metaTags}) = _$AudioFileImpl;

  factory _AudioFile.fromJson(Map<String, dynamic> json) =
      _$AudioFileImpl.fromJson;

  @override
  int? get index;
  @override
  String? get ino;
  @override
  FileMetadata? get metadata;
  @override
  int? get addedAt;
  @override
  int? get updatedAt;
  @override
  String? get format;
  @override
  double? get duration;
  @override
  int? get bitRate;
  @override
  String? get language;
  @override
  String? get codec;
  @override
  String? get timeBase;
  @override
  int? get channels;
  @override
  String? get channelLayout;
  @override
  String? get mimeType;
  @override
  MetaTags? get metaTags;
  @override
  @JsonKey(ignore: true)
  _$$AudioFileImplCopyWith<_$AudioFileImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
