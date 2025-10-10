// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'detailed_library_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$DetailedLibraryItem {

 String get id; String get ino; String get libraryId; String get folderId; String get path; String get relPath; bool get isFile; int get mtimeMs; int get ctimeMs; int get birthtimeMs; int get addedAt; int get updatedAt; int? get lastScan; String? get scanVersion; bool get isMissing; bool get isInvalid; String get mediaType; DetailedMedia get media; List<FileMetadata>? get libraryFiles; int? get numFiles; int? get size; CollapsedSeries? get collapsedSeries;
/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<DetailedLibraryItem> get copyWith => _$DetailedLibraryItemCopyWithImpl<DetailedLibraryItem>(this as DetailedLibraryItem, _$identity);

  /// Serializes this DetailedLibraryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is DetailedLibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastScan, lastScan) || other.lastScan == lastScan)&&(identical(other.scanVersion, scanVersion) || other.scanVersion == scanVersion)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&const DeepCollectionEquality().equals(other.libraryFiles, libraryFiles)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,lastScan,scanVersion,isMissing,isInvalid,mediaType,media,const DeepCollectionEquality().hash(libraryFiles),numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'DetailedLibraryItem(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, lastScan: $lastScan, scanVersion: $scanVersion, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, libraryFiles: $libraryFiles, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class $DetailedLibraryItemCopyWith<$Res>  {
  factory $DetailedLibraryItemCopyWith(DetailedLibraryItem value, $Res Function(DetailedLibraryItem) _then) = _$DetailedLibraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String ino, String libraryId, String folderId, String path, String relPath, bool isFile, int mtimeMs, int ctimeMs, int birthtimeMs, int addedAt, int updatedAt, int? lastScan, String? scanVersion, bool isMissing, bool isInvalid, String mediaType, DetailedMedia media, List<FileMetadata>? libraryFiles, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


$DetailedMediaCopyWith<$Res> get media;$CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class _$DetailedLibraryItemCopyWithImpl<$Res>
    implements $DetailedLibraryItemCopyWith<$Res> {
  _$DetailedLibraryItemCopyWithImpl(this._self, this._then);

  final DetailedLibraryItem _self;
  final $Res Function(DetailedLibraryItem) _then;

/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ino = null,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = null,Object? ctimeMs = null,Object? birthtimeMs = null,Object? addedAt = null,Object? updatedAt = null,Object? lastScan = freezed,Object? scanVersion = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = null,Object? media = null,Object? libraryFiles = freezed,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,folderId: null == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,isFile: null == isFile ? _self.isFile : isFile // ignore: cast_nullable_to_non_nullable
as bool,mtimeMs: null == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int,ctimeMs: null == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int,birthtimeMs: null == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,lastScan: freezed == lastScan ? _self.lastScan : lastScan // ignore: cast_nullable_to_non_nullable
as int?,scanVersion: freezed == scanVersion ? _self.scanVersion : scanVersion // ignore: cast_nullable_to_non_nullable
as String?,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as DetailedMedia,libraryFiles: freezed == libraryFiles ? _self.libraryFiles : libraryFiles // ignore: cast_nullable_to_non_nullable
as List<FileMetadata>?,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}
/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedMediaCopyWith<$Res> get media {
  
  return $DetailedMediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedSeriesCopyWith<$Res>? get collapsedSeries {
    if (_self.collapsedSeries == null) {
    return null;
  }

  return $CollapsedSeriesCopyWith<$Res>(_self.collapsedSeries!, (value) {
    return _then(_self.copyWith(collapsedSeries: value));
  });
}
}


