// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Media {

 Metadata get metadata; String? get coverPath;// ignore: invalid_annotation_target
@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? get coverBytes; List<String>? get tags; int? get numTracks; int? get numAudioFiles; int? get numChapters; int? get numMissingParts; int? get numInvalidAudioFiles; double? get duration; int? get size; String? get ebookFileFormat;
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MediaCopyWith<Media> get copyWith => _$MediaCopyWithImpl<Media>(this as Media, _$identity);

  /// Serializes this Media to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Media&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other.coverBytes, coverBytes)&&const DeepCollectionEquality().equals(other.tags, tags)&&(identical(other.numTracks, numTracks) || other.numTracks == numTracks)&&(identical(other.numAudioFiles, numAudioFiles) || other.numAudioFiles == numAudioFiles)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&(identical(other.numMissingParts, numMissingParts) || other.numMissingParts == numMissingParts)&&(identical(other.numInvalidAudioFiles, numInvalidAudioFiles) || other.numInvalidAudioFiles == numInvalidAudioFiles)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.ebookFileFormat, ebookFileFormat) || other.ebookFileFormat == ebookFileFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,coverPath,const DeepCollectionEquality().hash(coverBytes),const DeepCollectionEquality().hash(tags),numTracks,numAudioFiles,numChapters,numMissingParts,numInvalidAudioFiles,duration,size,ebookFileFormat);

@override
String toString() {
  return 'Media(metadata: $metadata, coverPath: $coverPath, coverBytes: $coverBytes, tags: $tags, numTracks: $numTracks, numAudioFiles: $numAudioFiles, numChapters: $numChapters, numMissingParts: $numMissingParts, numInvalidAudioFiles: $numInvalidAudioFiles, duration: $duration, size: $size, ebookFileFormat: $ebookFileFormat)';
}


}

/// @nodoc
abstract mixin class $MediaCopyWith<$Res>  {
  factory $MediaCopyWith(Media value, $Res Function(Media) _then) = _$MediaCopyWithImpl;
@useResult
$Res call({
 Metadata metadata, String? coverPath,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverBytes, List<String>? tags, int? numTracks, int? numAudioFiles, int? numChapters, int? numMissingParts, int? numInvalidAudioFiles, double? duration, int? size, String? ebookFileFormat
});


$MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class _$MediaCopyWithImpl<$Res>
    implements $MediaCopyWith<$Res> {
  _$MediaCopyWithImpl(this._self, this._then);

  final Media _self;
  final $Res Function(Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? coverPath = freezed,Object? coverBytes = freezed,Object? tags = freezed,Object? numTracks = freezed,Object? numAudioFiles = freezed,Object? numChapters = freezed,Object? numMissingParts = freezed,Object? numInvalidAudioFiles = freezed,Object? duration = freezed,Object? size = freezed,Object? ebookFileFormat = freezed,}) {
  return _then(_self.copyWith(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,coverBytes: freezed == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numTracks: freezed == numTracks ? _self.numTracks : numTracks // ignore: cast_nullable_to_non_nullable
as int?,numAudioFiles: freezed == numAudioFiles ? _self.numAudioFiles : numAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,numMissingParts: freezed == numMissingParts ? _self.numMissingParts : numMissingParts // ignore: cast_nullable_to_non_nullable
as int?,numInvalidAudioFiles: freezed == numInvalidAudioFiles ? _self.numInvalidAudioFiles : numInvalidAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,ebookFileFormat: freezed == ebookFileFormat ? _self.ebookFileFormat : ebookFileFormat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}


/// Adds pattern-matching-related methods to [Media].
extension MediaPatterns on Media {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Media value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Media() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Media value)  $default,){
final _that = this;
switch (_that) {
case _Media():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Media value)?  $default,){
final _that = this;
switch (_that) {
case _Media() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Metadata metadata,  String? coverPath, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverBytes,  List<String>? tags,  int? numTracks,  int? numAudioFiles,  int? numChapters,  int? numMissingParts,  int? numInvalidAudioFiles,  double? duration,  int? size,  String? ebookFileFormat)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.metadata,_that.coverPath,_that.coverBytes,_that.tags,_that.numTracks,_that.numAudioFiles,_that.numChapters,_that.numMissingParts,_that.numInvalidAudioFiles,_that.duration,_that.size,_that.ebookFileFormat);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Metadata metadata,  String? coverPath, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverBytes,  List<String>? tags,  int? numTracks,  int? numAudioFiles,  int? numChapters,  int? numMissingParts,  int? numInvalidAudioFiles,  double? duration,  int? size,  String? ebookFileFormat)  $default,) {final _that = this;
switch (_that) {
case _Media():
return $default(_that.metadata,_that.coverPath,_that.coverBytes,_that.tags,_that.numTracks,_that.numAudioFiles,_that.numChapters,_that.numMissingParts,_that.numInvalidAudioFiles,_that.duration,_that.size,_that.ebookFileFormat);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Metadata metadata,  String? coverPath, @JsonKey(includeFromJson: false, includeToJson: false)  Uint8List? coverBytes,  List<String>? tags,  int? numTracks,  int? numAudioFiles,  int? numChapters,  int? numMissingParts,  int? numInvalidAudioFiles,  double? duration,  int? size,  String? ebookFileFormat)?  $default,) {final _that = this;
switch (_that) {
case _Media() when $default != null:
return $default(_that.metadata,_that.coverPath,_that.coverBytes,_that.tags,_that.numTracks,_that.numAudioFiles,_that.numChapters,_that.numMissingParts,_that.numInvalidAudioFiles,_that.duration,_that.size,_that.ebookFileFormat);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Media implements Media {
  const _Media({required this.metadata, this.coverPath, @JsonKey(includeFromJson: false, includeToJson: false) this.coverBytes, final  List<String>? tags, this.numTracks, this.numAudioFiles, this.numChapters, this.numMissingParts, this.numInvalidAudioFiles, this.duration, this.size, this.ebookFileFormat}): _tags = tags;
  factory _Media.fromJson(Map<String, dynamic> json) => _$MediaFromJson(json);

@override final  Metadata metadata;
@override final  String? coverPath;
// ignore: invalid_annotation_target
@override@JsonKey(includeFromJson: false, includeToJson: false) final  Uint8List? coverBytes;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? numTracks;
@override final  int? numAudioFiles;
@override final  int? numChapters;
@override final  int? numMissingParts;
@override final  int? numInvalidAudioFiles;
@override final  double? duration;
@override final  int? size;
@override final  String? ebookFileFormat;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MediaCopyWith<_Media> get copyWith => __$MediaCopyWithImpl<_Media>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Media&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other.coverBytes, coverBytes)&&const DeepCollectionEquality().equals(other._tags, _tags)&&(identical(other.numTracks, numTracks) || other.numTracks == numTracks)&&(identical(other.numAudioFiles, numAudioFiles) || other.numAudioFiles == numAudioFiles)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters)&&(identical(other.numMissingParts, numMissingParts) || other.numMissingParts == numMissingParts)&&(identical(other.numInvalidAudioFiles, numInvalidAudioFiles) || other.numInvalidAudioFiles == numInvalidAudioFiles)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.ebookFileFormat, ebookFileFormat) || other.ebookFileFormat == ebookFileFormat));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,metadata,coverPath,const DeepCollectionEquality().hash(coverBytes),const DeepCollectionEquality().hash(_tags),numTracks,numAudioFiles,numChapters,numMissingParts,numInvalidAudioFiles,duration,size,ebookFileFormat);

