// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$PlaybackSession {

 String get id; String? get userId; String? get libraryItemId; String? get episodeId; String get mediaType;//MediaTypeMetadata mediaMetadata,
 DeviceInfoResponse get deviceInfo; List<BookChapter> get chapters; String? get displayTitle; String? get displayAuthor; String? get coverPath; double get duration; int get playMethod; int get startedAt; int get updatedAt; int get timeListening; List<AudioTrack> get audioTracks; double get currentTime; LibraryItemNew? get libraryItem;//LocalLibraryItem? localLibraryItem,
 String? get localEpisodeId; String? get serverConnectionConfigId; String? get serverAddress; String? get mediaPlayer;
/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$PlaybackSessionCopyWith<PlaybackSession> get copyWith => _$PlaybackSessionCopyWithImpl<PlaybackSession>(this as PlaybackSession, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is PlaybackSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&const DeepCollectionEquality().equals(other.chapters, chapters)&&(identical(other.displayTitle, displayTitle) || other.displayTitle == displayTitle)&&(identical(other.displayAuthor, displayAuthor) || other.displayAuthor == displayAuthor)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.playMethod, playMethod) || other.playMethod == playMethod)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&const DeepCollectionEquality().equals(other.audioTracks, audioTracks)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem)&&(identical(other.localEpisodeId, localEpisodeId) || other.localEpisodeId == localEpisodeId)&&(identical(other.serverConnectionConfigId, serverConnectionConfigId) || other.serverConnectionConfigId == serverConnectionConfigId)&&(identical(other.serverAddress, serverAddress) || other.serverAddress == serverAddress)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,libraryItemId,episodeId,mediaType,deviceInfo,const DeepCollectionEquality().hash(chapters),displayTitle,displayAuthor,coverPath,duration,playMethod,startedAt,updatedAt,timeListening,const DeepCollectionEquality().hash(audioTracks),currentTime,libraryItem,localEpisodeId,serverConnectionConfigId,serverAddress,mediaPlayer]);

@override
String toString() {
  return 'PlaybackSession(id: $id, userId: $userId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaType: $mediaType, deviceInfo: $deviceInfo, chapters: $chapters, displayTitle: $displayTitle, displayAuthor: $displayAuthor, coverPath: $coverPath, duration: $duration, playMethod: $playMethod, startedAt: $startedAt, updatedAt: $updatedAt, timeListening: $timeListening, audioTracks: $audioTracks, currentTime: $currentTime, libraryItem: $libraryItem, localEpisodeId: $localEpisodeId, serverConnectionConfigId: $serverConnectionConfigId, serverAddress: $serverAddress, mediaPlayer: $mediaPlayer)';
}


}

