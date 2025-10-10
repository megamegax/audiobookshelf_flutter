// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_item.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryItem {

 String get id; String? get ino; String get libraryId; String get folderId; String get path; String get relPath; bool get isFile; int? get mtimeMs; int? get ctimeMs; int? get birthtimeMs; int? get addedAt; int? get updatedAt; bool get isMissing; bool get isInvalid; String? get mediaType; Media get media; int? get numFiles; int? get size; CollapsedSeries? get collapsedSeries;
/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryItemCopyWith<LibraryItem> get copyWith => _$LibraryItemCopyWithImpl<LibraryItem>(this as LibraryItem, _$identity);

  /// Serializes this LibraryItem to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,isMissing,isInvalid,mediaType,media,numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'LibraryItem(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class $LibraryItemCopyWith<$Res>  {
  factory $LibraryItemCopyWith(LibraryItem value, $Res Function(LibraryItem) _then) = _$LibraryItemCopyWithImpl;
@useResult
$Res call({
 String id, String? ino, String libraryId, String folderId, String path, String relPath, bool isFile, int? mtimeMs, int? ctimeMs, int? birthtimeMs, int? addedAt, int? updatedAt, bool isMissing, bool isInvalid, String? mediaType, Media media, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


$MediaCopyWith<$Res> get media;$CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class _$LibraryItemCopyWithImpl<$Res>
    implements $LibraryItemCopyWith<$Res> {
  _$LibraryItemCopyWithImpl(this._self, this._then);

  final LibraryItem _self;
  final $Res Function(LibraryItem) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? ino = freezed,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = freezed,Object? media = null,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
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
as bool,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}
/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItem
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


/// Adds pattern-matching-related methods to [LibraryItem].
extension LibraryItemPatterns on LibraryItem {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryItem value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryItem value)  $default,){
final _that = this;
switch (_that) {
case _LibraryItem():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryItem value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String? mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String? mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)  $default,) {final _that = this;
switch (_that) {
case _LibraryItem():
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? ino,  String libraryId,  String folderId,  String path,  String relPath,  bool isFile,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs,  int? addedAt,  int? updatedAt,  bool isMissing,  bool isInvalid,  String? mediaType,  Media media,  int? numFiles,  int? size,  CollapsedSeries? collapsedSeries)?  $default,) {final _that = this;
switch (_that) {
case _LibraryItem() when $default != null:
return $default(_that.id,_that.ino,_that.libraryId,_that.folderId,_that.path,_that.relPath,_that.isFile,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs,_that.addedAt,_that.updatedAt,_that.isMissing,_that.isInvalid,_that.mediaType,_that.media,_that.numFiles,_that.size,_that.collapsedSeries);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryItem implements LibraryItem {
  const _LibraryItem({required this.id, required this.ino, required this.libraryId, required this.folderId, required this.path, required this.relPath, required this.isFile, required this.mtimeMs, required this.ctimeMs, required this.birthtimeMs, required this.addedAt, required this.updatedAt, required this.isMissing, required this.isInvalid, required this.mediaType, required this.media, required this.numFiles, required this.size, required this.collapsedSeries});
  factory _LibraryItem.fromJson(Map<String, dynamic> json) => _$LibraryItemFromJson(json);

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
@override final  String? mediaType;
@override final  Media media;
@override final  int? numFiles;
@override final  int? size;
@override final  CollapsedSeries? collapsedSeries;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryItemCopyWith<_LibraryItem> get copyWith => __$LibraryItemCopyWithImpl<_LibraryItem>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryItemToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryItem&&(identical(other.id, id) || other.id == id)&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.libraryId, libraryId) || other.libraryId == libraryId)&&(identical(other.folderId, folderId) || other.folderId == folderId)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.isFile, isFile) || other.isFile == isFile)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.isMissing, isMissing) || other.isMissing == isMissing)&&(identical(other.isInvalid, isInvalid) || other.isInvalid == isInvalid)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.media, media) || other.media == media)&&(identical(other.numFiles, numFiles) || other.numFiles == numFiles)&&(identical(other.size, size) || other.size == size)&&(identical(other.collapsedSeries, collapsedSeries) || other.collapsedSeries == collapsedSeries));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,ino,libraryId,folderId,path,relPath,isFile,mtimeMs,ctimeMs,birthtimeMs,addedAt,updatedAt,isMissing,isInvalid,mediaType,media,numFiles,size,collapsedSeries]);

@override
String toString() {
  return 'LibraryItem(id: $id, ino: $ino, libraryId: $libraryId, folderId: $folderId, path: $path, relPath: $relPath, isFile: $isFile, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs, addedAt: $addedAt, updatedAt: $updatedAt, isMissing: $isMissing, isInvalid: $isInvalid, mediaType: $mediaType, media: $media, numFiles: $numFiles, size: $size, collapsedSeries: $collapsedSeries)';
}


}

/// @nodoc
abstract mixin class _$LibraryItemCopyWith<$Res> implements $LibraryItemCopyWith<$Res> {
  factory _$LibraryItemCopyWith(_LibraryItem value, $Res Function(_LibraryItem) _then) = __$LibraryItemCopyWithImpl;
@override @useResult
$Res call({
 String id, String? ino, String libraryId, String folderId, String path, String relPath, bool isFile, int? mtimeMs, int? ctimeMs, int? birthtimeMs, int? addedAt, int? updatedAt, bool isMissing, bool isInvalid, String? mediaType, Media media, int? numFiles, int? size, CollapsedSeries? collapsedSeries
});


@override $MediaCopyWith<$Res> get media;@override $CollapsedSeriesCopyWith<$Res>? get collapsedSeries;

}
/// @nodoc
class __$LibraryItemCopyWithImpl<$Res>
    implements _$LibraryItemCopyWith<$Res> {
  __$LibraryItemCopyWithImpl(this._self, this._then);

  final _LibraryItem _self;
  final $Res Function(_LibraryItem) _then;

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? ino = freezed,Object? libraryId = null,Object? folderId = null,Object? path = null,Object? relPath = null,Object? isFile = null,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,Object? addedAt = freezed,Object? updatedAt = freezed,Object? isMissing = null,Object? isInvalid = null,Object? mediaType = freezed,Object? media = null,Object? numFiles = freezed,Object? size = freezed,Object? collapsedSeries = freezed,}) {
  return _then(_LibraryItem(
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
as bool,mediaType: freezed == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String?,media: null == media ? _self.media : media // ignore: cast_nullable_to_non_nullable
as Media,numFiles: freezed == numFiles ? _self.numFiles : numFiles // ignore: cast_nullable_to_non_nullable
as int?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,collapsedSeries: freezed == collapsedSeries ? _self.collapsedSeries : collapsedSeries // ignore: cast_nullable_to_non_nullable
as CollapsedSeries?,
  ));
}

/// Create a copy of LibraryItem
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$MediaCopyWith<$Res> get media {
  
  return $MediaCopyWith<$Res>(_self.media, (value) {
    return _then(_self.copyWith(media: value));
  });
}/// Create a copy of LibraryItem
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
