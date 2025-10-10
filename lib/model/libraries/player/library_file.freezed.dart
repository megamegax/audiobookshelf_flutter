// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'library_file.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LibraryFile {

 String get ino; FileMetadata? get metadata; String get isSupplementary; int get addedAt; int? get updatedAt; String? get fileType;
/// Create a copy of LibraryFile
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LibraryFileCopyWith<LibraryFile> get copyWith => _$LibraryFileCopyWithImpl<LibraryFile>(this as LibraryFile, _$identity);

  /// Serializes this LibraryFile to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LibraryFile&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.isSupplementary, isSupplementary) || other.isSupplementary == isSupplementary)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ino,metadata,isSupplementary,addedAt,updatedAt,fileType);

@override
String toString() {
  return 'LibraryFile(ino: $ino, metadata: $metadata, isSupplementary: $isSupplementary, addedAt: $addedAt, updatedAt: $updatedAt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class $LibraryFileCopyWith<$Res>  {
  factory $LibraryFileCopyWith(LibraryFile value, $Res Function(LibraryFile) _then) = _$LibraryFileCopyWithImpl;
@useResult
$Res call({
 String ino, FileMetadata? metadata, String isSupplementary, int addedAt, int? updatedAt, String? fileType
});


$FileMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class _$LibraryFileCopyWithImpl<$Res>
    implements $LibraryFileCopyWith<$Res> {
  _$LibraryFileCopyWithImpl(this._self, this._then);

  final LibraryFile _self;
  final $Res Function(LibraryFile) _then;

/// Create a copy of LibraryFile
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? ino = null,Object? metadata = freezed,Object? isSupplementary = null,Object? addedAt = null,Object? updatedAt = freezed,Object? fileType = freezed,}) {
  return _then(_self.copyWith(
ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,isSupplementary: null == isSupplementary ? _self.isSupplementary : isSupplementary // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of LibraryFile
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
}
}


/// Adds pattern-matching-related methods to [LibraryFile].
extension LibraryFilePatterns on LibraryFile {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LibraryFile value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LibraryFile() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LibraryFile value)  $default,){
final _that = this;
switch (_that) {
case _LibraryFile():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LibraryFile value)?  $default,){
final _that = this;
switch (_that) {
case _LibraryFile() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String ino,  FileMetadata? metadata,  String isSupplementary,  int addedAt,  int? updatedAt,  String? fileType)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LibraryFile() when $default != null:
return $default(_that.ino,_that.metadata,_that.isSupplementary,_that.addedAt,_that.updatedAt,_that.fileType);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String ino,  FileMetadata? metadata,  String isSupplementary,  int addedAt,  int? updatedAt,  String? fileType)  $default,) {final _that = this;
switch (_that) {
case _LibraryFile():
return $default(_that.ino,_that.metadata,_that.isSupplementary,_that.addedAt,_that.updatedAt,_that.fileType);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String ino,  FileMetadata? metadata,  String isSupplementary,  int addedAt,  int? updatedAt,  String? fileType)?  $default,) {final _that = this;
switch (_that) {
case _LibraryFile() when $default != null:
return $default(_that.ino,_that.metadata,_that.isSupplementary,_that.addedAt,_that.updatedAt,_that.fileType);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LibraryFile implements LibraryFile {
  const _LibraryFile({required this.ino, this.metadata, required this.isSupplementary, required this.addedAt, this.updatedAt, this.fileType});
  factory _LibraryFile.fromJson(Map<String, dynamic> json) => _$LibraryFileFromJson(json);

@override final  String ino;
@override final  FileMetadata? metadata;
@override final  String isSupplementary;
@override final  int addedAt;
@override final  int? updatedAt;
@override final  String? fileType;

/// Create a copy of LibraryFile
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LibraryFileCopyWith<_LibraryFile> get copyWith => __$LibraryFileCopyWithImpl<_LibraryFile>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LibraryFileToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LibraryFile&&(identical(other.ino, ino) || other.ino == ino)&&(identical(other.metadata, metadata) || other.metadata == metadata)&&(identical(other.isSupplementary, isSupplementary) || other.isSupplementary == isSupplementary)&&(identical(other.addedAt, addedAt) || other.addedAt == addedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.fileType, fileType) || other.fileType == fileType));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,ino,metadata,isSupplementary,addedAt,updatedAt,fileType);

