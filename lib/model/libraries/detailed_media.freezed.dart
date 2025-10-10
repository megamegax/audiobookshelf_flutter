// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_media.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailedMedia {

 Metadata get metadata; String get coverPath; List<String>? get tags; List<AudioFile>? get audioFiles; List<BookChapter>? get chapters; List<Track>? get tracks; List<LibraryFile>? get libraryFiles; double? get duration; int? get size; EBookFile? get ebookFile;// Podcast-specific fields
 int? get numEpisodes; bool? get autoDownloadEpisodes; String? get autoDownloadSchedule; int? get lastEpisodeCheck; int? get maxEpisodesToKeep; int? get maxNewEpisodesToDownload;// Book-specific fields
 int? get numTracks; int? get numAudioFiles; int? get numChapters;
/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedMediaCopyWith<DetailedMedia> get copyWith => _$DetailedMediaCopyWithImpl<DetailedMedia>(this as DetailedMedia, _$identity);

  /// Serializes this DetailedMedia to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedMedia&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other.tags, tags)&&const DeepCollectionEquality().equals(other.audioFiles, audioFiles)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&const DeepCollectionEquality().equals(other.tracks, tracks)&&const DeepCollectionEquality().equals(other.libraryFiles, libraryFiles)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.ebookFile, ebookFile) || other.ebookFile == ebookFile)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.autoDownloadEpisodes, autoDownloadEpisodes) || other.autoDownloadEpisodes == autoDownloadEpisodes)&&(identical(other.autoDownloadSchedule, autoDownloadSchedule) || other.autoDownloadSchedule == autoDownloadSchedule)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&(identical(other.maxEpisodesToKeep, maxEpisodesToKeep) || other.maxEpisodesToKeep == maxEpisodesToKeep)&&(identical(other.maxNewEpisodesToDownload, maxNewEpisodesToDownload) || other.maxNewEpisodesToDownload == maxNewEpisodesToDownload)&&(identical(other.numTracks, numTracks) || other.numTracks == numTracks)&&(identical(other.numAudioFiles, numAudioFiles) || other.numAudioFiles == numAudioFiles)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,metadata,coverPath,const DeepCollectionEquality().hash(tags),const DeepCollectionEquality().hash(audioFiles),const DeepCollectionEquality().hash(chapters),const DeepCollectionEquality().hash(tracks),const DeepCollectionEquality().hash(libraryFiles),duration,size,ebookFile,numEpisodes,autoDownloadEpisodes,autoDownloadSchedule,lastEpisodeCheck,maxEpisodesToKeep,maxNewEpisodesToDownload,numTracks,numAudioFiles,numChapters]);

@override
String toString() {
  return 'DetailedMedia(metadata: $metadata, coverPath: $coverPath, tags: $tags, audioFiles: $audioFiles, chapters: $chapters, tracks: $tracks, libraryFiles: $libraryFiles, duration: $duration, size: $size, ebookFile: $ebookFile, numEpisodes: $numEpisodes, autoDownloadEpisodes: $autoDownloadEpisodes, autoDownloadSchedule: $autoDownloadSchedule, lastEpisodeCheck: $lastEpisodeCheck, maxEpisodesToKeep: $maxEpisodesToKeep, maxNewEpisodesToDownload: $maxNewEpisodesToDownload, numTracks: $numTracks, numAudioFiles: $numAudioFiles, numChapters: $numChapters)';
}


}