@override
String toString() {
  return 'Media(metadata: $metadata, coverPath: $coverPath, coverBytes: $coverBytes, tags: $tags, numTracks: $numTracks, numAudioFiles: $numAudioFiles, numChapters: $numChapters, numMissingParts: $numMissingParts, numInvalidAudioFiles: $numInvalidAudioFiles, duration: $duration, size: $size, ebookFileFormat: $ebookFileFormat)';
}


}

/// @nodoc
abstract mixin class _$MediaCopyWith<$Res> implements $MediaCopyWith<$Res> {
  factory _$MediaCopyWith(_Media value, $Res Function(_Media) _then) = __$MediaCopyWithImpl;
@override @useResult
$Res call({
 Metadata metadata, String? coverPath,@JsonKey(includeFromJson: false, includeToJson: false) Uint8List? coverBytes, List<String>? tags, int? numTracks, int? numAudioFiles, int? numChapters, int? numMissingParts, int? numInvalidAudioFiles, double? duration, int? size, String? ebookFileFormat
});


@override $MetadataCopyWith<$Res> get metadata;

}
/// @nodoc
class __$MediaCopyWithImpl<$Res>
    implements _$MediaCopyWith<$Res> {
  __$MediaCopyWithImpl(this._self, this._then);

  final _Media _self;
  final $Res Function(_Media) _then;

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? coverPath = freezed,Object? coverBytes = freezed,Object? tags = freezed,Object? numTracks = freezed,Object? numAudioFiles = freezed,Object? numChapters = freezed,Object? numMissingParts = freezed,Object? numInvalidAudioFiles = freezed,Object? duration = freezed,Object? size = freezed,Object? ebookFileFormat = freezed,}) {
  return _then(_Media(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,coverBytes: freezed == coverBytes ? _self.coverBytes : coverBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,numTracks: freezed == numTracks ? _self.numTracks : numTracks // ignore: cast_nullable_to_non_nullable
as int?,numAudioFiles: freezed == numAudioFiles ? _self.numAudioFiles : numAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,numMissingParts: freezed == numMissingParts ? _self.numMissingParts : numMissingParts // ignore: cast_nullable_to_non_nullable
as int?,numInvalidAudioFiles: freezed == numInvalidAudioFiles ? _self.numInvalidAudioFiles : numInvalidAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,ebookFileFormat: freezed == ebookFileFormat ? _self.ebookFileFormat : ebookFileFormat // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of Media
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}
}

// dart format on
