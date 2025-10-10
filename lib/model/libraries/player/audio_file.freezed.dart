// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'audio_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$AudioFile {

 int? get index; String? get ino; FileMetadata? get metadata; int? get addedAt; int? get updatedAt; String? get format; double? get duration; int? get bitRate; String? get language; String? get codec; String? get timeBase; int? get channels; String? get channelLayout; String? get mimeType; MetaTags? get metaTags;
/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AudioFileCopyWith<AudioFile> get copyWith => _$AudioFileCopyWithImpl<AudioFile>(this as AudioFile, _$identity);

  /// Serializes this AudioFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AudioFile&&(identical(other.index, index) || other.index == index)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.format, format) || other.format == format)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,ino,metadata,addedAt,updatedAt,format,duration,bitRate,language,codec,timeBase,channels,channelLayout,mimeType,metaTags);

@override
String toString() {
  return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, mimeType: $mimeType, metaTags: $metaTags)';
}


}

/// @nodoc
abstract mixin class $AudioFileCopyWith<$Res>  {
  factory $AudioFileCopyWith(AudioFile value, $Res Function(AudioFile) _then) = _$AudioFileCopyWithImpl;
@useResult
$Res call({
 int? index, String? ino, FileMetadata? metadata, int? addedAt, int? updatedAt, String? format, double? duration, int? bitRate, String? language, String? codec, String? timeBase, int? channels, String? channelLayout, String? mimeType, MetaTags? metaTags
});


$FileMetadataCopyWith<$Res>? get metadata;$MetaTagsCopyWith<$Res>? get metaTags;

}
/// @nodoc
class _$AudioFileCopyWithImpl<$Res>
    implements $AudioFileCopyWith<$Res> {
  _$AudioFileCopyWithImpl(this._self, this._then);

  final AudioFile _self;
  final $Res Function(AudioFile) _then;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? index = freezed,Object? ino = freezed,Object? metadata = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? format = freezed,Object? duration = freezed,Object? bitRate = freezed,Object? language = freezed,Object? codec = freezed,Object? timeBase = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? mimeType = freezed,Object? metaTags = freezed,}) {
  return _then(_self.copyWith(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,timeBase: freezed == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,metaTags: freezed == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as MetaTags?,
  ));
}
/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $FileMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaTagsCopyWith<$Res>? get metaTags {
    if (_self.metaTags == null) {
    return null;
  }

  return $MetaTagsCopyWith<$Res>(_self.metaTags!, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}


/// Adds pattern-matching-related methods to [AudioFile].
extension AudioFilePatterns on AudioFile {
/// A variant of `map` that fallback to returning `orElse`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AudioFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// Callbacks receives the raw object, upcasted.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case final Subclass2 value:
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AudioFile value)  $default,){
final _that = this;
switch (_that) {
case _AudioFile():
return $default(_that);}
}
/// A variant of `map` that fallback to returning `null`.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case final Subclass value:
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AudioFile value)?  $default,){
final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that);case _:
  return null;

}
}
/// A variant of `when` that fallback to an `orElse` callback.
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return orElse();
/// }
/// ```

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( int? index,  String? ino,  FileMetadata? metadata,  int? addedAt,  int? updatedAt,  String? format,  double? duration,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  String? mimeType,  MetaTags? metaTags)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.mimeType,_that.metaTags);case _:
  return orElse();

}
}
/// A `switch`-like method, using callbacks.
///
/// As opposed to `map`, this offers destructuring.
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case Subclass2(:final field2):
///     return ...;
/// }
/// ```

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( int? index,  String? ino,  FileMetadata? metadata,  int? addedAt,  int? updatedAt,  String? format,  double? duration,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  String? mimeType,  MetaTags? metaTags)  $default,) {final _that = this;
switch (_that) {
case _AudioFile():
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.mimeType,_that.metaTags);}
}
/// A variant of `when` that fallback to returning `null`
///
/// It is equivalent to doing:
/// ```dart
/// switch (sealedClass) {
///   case Subclass(:final field):
///     return ...;
///   case _:
///     return null;
/// }
/// ```

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( int? index,  String? ino,  FileMetadata? metadata,  int? addedAt,  int? updatedAt,  String? format,  double? duration,  int? bitRate,  String? language,  String? codec,  String? timeBase,  int? channels,  String? channelLayout,  String? mimeType,  MetaTags? metaTags)?  $default,) {final _that = this;
switch (_that) {
case _AudioFile() when $default != null:
return $default(_that.index,_that.ino,_that.metadata,_that.addedAt,_that.updatedAt,_that.format,_that.duration,_that.bitRate,_that.language,_that.codec,_that.timeBase,_that.channels,_that.channelLayout,_that.mimeType,_that.metaTags);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _AudioFile implements AudioFile {
  const _AudioFile({required this.index, required this.ino, this.metadata, this.addedAt, this.updatedAt, this.format, this.duration, this.bitRate, this.language, this.codec, this.timeBase, this.channels, this.channelLayout, this.mimeType, this.metaTags});
  factory _AudioFile.fromJson(Map<String, dynamic> json) => _$AudioFileFromJson(json);

@override final  int? index;
@override final  String? ino;
@override final  FileMetadata? metadata;
@override final  int? addedAt;
@override final  int? updatedAt;
@override final  String? format;
@override final  double? duration;
@override final  int? bitRate;
@override final  String? language;
@override final  String? codec;
@override final  String? timeBase;
@override final  int? channels;
@override final  String? channelLayout;
@override final  String? mimeType;
@override final  MetaTags? metaTags;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AudioFileCopyWith<_AudioFile> get copyWith => __$AudioFileCopyWithImpl<_AudioFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$AudioFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AudioFile&&(identical(other.index, index) || other.index == index)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.format, format) || other.format == format)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.bitRate, bitRate) || other.bitRate == bitRate)&&(identical(other.language, language) || other.language == language)&&(identical(other.codec, codec) || other.codec == codec)&&(identical(other.timeBase, timeBase) || other.timeBase == timeBase)&&(identical(other.channels, channels) || other.channels == channels)&&(identical(other.channelLayout, channelLayout) || other.channelLayout == channelLayout)&&(identical(other.mimeType, mimeType) || other.mimeType == mimeType)&&(identical(other.metaTags, metaTags) || other.metaTags == metaTags));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,index,ino,metadata,addedAt,updatedAt,format,duration,bitRate,language,codec,timeBase,channels,channelLayout,mimeType,metaTags);