/// Adds pattern-matching-related methods to [DetailedLibraryItem].
extension DetailedLibraryItemPatterns on DetailedLibraryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _DetailedLibraryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _DetailedLibraryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _DetailedLibraryItem value)  $default,){
final _that = this;
switch (_that) {
case _DetailedLibraryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _DetailedLibraryItem value)?  $default,){
final _that = this;
switch (_that) {
case _DetailedLibraryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int mtimeMs,  int ctimeMs,  int birthtimeMs,  int addedAt,  int updatedAt,  int? lastScan,  String? scanVersion,  bool isMissing,  bool isInvalid,  String mediaType,  DetailedMedia media,  List<FileMetadata>? libraryFiles,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _DetailedLibraryItem() when $default != null:
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.lastScan,_that.scanVersion,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.libraryFiles,_that.numFiles,_that.size,_that.collapsedSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int mtimeMs,  int ctimeMs,  int birthtimeMs,  int addedAt,  int updatedAt,  int? lastScan,  String? scanVersion,  bool isMissing,  bool isInvalid,  String mediaType,  DetailedMedia media,  List<FileMetadata>? libraryFiles,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)  $default,) {final _that = this;
switch (_that) {
case _DetailedLibraryItem():
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.lastScan,_that.scanVersion,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.libraryFiles,_that.numFiles,_that.size,_that.collapsedSeries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int mtimeMs,  int ctimeMs,  int birthtimeMs,  int addedAt,  int updatedAt,  int? lastScan,  String? scanVersion,  bool isMissing,  bool isInvalid,  String mediaType,  DetailedMedia media,  List<FileMetadata>? libraryFiles,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  $default,) {final _that = this;
switch (_that) {
case _DetailedLibraryItem() when $default != null:
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.lastScan,_that.scanVersion,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.libraryFiles,_that.numFiles,_that.size,_that.collapsedSeries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _DetailedLibraryItem implements DetailedLibraryItem {
  const _DetailedLibraryItem({required this.id, required this.ino, required this.libraryId, required this.folderId, required this.path, required this.relPath, required this.isFile, required this.mtimeMs, required this.ctimeMs, required this.birthtimeMs, required this.addedAt, required this.updatedAt, this.lastScan, this.scanVersion, required this.isMissing, required this.isInvalid, required this.mediaType, required this.media, required final  List<FileMetadata>? libraryFiles, required this.numFiles, required this.size, required this.collapsedSeries}): _libraryFiles = libraryFiles;
  factory _DetailedLibraryItem.fromJson(Map<String, dynamic> json) => _$DetailedLibraryItemFromJson(json);

@override final  String id;
@override final  String ino;
@override final  String libraryId;
@override final  String folderId;
@override final  String path;
@override final  String relPath;
@override final  bool isFile;
@override final  int mtimeMs;
@override final  int ctimeMs;
@override final  int birthtimeMs;
@override final  int addedAt;
@override final  int updatedAt;
@override final  int? lastScan;
@override final  String? scanVersion;
@override final  bool isMissing;
@override final  bool isInvalid;
@override final  String mediaType;
@override final  DetailedMedia media;
 final  List<FileMetadata>? _libraryFiles;
@override List<FileMetadata>? get libraryFiles {
  final value = _libraryFiles;
  if (value == null) return null;
  if (_libraryFiles is EqualUnmodifiableListView) return _libraryFiles;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  int? numFiles;
@override final  int? size;
@override final  CollapsedSeries? collapsedSeries;

/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$DetailedLibraryItemCopyWith<_DetailedLibraryItem> get copyWith => __$DetailedLibraryItemCopyWithImpl<_DetailedLibraryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$DetailedLibraryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _DetailedLibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.lastScan, lastScan) || other.lastScan == lastScan)&&(identical(other.scanVersion, scanVersion) || other.scanVersion == scanVersion)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&const DeepCollectionEquality().equals(other._libraryFiles, _libraryFiles)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,lastScan,scanVersion,isMissing,isInvalid,mediaType,media,const DeepCollectionEquality().hash(_libraryFiles),numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'DetailedLibraryItem(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, lastScan: $lastScan, scanVersion: $scanVersion, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, libraryFiles: $libraryFiles, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class _$DetailedLibraryItemCopyWith<$Res> implements $DetailedLibraryItemCopyWith<$Res> {
  factory _$DetailedLibraryItemCopyWith(_DetailedLibraryItem value, $Res Function(_DetailedLibraryItem) _then) = __$DetailedLibraryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String ino, String libraryId, String folderId, String path, String relPath, bool isFile, int mtimeMs, int ctimeMs, int birthtimeMs, int addedAt, int updatedAt, int? lastScan, String? scanVersion, bool isMissing, bool isInvalid, String mediaType, DetailedMedia media, List<FileMetadata>? libraryFiles, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


@override $DetailedMediaCopyWith<$Res> get media;@override $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class __$DetailedLibraryItemCopyWithImpl<$Res>
    implements _$DetailedLibraryItemCopyWith<$Res> {
  __$DetailedLibraryItemCopyWithImpl(this._self, this._then);

  final _DetailedLibraryItem _self;
  final $Res Function(_DetailedLibraryItem) _then;

/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ino = null,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = null,Object? ctimeMs = null,Object? birthtimeMs = null,Object? addedAt = null,Object? updatedAt = null,Object? lastScan = freezed,Object? scanVersion = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = null,Object? media = null,Object? libraryFiles = freezed,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_DetailedLibraryItem(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,folderId: null == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,isFile: null == isFile ? _self.isFile : isFile // ignore: cast_nullable_to_non_nullable
as bool,mtimeMs: null == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int,ctimeMs: null == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int,birthtimeMs: null == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,lastScan: freezed == lastScan ? _self.lastScan : lastScan // ignore: cast_nullable_to_non_nullable
as int?,scanVersion: freezed == scanVersion ? _self.scanVersion : scanVersion // ignore: cast_nullable_to_non_nullable
as String?,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as DetailedMedia,libraryFiles: freezed == libraryFiles ? _self._libraryFiles : libraryFiles // ignore: cast_nullable_to_non_nullable
as List<FileMetadata>?,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}

/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedMediaCopyWith<$Res> get media {
  
  return $DetailedMediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of DetailedLibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$CollapsedSeriesCopyWith<$Res>? get collapsedSeries {
    if (_self.collapsedSeries == null) {
    return null;
  }

  return $CollapsedSeriesCopyWith<$Res>(_self.collapsedSeries!, (value) {
    return _then(_self.copyWith(collapsedSeries: value));
  });
}
}

// dart format on