/// @nodoc
abstract mixin class $PlaybackSessionCopyWith<$Res>  {
  factory $PlaybackSessionCopyWith(PlaybackSession value, $Res Function(PlaybackSession) _then) = _$PlaybackSessionCopyWithImpl;
@useResult
$Res call({
 String id, String? userId, String? libraryItemId, String? episodeId, String mediaType, DeviceInfoResponse deviceInfo, List<BookChapter> chapters, String? displayTitle, String? displayAuthor, String? coverPath, double duration, int playMethod, int startedAt, int updatedAt, int timeListening, List<AudioTrack> audioTracks, double currentTime, LibraryItemNew? libraryItem, String? localEpisodeId, String? serverConnectionConfigId, String? serverAddress, String? mediaPlayer
});


$DeviceInfoResponseCopyWith<$Res> get deviceInfo;$LibraryItemNewCopyWith<$Res>? get libraryItem;

}
/// @nodoc
class _$PlaybackSessionCopyWithImpl<$Res>
    implements $PlaybackSessionCopyWith<$Res> {
  _$PlaybackSessionCopyWithImpl(this._self, this._then);

  final PlaybackSession _self;
  final $Res Function(PlaybackSession) _then;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = null,Object? userId = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,Object? mediaType = null,Object? deviceInfo = null,Object? chapters = null,Object? displayTitle = freezed,Object? displayAuthor = freezed,Object? coverPath = freezed,Object? duration = null,Object? playMethod = null,Object? startedAt = null,Object? updatedAt = null,Object? timeListening = null,Object? audioTracks = null,Object? currentTime = null,Object? libraryItem = freezed,Object? localEpisodeId = freezed,Object? serverConnectionConfigId = freezed,Object? serverAddress = freezed,Object? mediaPlayer = freezed,}) {
  return _then(_self.copyWith(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfoResponse,chapters: null == chapters ? _self.chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,displayTitle: freezed == displayTitle ? _self.displayTitle : displayTitle // ignore: cast_nullable_to_non_nullable
as String?,displayAuthor: freezed == displayAuthor ? _self.displayAuthor : displayAuthor // ignore: cast_nullable_to_non_nullable
as String?,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,playMethod: null == playMethod ? _self.playMethod : playMethod // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as int,audioTracks: null == audioTracks ? _self.audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double,libraryItem: freezed == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItemNew?,localEpisodeId: freezed == localEpisodeId ? _self.localEpisodeId : localEpisodeId // ignore: cast_nullable_to_non_nullable
as String?,serverConnectionConfigId: freezed == serverConnectionConfigId ? _self.serverConnectionConfigId : serverConnectionConfigId // ignore: cast_nullable_to_non_nullable
as String?,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as String?,mediaPlayer: freezed == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoResponseCopyWith<$Res> get deviceInfo {
  
  return $DeviceInfoResponseCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemNewCopyWith<$Res>? get libraryItem {
    if (_self.libraryItem == null) {
    return null;
  }

  return $LibraryItemNewCopyWith<$Res>(_self.libraryItem!, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [PlaybackSession].
extension PlaybackSessionPatterns on PlaybackSession {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _PlaybackSession value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _PlaybackSession value)  $default,){
final _that = this;
switch (_that) {
case _PlaybackSession():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _PlaybackSession value)?  $default,){
final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String id,  String? userId,  String? libraryItemId,  String? episodeId,  String mediaType,  DeviceInfoResponse deviceInfo,  List<BookChapter> chapters,  String? displayTitle,  String? displayAuthor,  String? coverPath,  double duration,  int playMethod,  int startedAt,  int updatedAt,  int timeListening,  List<AudioTrack> audioTracks,  double currentTime,  LibraryItemNew? libraryItem,  String? localEpisodeId,  String? serverConnectionConfigId,  String? serverAddress,  String? mediaPlayer)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.deviceInfo,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.startedAt,_that.updatedAt,_that.timeListening,_that.audioTracks,_that.currentTime,_that.libraryItem,_that.localEpisodeId,_that.serverConnectionConfigId,_that.serverAddress,_that.mediaPlayer);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String id,  String? userId,  String? libraryItemId,  String? episodeId,  String mediaType,  DeviceInfoResponse deviceInfo,  List<BookChapter> chapters,  String? displayTitle,  String? displayAuthor,  String? coverPath,  double duration,  int playMethod,  int startedAt,  int updatedAt,  int timeListening,  List<AudioTrack> audioTracks,  double currentTime,  LibraryItemNew? libraryItem,  String? localEpisodeId,  String? serverConnectionConfigId,  String? serverAddress,  String? mediaPlayer)  $default,) {final _that = this;
switch (_that) {
case _PlaybackSession():
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.deviceInfo,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.startedAt,_that.updatedAt,_that.timeListening,_that.audioTracks,_that.currentTime,_that.libraryItem,_that.localEpisodeId,_that.serverConnectionConfigId,_that.serverAddress,_that.mediaPlayer);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String id,  String? userId,  String? libraryItemId,  String? episodeId,  String mediaType,  DeviceInfoResponse deviceInfo,  List<BookChapter> chapters,  String? displayTitle,  String? displayAuthor,  String? coverPath,  double duration,  int playMethod,  int startedAt,  int updatedAt,  int timeListening,  List<AudioTrack> audioTracks,  double currentTime,  LibraryItemNew? libraryItem,  String? localEpisodeId,  String? serverConnectionConfigId,  String? serverAddress,  String? mediaPlayer)?  $default,) {final _that = this;
switch (_that) {
case _PlaybackSession() when $default != null:
return $default(_that.id,_that.userId,_that.libraryItemId,_that.episodeId,_that.mediaType,_that.deviceInfo,_that.chapters,_that.displayTitle,_that.displayAuthor,_that.coverPath,_that.duration,_that.playMethod,_that.startedAt,_that.updatedAt,_that.timeListening,_that.audioTracks,_that.currentTime,_that.libraryItem,_that.localEpisodeId,_that.serverConnectionConfigId,_that.serverAddress,_that.mediaPlayer);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable(createToJson: false)

class _PlaybackSession implements PlaybackSession {
  const _PlaybackSession({required this.id, this.userId, this.libraryItemId, this.episodeId, required this.mediaType, required this.deviceInfo, required final  List<BookChapter> chapters, this.displayTitle, this.displayAuthor, this.coverPath, required this.duration, required this.playMethod, required this.startedAt, required this.updatedAt, required this.timeListening, required final  List<AudioTrack> audioTracks, required this.currentTime, this.libraryItem, this.localEpisodeId, this.serverConnectionConfigId, this.serverAddress, this.mediaPlayer}): _chapters = chapters,_audioTracks = audioTracks;
  factory _PlaybackSession.fromJson(Map<String, dynamic> json) => _$PlaybackSessionFromJson(json);

@override final  String id;
@override final  String? userId;
@override final  String? libraryItemId;
@override final  String? episodeId;
@override final  String mediaType;
//MediaTypeMetadata mediaMetadata,
@override final  DeviceInfoResponse deviceInfo;
 final  List<BookChapter> _chapters;
@override List<BookChapter> get chapters {
  if (_chapters is EqualUnmodifiableListView) return _chapters;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_chapters);
}

@override final  String? displayTitle;
@override final  String? displayAuthor;
@override final  String? coverPath;
@override final  double duration;
@override final  int playMethod;
@override final  int startedAt;
@override final  int updatedAt;
@override final  int timeListening;
 final  List<AudioTrack> _audioTracks;
@override List<AudioTrack> get audioTracks {
  if (_audioTracks is EqualUnmodifiableListView) return _audioTracks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_audioTracks);
}

@override final  double currentTime;
@override final  LibraryItemNew? libraryItem;
//LocalLibraryItem? localLibraryItem,
@override final  String? localEpisodeId;
@override final  String? serverConnectionConfigId;
@override final  String? serverAddress;
@override final  String? mediaPlayer;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$PlaybackSessionCopyWith<_PlaybackSession> get copyWith => __$PlaybackSessionCopyWithImpl<_PlaybackSession>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _PlaybackSession&&(identical(other.id, id) || other.id == id)&&(identical(other.userId, userId) || other.userId == userId)&&(identical(other.libraryItemId, libraryItemId) || other.libraryItemId == libraryItemId)&&(identical(other.episodeId, episodeId) || other.episodeId == episodeId)&&(identical(other.mediaType, mediaType) || other.mediaType == mediaType)&&(identical(other.deviceInfo, deviceInfo) || other.deviceInfo == deviceInfo)&&const DeepCollectionEquality().equals(other._chapters, _chapters)&&(identical(other.displayTitle, displayTitle) || other.displayTitle == displayTitle)&&(identical(other.displayAuthor, displayAuthor) || other.displayAuthor == displayAuthor)&&(identical(other.coverPath, coverPath) || other.coverPath == coverPath)&&(identical(other.duration, duration) || other.duration == duration)&&(identical(other.playMethod, playMethod) || other.playMethod == playMethod)&&(identical(other.startedAt, startedAt) || other.startedAt == startedAt)&&(identical(other.updatedAt, updatedAt) || other.updatedAt == updatedAt)&&(identical(other.timeListening, timeListening) || other.timeListening == timeListening)&&const DeepCollectionEquality().equals(other._audioTracks, _audioTracks)&&(identical(other.currentTime, currentTime) || other.currentTime == currentTime)&&(identical(other.libraryItem, libraryItem) || other.libraryItem == libraryItem)&&(identical(other.localEpisodeId, localEpisodeId) || other.localEpisodeId == localEpisodeId)&&(identical(other.serverConnectionConfigId, serverConnectionConfigId) || other.serverConnectionConfigId == serverConnectionConfigId)&&(identical(other.serverAddress, serverAddress) || other.serverAddress == serverAddress)&&(identical(other.mediaPlayer, mediaPlayer) || other.mediaPlayer == mediaPlayer));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hashAll([runtimeType,id,userId,libraryItemId,episodeId,mediaType,deviceInfo,const DeepCollectionEquality().hash(_chapters),displayTitle,displayAuthor,coverPath,duration,playMethod,startedAt,updatedAt,timeListening,const DeepCollectionEquality().hash(_audioTracks),currentTime,libraryItem,localEpisodeId,serverConnectionConfigId,serverAddress,mediaPlayer]);

@override
String toString() {
  return 'PlaybackSession(id: $id, userId: $userId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaType: $mediaType, deviceInfo: $deviceInfo, chapters: $chapters, displayTitle: $displayTitle, displayAuthor: $displayAuthor, coverPath: $coverPath, duration: $duration, playMethod: $playMethod, startedAt: $startedAt, updatedAt: $updatedAt, timeListening: $timeListening, audioTracks: $audioTracks, currentTime: $currentTime, libraryItem: $libraryItem, localEpisodeId: $localEpisodeId, serverConnectionConfigId: $serverConnectionConfigId, serverAddress: $serverAddress, mediaPlayer: $mediaPlayer)';
}


}