/// @nodoc
abstract mixin class $DetailedMediaCopyWith<$Res>  {
  factory $DetailedMediaCopyWith(DetailedMedia value, $Res Function(DetailedMedia) _then) = _$DetailedMediaCopyWithImpl;
@useResult
$Res call({
 Metadata metadata, String coverPath, List<String>? tags, List<AudioFile>? audioFiles, List<BookChapter>? chapters, List<Track>? tracks, List<LibraryFile>? libraryFiles, double? duration, int? size, EBookFile? ebookFile, int? numEpisodes, bool? autoDownloadEpisodes, String? autoDownloadSchedule, int? lastEpisodeCheck, int? maxEpisodesToKeep, int? maxNewEpisodesToDownload, int? numTracks, int? numAudioFiles, int? numChapters
});


$MetadataCopyWith<$Res> get metadata;$EBookFileCopyWith<$Res>? get ebookFile;

}
/// @nodoc
class _$DetailedMediaCopyWithImpl<$Res>
    implements $DetailedMediaCopyWith<$Res> {
  _$DetailedMediaCopyWithImpl(this._self, this._then);

  final DetailedMedia _self;
  final $Res Function(DetailedMedia) _then;

/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? metadata = null,Object? coverPath = null,Object? tags = freezed,Object? audioFiles = freezed,Object? chapters = freezed,Object? tracks = freezed,Object? libraryFiles = freezed,Object? duration = freezed,Object? size = freezed,Object? ebookFile = freezed,Object? numEpisodes = freezed,Object? autoDownloadEpisodes = freezed,Object? autoDownloadSchedule = freezed,Object? lastEpisodeCheck = freezed,Object? maxEpisodesToKeep = freezed,Object? maxNewEpisodesToDownload = freezed,Object? numTracks = freezed,Object? numAudioFiles = freezed,Object? numChapters = freezed,}) {
  return _then(_self.copyWith(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,coverPath: null == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self.tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,audioFiles: freezed == audioFiles ? _self.audioFiles : audioFiles // ignore: cast_nullable_to_non_nullable
as List<AudioFile>?,chapters: freezed == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,tracks: freezed == tracks ? _self.tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<Track>?,libraryFiles: freezed == libraryFiles ? _self.libraryFiles : libraryFiles // ignore: cast_nullable_to_non_nullable
as List<LibraryFile>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,ebookFile: freezed == ebookFile ? _self.ebookFile : ebookFile // ignore: cast_nullable_to_non_nullable
as EBookFile?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,autoDownloadEpisodes: freezed == autoDownloadEpisodes ? _self.autoDownloadEpisodes : autoDownloadEpisodes // ignore: cast_nullable_to_non_nullable
as bool?,autoDownloadSchedule: freezed == autoDownloadSchedule ? _self.autoDownloadSchedule : autoDownloadSchedule // ignore: cast_nullable_to_non_nullable
as String?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as int?,maxEpisodesToKeep: freezed == maxEpisodesToKeep ? _self.maxEpisodesToKeep : maxEpisodesToKeep // ignore: cast_nullable_to_non_nullable
as int?,maxNewEpisodesToDownload: freezed == maxNewEpisodesToDownload ? _self.maxNewEpisodesToDownload : maxNewEpisodesToDownload // ignore: cast_nullable_to_non_nullable
as int?,numTracks: freezed == numTracks ? _self.numTracks : numTracks // ignore: cast_nullable_to_non_nullable
as int?,numAudioFiles: freezed == numAudioFiles ? _self.numAudioFiles : numAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}
/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EBookFileCopyWith<$Res>? get ebookFile {
    if (_self.ebookFile == null) {
    return null;
  }

  return $EBookFileCopyWith<$Res>(_self.ebookFile!, (value) {
    return _then(_self.copyWith(ebookFile: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailedMedia].
extension DetailedMediaPatterns on DetailedMedia {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedMedia value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedMedia() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedMedia value)  $default,){
final _that = this;
switch (_that) {
case _DetailedMedia():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedMedia value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedMedia() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( Metadata metadata,  String coverPath,  List<String>? tags,  List<AudioFile>? audioFiles,  List<BookChapter>? chapters,  List<Track>? tracks,  List<LibraryFile>? libraryFiles,  double? duration,  int? size,  EBookFile? ebookFile,  int? numEpisodes,  bool? autoDownloadEpisodes,  String? autoDownloadSchedule,  int? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload,  int? numTracks,  int? numAudioFiles,  int? numChapters)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedMedia() when $default != null:
return $default(_that.metadata,_that.coverPath,_that.tags,_that.audioFiles,_that.chapters,_that.tracks,_that.libraryFiles,_that.duration,_that.size,_that.ebookFile,_that.numEpisodes,_that.autoDownloadEpisodes,_that.autoDownloadSchedule,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload,_that.numTracks,_that.numAudioFiles,_that.numChapters);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( Metadata metadata,  String coverPath,  List<String>? tags,  List<AudioFile>? audioFiles,  List<BookChapter>? chapters,  List<Track>? tracks,  List<LibraryFile>? libraryFiles,  double? duration,  int? size,  EBookFile? ebookFile,  int? numEpisodes,  bool? autoDownloadEpisodes,  String? autoDownloadSchedule,  int? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload,  int? numTracks,  int? numAudioFiles,  int? numChapters)  $default,) {final _that = this;
switch (_that) {
case _DetailedMedia():
return $default(_that.metadata,_that.coverPath,_that.tags,_that.audioFiles,_that.chapters,_that.tracks,_that.libraryFiles,_that.duration,_that.size,_that.ebookFile,_that.numEpisodes,_that.autoDownloadEpisodes,_that.autoDownloadSchedule,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload,_that.numTracks,_that.numAudioFiles,_that.numChapters);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( Metadata metadata,  String coverPath,  List<String>? tags,  List<AudioFile>? audioFiles,  List<BookChapter>? chapters,  List<Track>? tracks,  List<LibraryFile>? libraryFiles,  double? duration,  int? size,  EBookFile? ebookFile,  int? numEpisodes,  bool? autoDownloadEpisodes,  String? autoDownloadSchedule,  int? lastEpisodeCheck,  int? maxEpisodesToKeep,  int? maxNewEpisodesToDownload,  int? numTracks,  int? numAudioFiles,  int? numChapters)?  $default,) {final _that = this;
switch (_that) {
case _DetailedMedia() when $default != null:
return $default(_that.metadata,_that.coverPath,_that.tags,_that.audioFiles,_that.chapters,_that.tracks,_that.libraryFiles,_that.duration,_that.size,_that.ebookFile,_that.numEpisodes,_that.autoDownloadEpisodes,_that.autoDownloadSchedule,_that.lastEpisodeCheck,_that.maxEpisodesToKeep,_that.maxNewEpisodesToDownload,_that.numTracks,_that.numAudioFiles,_that.numChapters);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedMedia implements DetailedMedia {
  const _DetailedMedia({required this.metadata, required this.coverPath, final  List<String>? tags, final  List<AudioFile>? audioFiles, final  List<BookChapter>? chapters, final  List<Track>? tracks, final  List<LibraryFile>? libraryFiles, this.duration, this.size, this.ebookFile, this.numEpisodes, this.autoDownloadEpisodes, this.autoDownloadSchedule, this.lastEpisodeCheck, this.maxEpisodesToKeep, this.maxNewEpisodesToDownload, this.numTracks, this.numAudioFiles, this.numChapters}): _tags = tags,_audioFiles = audioFiles,_chapters = chapters,_tracks = tracks,_libraryFiles = libraryFiles;
  factory _DetailedMedia.fromJson(Map<String, dynamic> json) => _$DetailedMediaFromJson(json);

@override final  Metadata metadata;
@override final  String coverPath;
 final  List<String>? _tags;
@override List<String>? get tags {
  final value = _tags;
  if (value == null) return null;
  if (_tags is EqualUnmodifiableListView) return _tags;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<AudioFile>? _audioFiles;
@override List<AudioFile>? get audioFiles {
  final value = _audioFiles;
  if (value == null) return null;
  if (_audioFiles is EqualUnmodifiableListView) return _audioFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<BookChapter>? _chapters;
@override List<BookChapter>? get chapters {
  final value = _chapters;
  if (value == null) return null;
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<Track>? _tracks;
@override List<Track>? get tracks {
  final value = _tracks;
  if (value == null) return null;
  if (_tracks is EqualUnmodifiableListView) return _tracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<LibraryFile>? _libraryFiles;
@override List<LibraryFile>? get libraryFiles {
  final value = _libraryFiles;
  if (value == null) return null;
  if (_libraryFiles is EqualUnmodifiableListView) return _libraryFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  double? duration;
@override final  int? size;
@override final  EBookFile? ebookFile;
// Podcast-specific fields
@override final  int? numEpisodes;
@override final  bool? autoDownloadEpisodes;
@override final  String? autoDownloadSchedule;
@override final  int? lastEpisodeCheck;
@override final  int? maxEpisodesToKeep;
@override final  int? maxNewEpisodesToDownload;
// Book-specific fields
@override final  int? numTracks;
@override final  int? numAudioFiles;
@override final  int? numChapters;

/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedMediaCopyWith<_DetailedMedia> get copyWith => __$DetailedMediaCopyWithImpl<_DetailedMedia>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedMediaToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedMedia&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&const DeepCollectionEquality().equals(other._tags, _tags)&&const DeepCollectionEquality().equals(other._audioFiles, _audioFiles)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&const DeepCollectionEquality().equals(other._tracks, _tracks)&&const DeepCollectionEquality().equals(other._libraryFiles, _libraryFiles)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.size, size) || other.size == size)&&(identical(other.ebookFile, ebookFile) || other.ebookFile == ebookFile)&&(identical(other.numEpisodes, numEpisodes) || other.numEpisodes == numEpisodes)&&(identical(other.autoDownloadEpisodes, autoDownloadEpisodes) || other.autoDownloadEpisodes == autoDownloadEpisodes)&&(identical(other.autoDownloadSchedule, autoDownloadSchedule) || other.autoDownloadSchedule == autoDownloadSchedule)&&(identical(other.lastEpisodeCheck, lastEpisodeCheck) || other.lastEpisodeCheck == lastEpisodeCheck)&&(identical(other.maxEpisodesToKeep, maxEpisodesToKeep) || other.maxEpisodesToKeep == maxEpisodesToKeep)&&(identical(other.maxNewEpisodesToDownload, maxNewEpisodesToDownload) || other.maxNewEpisodesToDownload == maxNewEpisodesToDownload)&&(identical(other.numTracks, numTracks) || other.numTracks == numTracks)&&(identical(other.numAudioFiles, numAudioFiles) || other.numAudioFiles == numAudioFiles)&&(identical(other.numChapters, numChapters) || other.numChapters == numChapters));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,metadata,coverPath,const DeepCollectionEquality().hash(_tags),const DeepCollectionEquality().hash(_audioFiles),const DeepCollectionEquality().hash(_chapters),const DeepCollectionEquality().hash(_tracks),const DeepCollectionEquality().hash(_libraryFiles),duration,size,ebookFile,numEpisodes,autoDownloadEpisodes,autoDownloadSchedule,lastEpisodeCheck,maxEpisodesToKeep,maxNewEpisodesToDownload,numTracks,numAudioFiles,numChapters]);

@override
String toString() {
  return 'DetailedMedia(metadata: $metadata, coverPath: $coverPath, tags: $tags, audioFiles: $audioFiles, chapters: $chapters, tracks: $tracks, libraryFiles: $libraryFiles, duration: $duration, size: $size, ebookFile: $ebookFile, numEpisodes: $numEpisodes, autoDownloadEpisodes: $autoDownloadEpisodes, autoDownloadSchedule: $autoDownloadSchedule, lastEpisodeCheck: $lastEpisodeCheck, maxEpisodesToKeep: $maxEpisodesToKeep, maxNewEpisodesToDownload: $maxNewEpisodesToDownload, numTracks: $numTracks, numAudioFiles: $numAudioFiles, numChapters: $numChapters)';
}


}

/// @nodoc
abstract mixin class _$DetailedMediaCopyWith<$Res> implements $DetailedMediaCopyWith<$Res> {
  factory _$DetailedMediaCopyWith(_DetailedMedia value, $Res Function(_DetailedMedia) _then) = __$DetailedMediaCopyWithImpl;
@override @useResult
$Res call({
 Metadata metadata, String coverPath, List<String>? tags, List<AudioFile>? audioFiles, List<BookChapter>? chapters, List<Track>? tracks, List<LibraryFile>? libraryFiles, double? duration, int? size, EBookFile? ebookFile, int? numEpisodes, bool? autoDownloadEpisodes, String? autoDownloadSchedule, int? lastEpisodeCheck, int? maxEpisodesToKeep, int? maxNewEpisodesToDownload, int? numTracks, int? numAudioFiles, int? numChapters
});


@override $MetadataCopyWith<$Res> get metadata;@override $EBookFileCopyWith<$Res>? get ebookFile;

}
/// @nodoc
class __$DetailedMediaCopyWithImpl<$Res>
    implements _$DetailedMediaCopyWith<$Res> {
  __$DetailedMediaCopyWithImpl(this._self, this._then);

  final _DetailedMedia _self;
  final $Res Function(_DetailedMedia) _then;

/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? metadata = null,Object? coverPath = null,Object? tags = freezed,Object? audioFiles = freezed,Object? chapters = freezed,Object? tracks = freezed,Object? libraryFiles = freezed,Object? duration = freezed,Object? size = freezed,Object? ebookFile = freezed,Object? numEpisodes = freezed,Object? autoDownloadEpisodes = freezed,Object? autoDownloadSchedule = freezed,Object? lastEpisodeCheck = freezed,Object? maxEpisodesToKeep = freezed,Object? maxNewEpisodesToDownload = freezed,Object? numTracks = freezed,Object? numAudioFiles = freezed,Object? numChapters = freezed,}) {
  return _then(_DetailedMedia(
metadata: null == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as Metadata,coverPath: null == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String,tags: freezed == tags ? _self._tags : tags // ignore: cast_nullable_to_non_nullable
as List<String>?,audioFiles: freezed == audioFiles ? _self._audioFiles : audioFiles // ignore: cast_nullable_to_non_nullable
as List<AudioFile>?,chapters: freezed == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>?,tracks: freezed == tracks ? _self._tracks : tracks // ignore: cast_nullable_to_non_nullable
as List<Track>?,libraryFiles: freezed == libraryFiles ? _self._libraryFiles : libraryFiles // ignore: cast_nullable_to_non_nullable
as List<LibraryFile>?,duration: freezed == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,ebookFile: freezed == ebookFile ? _self.ebookFile : ebookFile // ignore: cast_nullable_to_non_nullable
as EBookFile?,numEpisodes: freezed == numEpisodes ? _self.numEpisodes : numEpisodes // ignore: cast_nullable_to_non_nullable
as int?,autoDownloadEpisodes: freezed == autoDownloadEpisodes ? _self.autoDownloadEpisodes : autoDownloadEpisodes // ignore: cast_nullable_to_non_nullable
as bool?,autoDownloadSchedule: freezed == autoDownloadSchedule ? _self.autoDownloadSchedule : autoDownloadSchedule // ignore: cast_nullable_to_non_nullable
as String?,lastEpisodeCheck: freezed == lastEpisodeCheck ? _self.lastEpisodeCheck : lastEpisodeCheck // ignore: cast_nullable_to_non_nullable
as int?,maxEpisodesToKeep: freezed == maxEpisodesToKeep ? _self.maxEpisodesToKeep : maxEpisodesToKeep // ignore: cast_nullable_to_non_nullable
as int?,maxNewEpisodesToDownload: freezed == maxNewEpisodesToDownload ? _self.maxNewEpisodesToDownload : maxNewEpisodesToDownload // ignore: cast_nullable_to_non_nullable
as int?,numTracks: freezed == numTracks ? _self.numTracks : numTracks // ignore: cast_nullable_to_non_nullable
as int?,numAudioFiles: freezed == numAudioFiles ? _self.numAudioFiles : numAudioFiles // ignore: cast_nullable_to_non_nullable
as int?,numChapters: freezed == numChapters ? _self.numChapters : numChapters // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MetadataCopyWith<$Res> get metadata {
  
  return $MetadataCopyWith<$Res>(_self.metadata, (value) {
    return _then(_self.copyWith(metadata: value));
  });
}/// Create a copy of DetailedMedia
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$EBookFileCopyWith<$Res>? get ebookFile {
    if (_self.ebookFile == null) {
    return null;
  }

  return $EBookFileCopyWith<$Res>(_self.ebookFile!, (value) {
    return _then(_self.copyWith(ebookFile: value));
  });
}
}

// dart format on
