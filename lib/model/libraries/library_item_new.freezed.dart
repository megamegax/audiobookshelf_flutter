// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item_new.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$LibraryItemNew {

 String get id; String? get ino; String get libraryId; String get folderId; String get path; String get relPath; bool get isFile; int? get mtimeMs; int? get ctimeMs; int? get birthtimeMs; int? get addedAt; int? get updatedAt; bool get isMissing; bool get isInvalid; String get mediaType; Media get media;// Podcasts may not have these fields, so they remain nullable
 int? get numFiles; int? get size; CollapsedSeries? get collapsedSeries;
/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemNewCopyWith<LibraryItemNew> get copyWith => _$LibraryItemNewCopyWithImpl<LibraryItemNew>(this as LibraryItemNew, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItemNew&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,isMissing,isInvalid,mediaType,media,numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'LibraryItemNew(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class $LibraryItemNewCopyWith<$Res>  {
  factory $LibraryItemNewCopyWith(LibraryItemNew value, $Res Function(LibraryItemNew) _then) = _$LibraryItemNewCopyWithImpl;
@useResult
$Res call({
 String id, String? ino, String libraryId, String folderId, String path, String relPath, bool isFile, int? mtimeMs, int? ctimeMs, int? birthtimeMs, int? addedAt, int? updatedAt, bool isMissing, bool isInvalid, String mediaType, Media media, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


$MediaCopyWith<$Res> get media;$CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class _$LibraryItemNewCopyWithImpl<$Res>
    implements $LibraryItemNewCopyWith<$Res> {
  _$LibraryItemNewCopyWithImpl(this._self, this._then);

  final LibraryItemNew _self;
  final $Res Function(LibraryItemNew) _then;

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ino = freezed,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = null,Object? media = null,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,folderId: null == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,isFile: null == isFile ? _self.isFile : isFile // ignore: cast_nullable_to_non_nullable
as bool,mtimeMs: freezed == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int?,ctimeMs: freezed == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int?,birthtimeMs: freezed == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}
/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItemNew
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


/// Adds pattern-matching-related methods to [LibraryItemNew].
extension LibraryItemNewPatterns on LibraryItemNew {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>({TResult Function( _BookLibraryItemNew value)?  book,TResult Function( _PodcastLibraryItemNew value)?  podcast,required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookLibraryItemNew() when book != null:
return book(_that);case _PodcastLibraryItemNew() when podcast != null:
return podcast(_that);case _:
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

@optionalTypeArgs TResult map<TResult extends Object?>({required TResult Function( _BookLibraryItemNew value)  book,required TResult Function( _PodcastLibraryItemNew value)  podcast,}){
final _that = this;
switch (_that) {
case _BookLibraryItemNew():
return book(_that);case _PodcastLibraryItemNew():
return podcast(_that);}
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>({TResult? Function( _BookLibraryItemNew value)?  book,TResult? Function( _PodcastLibraryItemNew value)?  podcast,}){
final _that = this;
switch (_that) {
case _BookLibraryItemNew() when book != null:
return book(_that);case _PodcastLibraryItemNew() when podcast != null:
return podcast(_that);case _:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>({TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  book,TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  podcast,required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookLibraryItemNew() when book != null:
return book(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _PodcastLibraryItemNew() when podcast != null:
return podcast(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>({required TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)  book,required TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)  podcast,}) {final _that = this;
switch (_that) {
case _BookLibraryItemNew():
return book(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _PodcastLibraryItemNew():
return podcast(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>({TResult? Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  book,TResult? Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  podcast,}) {final _that = this;
switch (_that) {
case _BookLibraryItemNew() when book != null:
return book(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _PodcastLibraryItemNew() when podcast != null:
return podcast(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _:
  return null;

}
}

}

/// @nodoc


class _BookLibraryItemNew implements LibraryItemNew {
  const _BookLibraryItemNew({required this.id, this.ino, required this.libraryId, required this.folderId, required this.path, required this.relPath, required this.isFile, this.mtimeMs, this.ctimeMs, this.birthtimeMs, this.addedAt, this.updatedAt, required this.isMissing, required this.isInvalid, required this.mediaType, required this.media, this.numFiles, this.size, this.collapsedSeries});
  

@override final  String id;
@override final  String? ino;
@override final  String libraryId;
@override final  String folderId;
@override final  String path;
@override final  String relPath;
@override final  bool isFile;
@override final  int? mtimeMs;
@override final  int? ctimeMs;
@override final  int? birthtimeMs;
@override final  int? addedAt;
@override final  int? updatedAt;
@override final  bool isMissing;
@override final  bool isInvalid;
@override final  String mediaType;
@override final  Media media;
@override final  int? numFiles;
@override final  int? size;
@override final  CollapsedSeries? collapsedSeries;

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookLibraryItemNewCopyWith<_BookLibraryItemNew> get copyWith => __$BookLibraryItemNewCopyWithImpl<_BookLibraryItemNew>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookLibraryItemNew&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,isMissing,isInvalid,mediaType,media,numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'LibraryItemNew.book(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class _$BookLibraryItemNewCopyWith<$Res> implements $LibraryItemNewCopyWith<$Res> {
  factory _$BookLibraryItemNewCopyWith(_BookLibraryItemNew value, $Res Function(_BookLibraryItemNew) _then) = __$BookLibraryItemNewCopyWithImpl;
@override @useResult
$Res call({
 String id, String? ino, String libraryId, String folderId, String path, String relPath, bool isFile, int? mtimeMs, int? ctimeMs, int? birthtimeMs, int? addedAt, int? updatedAt, bool isMissing, bool isInvalid, String mediaType, Media media, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


@override $MediaCopyWith<$Res> get media;@override $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class __$BookLibraryItemNewCopyWithImpl<$Res>
    implements _$BookLibraryItemNewCopyWith<$Res> {
  __$BookLibraryItemNewCopyWithImpl(this._self, this._then);

  final _BookLibraryItemNew _self;
  final $Res Function(_BookLibraryItemNew) _then;

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ino = freezed,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = null,Object? media = null,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_BookLibraryItemNew(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,folderId: null == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,isFile: null == isFile ? _self.isFile : isFile // ignore: cast_nullable_to_non_nullable
as bool,mtimeMs: freezed == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int?,ctimeMs: freezed == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int?,birthtimeMs: freezed == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItemNew
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

/// @nodoc


class _PodcastLibraryItemNew implements LibraryItemNew {
  const _PodcastLibraryItemNew({required this.id, this.ino, required this.libraryId, required this.folderId, required this.path, required this.relPath, required this.isFile, this.mtimeMs, this.ctimeMs, this.birthtimeMs, this.addedAt, this.updatedAt, required this.isMissing, required this.isInvalid, required this.mediaType, required this.media, this.numFiles, this.size, this.collapsedSeries});
  

@override final  String id;
@override final  String? ino;
@override final  String libraryId;
@override final  String folderId;
@override final  String path;
@override final  String relPath;
@override final  bool isFile;
@override final  int? mtimeMs;
@override final  int? ctimeMs;
@override final  int? birthtimeMs;
@override final  int? addedAt;
@override final  int? updatedAt;
@override final  bool isMissing;
@override final  bool isInvalid;
@override final  String mediaType;
@override final  Media media;
// Podcasts may not have these fields, so they remain nullable
@override final  int? numFiles;
@override final  int? size;
@override final  CollapsedSeries? collapsedSeries;

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PodcastLibraryItemNewCopyWith<_PodcastLibraryItemNew> get copyWith => __$PodcastLibraryItemNewCopyWithImpl<_PodcastLibraryItemNew>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PodcastLibraryItemNew&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}


@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,isMissing,isInvalid,mediaType,media,numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'LibraryItemNew.podcast(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class _$PodcastLibraryItemNewCopyWith<$Res> implements $LibraryItemNewCopyWith<$Res> {
  factory _$PodcastLibraryItemNewCopyWith(_PodcastLibraryItemNew value, $Res Function(_PodcastLibraryItemNew) _then) = __$PodcastLibraryItemNewCopyWithImpl;
@override @useResult
$Res call({
 String id, String? ino, String libraryId, String folderId, String path, String relPath, bool isFile, int? mtimeMs, int? ctimeMs, int? birthtimeMs, int? addedAt, int? updatedAt, bool isMissing, bool isInvalid, String mediaType, Media media, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


@override $MediaCopyWith<$Res> get media;@override $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class __$PodcastLibraryItemNewCopyWithImpl<$Res>
    implements _$PodcastLibraryItemNewCopyWith<$Res> {
  __$PodcastLibraryItemNewCopyWithImpl(this._self, this._then);

  final _PodcastLibraryItemNew _self;
  final $Res Function(_PodcastLibraryItemNew) _then;

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ino = freezed,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = null,Object? media = null,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_PodcastLibraryItemNew(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,ino: freezed == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String?,libraryId: null == libraryId ? _self.libraryId : libraryId // ignore: cast_nullable_to_non_nullable
as String,folderId: null == folderId ? _self.folderId : folderId // ignore: cast_nullable_to_non_nullable
as String,path: null == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String,relPath: null == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String,isFile: null == isFile ? _self.isFile : isFile // ignore: cast_nullable_to_non_nullable
as bool,mtimeMs: freezed == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int?,ctimeMs: freezed == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int?,birthtimeMs: freezed == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int?,addedAt: freezed == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int?,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,isMissing: null == isMissing ? _self.isMissing : isMissing // ignore: cast_nullable_to_non_nullable
as bool,isInvalid: null == isInvalid ? _self.isInvalid : isInvalid // ignore: cast_nullable_to_non_nullable
as bool,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}

/// Create a copy of LibraryItemNew
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItemNew
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