@override
String toString() {
  return 'AudioFile(index: $index, ino: $ino, metadata: $metadata, addedAt: $addedAt, updatedAt: $updatedAt, format: $format, duration: $duration, bitRate: $bitRate, language: $language, codec: $codec, timeBase: $timeBase, channels: $channels, channelLayout: $channelLayout, mimeType: $mimeType, metaTags: $metaTags)';
}


}

/// @nodoc
abstract mixin class _$AudioFileCopyWith<$Res> implements $AudioFileCopyWith<$Res> {
  factory _$AudioFileCopyWith(_AudioFile value, $Res Function(_AudioFile) _then) = __$AudioFileCopyWithImpl;
@override @useResult
$Res call({
 int? index, String? ino, FileMetadata? metadata, int? addedAt, int? updatedAt, String? format, double? duration, int? bitRate, String? language, String? codec, String? timeBase, int? channels, String? channelLayout, String? mimeType, MetaTags? metaTags
});


@override $FileMetadataCopyWith<$Res>? get metadata;@override $MetaTagsCopyWith<$Res>? get metaTags;

}
/// @nodoc
class __$AudioFileCopyWithImpl<$Res>
    implements _$AudioFileCopyWith<$Res> {
  __$AudioFileCopyWithImpl(this._self, this._then);

  final _AudioFile _self;
  final $Res Function(_AudioFile) _then;

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? index = freezed,Object? ino = freezed,Object? metadata = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? format = freezed,Object? duration = freezed,Object? bitRate = freezed,Object? language = freezed,Object? codec = freezed,Object? timeBase = freezed,Object? channels = freezed,Object? channelLayout = freezed,Object? mimeType = freezed,Object? metaTags = freezed,}) {
  return _then(_AudioFile(
index: freezed == index ? _self.index : index // ignore: cast_nullable_to_non_nullable
as int?,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,format: freezed == format ? _self.format : format // ignore: cast_nullable_to_non_nullable
as String?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,bitRate: freezed == bitRate ? _self.bitRate : bitRate // ignore: cast_nullable_to_non_nullable
as int?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,codec: freezed == codec ? _self.codec : codec // ignore: cast_nullable_to_non_nullable
as String?,timeBase: freezed == timeBase ? _self.timeBase : timeBase // ignore: cast_nullable_to_non_nullable
as String?,channels: freezed == channels ? _self.channels : channels // ignore: cast_nullable_to_non_nullable
as int?,channelLayout: freezed == channelLayout ? _self.channelLayout : channelLayout // ignore: cast_nullable_to_non_nullable
as String?,mimeType: freezed == mimeType ? _self.mimeType : mimeType // ignore: cast_nullable_to_non_nullable
as String?,metaTags: freezed == metaTags ? _self.metaTags : metaTags // ignore: cast_nullable_to_non_nullable
as MetaTags?,
  ));
}

/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<$Res>? get metadata {
    if (_self.metadata == null) {
    return null;
  }

  return $FileMetadataCopyWith<$Res>(_self.metadata!, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of AudioFile
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetaTagsCopyWith<$Res>? get metaTags {
    if (_self.metaTags == null) {
    return null;
  }

  return $MetaTagsCopyWith<$Res>(_self.metaTags!, (value) {
    return _then(_self.copyWith(metaTags: value));
  });
}
}

// dart format on