@override
String toString() {
  return 'LibraryFile(ino: $ino, metadata: $metadata, isSupplementary: $isSupplementary, addedAt: $addedAt, updatedAt: $updatedAt, fileType: $fileType)';
}


}

/// @nodoc
abstract mixin class _$LibraryFileCopyWith<$Res> implements $LibraryFileCopyWith<$Res> {
  factory _$LibraryFileCopyWith(_LibraryFile value, $Res Function(_LibraryFile) _then) = __$LibraryFileCopyWithImpl;
@override @useResult
$Res call({
 String ino, FileMetadata? metadata, String isSupplementary, int addedAt, int? updatedAt, String? fileType
});


@override $FileMetadataCopyWith<$Res>? get metadata;

}
/// @nodoc
class __$LibraryFileCopyWithImpl<$Res>
    implements _$LibraryFileCopyWith<$Res> {
  __$LibraryFileCopyWithImpl(this._self, this._then);

  final _LibraryFile _self;
  final $Res Function(_LibraryFile) _then;

/// Create a copy of LibraryFile
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? ino = null,Object? metadata = freezed,Object? isSupplementary = null,Object? addedAt = null,Object? updatedAt = freezed,Object? fileType = freezed,}) {
  return _then(_LibraryFile(
ino: null == ino ? _self.ino : ino // ignore: cast_nullable_to_non_nullable
as String,metadata: freezed == metadata ? _self.metadata : metadata // ignore: cast_nullable_to_non_nullable
as FileMetadata?,isSupplementary: null == isSupplementary ? _self.isSupplementary : isSupplementary // ignore: cast_nullable_to_non_nullable
as String,addedAt: null == addedAt ? _self.addedAt : addedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: freezed == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int?,fileType: freezed == fileType ? _self.fileType : fileType // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of LibraryFile
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
}
}


/// @nodoc
mixin _$FileMetadata {

 String? get filename; String? get ext; String? get path; String? get relPath; int? get size; int? get mtimeMs; int? get ctimeMs; int? get birthtimeMs;
/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$FileMetadataCopyWith<FileMetadata> get copyWith => _$FileMetadataCopyWithImpl<FileMetadata>(this as FileMetadata, _$identity);

  /// Serializes this FileMetadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is FileMetadata&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.size, size) || other.size == size)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,ext,path,relPath,size,mtimeMs,ctimeMs,birthtimeMs);

@override
String toString() {
  return 'FileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs)';
}


}

/// @nodoc
abstract mixin class $FileMetadataCopyWith<$Res>  {
  factory $FileMetadataCopyWith(FileMetadata value, $Res Function(FileMetadata) _then) = _$FileMetadataCopyWithImpl;
@useResult
$Res call({
 String? filename, String? ext, String? path, String? relPath, int? size, int? mtimeMs, int? ctimeMs, int? birthtimeMs
});




}
/// @nodoc
class _$FileMetadataCopyWithImpl<$Res>
    implements $FileMetadataCopyWith<$Res> {
  _$FileMetadataCopyWithImpl(this._self, this._then);

  final FileMetadata _self;
  final $Res Function(FileMetadata) _then;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? filename = freezed,Object? ext = freezed,Object? path = freezed,Object? relPath = freezed,Object? size = freezed,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,}) {
  return _then(_self.copyWith(
filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,ext: freezed == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,relPath: freezed == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,mtimeMs: freezed == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int?,ctimeMs: freezed == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int?,birthtimeMs: freezed == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}

}


/// Adds pattern-matching-related methods to [FileMetadata].
extension FileMetadataPatterns on FileMetadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _FileMetadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _FileMetadata value)  $default,){
final _that = this;
switch (_that) {
case _FileMetadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _FileMetadata value)?  $default,){
final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? filename,  String? ext,  String? path,  String? relPath,  int? size,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? filename,  String? ext,  String? path,  String? relPath,  int? size,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs)  $default,) {final _that = this;
switch (_that) {
case _FileMetadata():
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? filename,  String? ext,  String? path,  String? relPath,  int? size,  int? mtimeMs,  int? ctimeMs,  int? birthtimeMs)?  $default,) {final _that = this;
switch (_that) {
case _FileMetadata() when $default != null:
return $default(_that.filename,_that.ext,_that.path,_that.relPath,_that.size,_that.mtimeMs,_that.ctimeMs,_that.birthtimeMs);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _FileMetadata implements FileMetadata {
  const _FileMetadata({this.filename, this.ext, this.path, this.relPath, this.size, this.mtimeMs, this.ctimeMs, this.birthtimeMs});
  factory _FileMetadata.fromJson(Map<String, dynamic> json) => _$FileMetadataFromJson(json);

@override final  String? filename;
@override final  String? ext;
@override final  String? path;
@override final  String? relPath;
@override final  int? size;
@override final  int? mtimeMs;
@override final  int? ctimeMs;
@override final  int? birthtimeMs;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$FileMetadataCopyWith<_FileMetadata> get copyWith => __$FileMetadataCopyWithImpl<_FileMetadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$FileMetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _FileMetadata&&(identical(other.filename, filename) || other.filename == filename)&&(identical(other.ext, ext) || other.ext == ext)&&(identical(other.path, path) || other.path == path)&&(identical(other.relPath, relPath) || other.relPath == relPath)&&(identical(other.size, size) || other.size == size)&&(identical(other.mtimeMs, mtimeMs) || other.mtimeMs == mtimeMs)&&(identical(other.ctimeMs, ctimeMs) || other.ctimeMs == ctimeMs)&&(identical(other.birthtimeMs, birthtimeMs) || other.birthtimeMs == birthtimeMs));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,filename,ext,path,relPath,size,mtimeMs,ctimeMs,birthtimeMs);

@override
String toString() {
  return 'FileMetadata(filename: $filename, ext: $ext, path: $path, relPath: $relPath, size: $size, mtimeMs: $mtimeMs, ctimeMs: $ctimeMs, birthtimeMs: $birthtimeMs)';
}


}