/// @nodoc
abstract mixin class _$PlaybackSessionCopyWith<$Res> implements $PlaybackSessionCopyWith<$Res> {
  factory _$PlaybackSessionCopyWith(_PlaybackSession value, $Res Function(_PlaybackSession) _then) = __$PlaybackSessionCopyWithImpl;
@override @useResult
$Res call({
 String id, String? userId, String? libraryItemId, String? episodeId, String mediaType, DeviceInfoResponse deviceInfo, List<BookChapter> chapters, String? displayTitle, String? displayAuthor, String? coverPath, double duration, int playMethod, int startedAt, int updatedAt, int timeListening, List<AudioTrack> audioTracks, double currentTime, LibraryItemNew? libraryItem, String? localEpisodeId, String? serverConnectionConfigId, String? serverAddress, String? mediaPlayer
});


@override $DeviceInfoResponseCopyWith<$Res> get deviceInfo;@override $LibraryItemNewCopyWith<$Res>? get libraryItem;

}
/// @nodoc
class __$PlaybackSessionCopyWithImpl<$Res>
    implements _$PlaybackSessionCopyWith<$Res> {
  __$PlaybackSessionCopyWithImpl(this._self, this._then);

  final _PlaybackSession _self;
  final $Res Function(_PlaybackSession) _then;

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = null,Object? userId = freezed,Object? libraryItemId = freezed,Object? episodeId = freezed,Object? mediaType = null,Object? deviceInfo = null,Object? chapters = null,Object? displayTitle = freezed,Object? displayAuthor = freezed,Object? coverPath = freezed,Object? duration = null,Object? playMethod = null,Object? startedAt = null,Object? updatedAt = null,Object? timeListening = null,Object? audioTracks = null,Object? currentTime = null,Object? libraryItem = freezed,Object? localEpisodeId = freezed,Object? serverConnectionConfigId = freezed,Object? serverAddress = freezed,Object? mediaPlayer = freezed,}) {
  return _then(_PlaybackSession(
id: null == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String,userId: freezed == userId ? _self.userId : userId // ignore: cast_nullable_to_non_nullable
as String?,libraryItemId: freezed == libraryItemId ? _self.libraryItemId : libraryItemId // ignore: cast_nullable_to_non_nullable
as String?,episodeId: freezed == episodeId ? _self.episodeId : episodeId // ignore: cast_nullable_to_non_nullable
as String?,mediaType: null == mediaType ? _self.mediaType : mediaType // ignore: cast_nullable_to_non_nullable
as String,deviceInfo: null == deviceInfo ? _self.deviceInfo : deviceInfo // ignore: cast_nullable_to_non_nullable
as DeviceInfoResponse,chapters: null == chapters ? _self._chapters : chapters // ignore: cast_nullable_to_non_nullable
as List<BookChapter>,displayTitle: freezed == displayTitle ? _self.displayTitle : displayTitle // ignore: cast_nullable_to_non_nullable
as String?,displayAuthor: freezed == displayAuthor ? _self.displayAuthor : displayAuthor // ignore: cast_nullable_to_non_nullable
as String?,coverPath: freezed == coverPath ? _self.coverPath : coverPath // ignore: cast_nullable_to_non_nullable
as String?,duration: null == duration ? _self.duration : duration // ignore: cast_nullable_to_non_nullable
as double,playMethod: null == playMethod ? _self.playMethod : playMethod // ignore: cast_nullable_to_non_nullable
as int,startedAt: null == startedAt ? _self.startedAt : startedAt // ignore: cast_nullable_to_non_nullable
as int,updatedAt: null == updatedAt ? _self.updatedAt : updatedAt // ignore: cast_nullable_to_non_nullable
as int,timeListening: null == timeListening ? _self.timeListening : timeListening // ignore: cast_nullable_to_non_nullable
as int,audioTracks: null == audioTracks ? _self._audioTracks : audioTracks // ignore: cast_nullable_to_non_nullable
as List<AudioTrack>,currentTime: null == currentTime ? _self.currentTime : currentTime // ignore: cast_nullable_to_non_nullable
as double,libraryItem: freezed == libraryItem ? _self.libraryItem : libraryItem // ignore: cast_nullable_to_non_nullable
as LibraryItemNew?,localEpisodeId: freezed == localEpisodeId ? _self.localEpisodeId : localEpisodeId // ignore: cast_nullable_to_non_nullable
as String?,serverConnectionConfigId: freezed == serverConnectionConfigId ? _self.serverConnectionConfigId : serverConnectionConfigId // ignore: cast_nullable_to_non_nullable
as String?,serverAddress: freezed == serverAddress ? _self.serverAddress : serverAddress // ignore: cast_nullable_to_non_nullable
as String?,mediaPlayer: freezed == mediaPlayer ? _self.mediaPlayer : mediaPlayer // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DeviceInfoResponseCopyWith<$Res> get deviceInfo {
  
  return $DeviceInfoResponseCopyWith<$Res>(_self.deviceInfo, (value) {
    return _then(_self.copyWith(deviceInfo: value));
  });
}/// Create a copy of PlaybackSession
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$LibraryItemNewCopyWith<$Res>? get libraryItem {
    if (_self.libraryItem == null) {
    return null;
  }

  return $LibraryItemNewCopyWith<$Res>(_self.libraryItem!, (value) {
    return _then(_self.copyWith(libraryItem: value));
  });
}
}

// dart format on