/// @nodoc
abstract mixin class _$FileMetadataCopyWith<$Res> implements $FileMetadataCopyWith<$Res> {
  factory _$FileMetadataCopyWith(_FileMetadata value, $Res Function(_FileMetadata) _then) = __$FileMetadataCopyWithImpl;
@override @useResult
$Res call({
 String? filename, String? ext, String? path, String? relPath, int? size, int? mtimeMs, int? ctimeMs, int? birthtimeMs
});




}
/// @nodoc
class __$FileMetadataCopyWithImpl<$Res>
    implements _$FileMetadataCopyWith<$Res> {
  __$FileMetadataCopyWithImpl(this._self, this._then);

  final _FileMetadata _self;
  final $Res Function(_FileMetadata) _then;

/// Create a copy of FileMetadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? filename = freezed,Object? ext = freezed,Object? path = freezed,Object? relPath = freezed,Object? size = freezed,Object? mtimeMs = freezed,Object? ctimeMs = freezed,Object? birthtimeMs = freezed,}) {
  return _then(_FileMetadata(
filename: freezed == filename ? _self.filename : filename // ignore: cast_nullable_to_non_nullable
as String?,ext: freezed == ext ? _self.ext : ext // ignore: cast_nullable_to_non_nullable
as String?,path: freezed == path ? _self.path : path // ignore: cast_nullable_to_non_nullable
as String?,relPath: freezed == relPath ? _self.relPath : relPath // ignore: cast_nullable_to_non_nullable
as String?,size: freezed == size ? _self.size : size // ignore: cast_nullable_to_non_nullable
as int?,mtimeMs: freezed == mtimeMs ? _self.mtimeMs : mtimeMs // ignore: cast_nullable_to_non_nullable
as int?,ctimeMs: freezed == ctimeMs ? _self.ctimeMs : ctimeMs // ignore: cast_nullable_to_non_nullable
as int?,birthtimeMs: freezed == birthtimeMs ? _self.birthtimeMs : birthtimeMs // ignore: cast_nullable_to_non_nullable
as int?,
  ));
}


}

// dart format on
