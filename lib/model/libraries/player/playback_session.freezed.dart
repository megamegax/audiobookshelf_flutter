// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'playback_session.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlaybackSession _$PlaybackSessionFromJson(Map<String, dynamic> json) {
  return _PlaybackSession.fromJson(json);
}

/// @nodoc
mixin _$PlaybackSession {
  String get id => throw _privateConstructorUsedError;
  String? get userId => throw _privateConstructorUsedError;
  String? get libraryItemId => throw _privateConstructorUsedError;
  String? get episodeId => throw _privateConstructorUsedError;
  String get mediaType =>
      throw _privateConstructorUsedError; //MediaTypeMetadata mediaMetadata,
  DeviceInfoResponse get deviceInfo => throw _privateConstructorUsedError;
  List<BookChapter> get chapters => throw _privateConstructorUsedError;
  String? get displayTitle => throw _privateConstructorUsedError;
  String? get displayAuthor => throw _privateConstructorUsedError;
  String? get coverPath => throw _privateConstructorUsedError;
  double get duration => throw _privateConstructorUsedError;
  int get playMethod => throw _privateConstructorUsedError;
  int get startedAt => throw _privateConstructorUsedError;
  int get updatedAt => throw _privateConstructorUsedError;
  int get timeListening => throw _privateConstructorUsedError;
  List<AudioTrack> get audioTracks => throw _privateConstructorUsedError;
  double get currentTime => throw _privateConstructorUsedError;
  LibraryItem? get libraryItem =>
      throw _privateConstructorUsedError; //LocalLibraryItem? localLibraryItem,
  String? get localEpisodeId => throw _privateConstructorUsedError;
  String? get serverConnectionConfigId => throw _privateConstructorUsedError;
  String? get serverAddress => throw _privateConstructorUsedError;
  String? get mediaPlayer => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlaybackSessionCopyWith<PlaybackSession> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlaybackSessionCopyWith<$Res> {
  factory $PlaybackSessionCopyWith(
          PlaybackSession value, $Res Function(PlaybackSession) then) =
      _$PlaybackSessionCopyWithImpl<$Res, PlaybackSession>;
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? libraryItemId,
      String? episodeId,
      String mediaType,
      DeviceInfoResponse deviceInfo,
      List<BookChapter> chapters,
      String? displayTitle,
      String? displayAuthor,
      String? coverPath,
      double duration,
      int playMethod,
      int startedAt,
      int updatedAt,
      int timeListening,
      List<AudioTrack> audioTracks,
      double currentTime,
      LibraryItem? libraryItem,
      String? localEpisodeId,
      String? serverConnectionConfigId,
      String? serverAddress,
      String? mediaPlayer});

  $DeviceInfoResponseCopyWith<$Res> get deviceInfo;
  $LibraryItemCopyWith<$Res>? get libraryItem;
}

/// @nodoc
class _$PlaybackSessionCopyWithImpl<$Res, $Val extends PlaybackSession>
    implements $PlaybackSessionCopyWith<$Res> {
  _$PlaybackSessionCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? libraryItemId = freezed,
    Object? episodeId = freezed,
    Object? mediaType = null,
    Object? deviceInfo = null,
    Object? chapters = null,
    Object? displayTitle = freezed,
    Object? displayAuthor = freezed,
    Object? coverPath = freezed,
    Object? duration = null,
    Object? playMethod = null,
    Object? startedAt = null,
    Object? updatedAt = null,
    Object? timeListening = null,
    Object? audioTracks = null,
    Object? currentTime = null,
    Object? libraryItem = freezed,
    Object? localEpisodeId = freezed,
    Object? serverConnectionConfigId = freezed,
    Object? serverAddress = freezed,
    Object? mediaPlayer = freezed,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryItemId: freezed == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoResponse,
      chapters: null == chapters
          ? _value.chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<BookChapter>,
      displayTitle: freezed == displayTitle
          ? _value.displayTitle
          : displayTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      displayAuthor: freezed == displayAuthor
          ? _value.displayAuthor
          : displayAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      playMethod: null == playMethod
          ? _value.playMethod
          : playMethod // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      timeListening: null == timeListening
          ? _value.timeListening
          : timeListening // ignore: cast_nullable_to_non_nullable
              as int,
      audioTracks: null == audioTracks
          ? _value.audioTracks
          : audioTracks // ignore: cast_nullable_to_non_nullable
              as List<AudioTrack>,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
      libraryItem: freezed == libraryItem
          ? _value.libraryItem
          : libraryItem // ignore: cast_nullable_to_non_nullable
              as LibraryItem?,
      localEpisodeId: freezed == localEpisodeId
          ? _value.localEpisodeId
          : localEpisodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      serverConnectionConfigId: freezed == serverConnectionConfigId
          ? _value.serverConnectionConfigId
          : serverConnectionConfigId // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAddress: freezed == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaPlayer: freezed == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoResponseCopyWith<$Res> get deviceInfo {
    return $DeviceInfoResponseCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $LibraryItemCopyWith<$Res>? get libraryItem {
    if (_value.libraryItem == null) {
      return null;
    }

    return $LibraryItemCopyWith<$Res>(_value.libraryItem!, (value) {
      return _then(_value.copyWith(libraryItem: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlaybackSessionImplCopyWith<$Res>
    implements $PlaybackSessionCopyWith<$Res> {
  factory _$$PlaybackSessionImplCopyWith(_$PlaybackSessionImpl value,
          $Res Function(_$PlaybackSessionImpl) then) =
      __$$PlaybackSessionImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String id,
      String? userId,
      String? libraryItemId,
      String? episodeId,
      String mediaType,
      DeviceInfoResponse deviceInfo,
      List<BookChapter> chapters,
      String? displayTitle,
      String? displayAuthor,
      String? coverPath,
      double duration,
      int playMethod,
      int startedAt,
      int updatedAt,
      int timeListening,
      List<AudioTrack> audioTracks,
      double currentTime,
      LibraryItem? libraryItem,
      String? localEpisodeId,
      String? serverConnectionConfigId,
      String? serverAddress,
      String? mediaPlayer});

  @override
  $DeviceInfoResponseCopyWith<$Res> get deviceInfo;
  @override
  $LibraryItemCopyWith<$Res>? get libraryItem;
}

/// @nodoc
class __$$PlaybackSessionImplCopyWithImpl<$Res>
    extends _$PlaybackSessionCopyWithImpl<$Res, _$PlaybackSessionImpl>
    implements _$$PlaybackSessionImplCopyWith<$Res> {
  __$$PlaybackSessionImplCopyWithImpl(
      _$PlaybackSessionImpl _value, $Res Function(_$PlaybackSessionImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? userId = freezed,
    Object? libraryItemId = freezed,
    Object? episodeId = freezed,
    Object? mediaType = null,
    Object? deviceInfo = null,
    Object? chapters = null,
    Object? displayTitle = freezed,
    Object? displayAuthor = freezed,
    Object? coverPath = freezed,
    Object? duration = null,
    Object? playMethod = null,
    Object? startedAt = null,
    Object? updatedAt = null,
    Object? timeListening = null,
    Object? audioTracks = null,
    Object? currentTime = null,
    Object? libraryItem = freezed,
    Object? localEpisodeId = freezed,
    Object? serverConnectionConfigId = freezed,
    Object? serverAddress = freezed,
    Object? mediaPlayer = freezed,
  }) {
    return _then(_$PlaybackSessionImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String,
      userId: freezed == userId
          ? _value.userId
          : userId // ignore: cast_nullable_to_non_nullable
              as String?,
      libraryItemId: freezed == libraryItemId
          ? _value.libraryItemId
          : libraryItemId // ignore: cast_nullable_to_non_nullable
              as String?,
      episodeId: freezed == episodeId
          ? _value.episodeId
          : episodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfoResponse,
      chapters: null == chapters
          ? _value._chapters
          : chapters // ignore: cast_nullable_to_non_nullable
              as List<BookChapter>,
      displayTitle: freezed == displayTitle
          ? _value.displayTitle
          : displayTitle // ignore: cast_nullable_to_non_nullable
              as String?,
      displayAuthor: freezed == displayAuthor
          ? _value.displayAuthor
          : displayAuthor // ignore: cast_nullable_to_non_nullable
              as String?,
      coverPath: freezed == coverPath
          ? _value.coverPath
          : coverPath // ignore: cast_nullable_to_non_nullable
              as String?,
      duration: null == duration
          ? _value.duration
          : duration // ignore: cast_nullable_to_non_nullable
              as double,
      playMethod: null == playMethod
          ? _value.playMethod
          : playMethod // ignore: cast_nullable_to_non_nullable
              as int,
      startedAt: null == startedAt
          ? _value.startedAt
          : startedAt // ignore: cast_nullable_to_non_nullable
              as int,
      updatedAt: null == updatedAt
          ? _value.updatedAt
          : updatedAt // ignore: cast_nullable_to_non_nullable
              as int,
      timeListening: null == timeListening
          ? _value.timeListening
          : timeListening // ignore: cast_nullable_to_non_nullable
              as int,
      audioTracks: null == audioTracks
          ? _value._audioTracks
          : audioTracks // ignore: cast_nullable_to_non_nullable
              as List<AudioTrack>,
      currentTime: null == currentTime
          ? _value.currentTime
          : currentTime // ignore: cast_nullable_to_non_nullable
              as double,
      libraryItem: freezed == libraryItem
          ? _value.libraryItem
          : libraryItem // ignore: cast_nullable_to_non_nullable
              as LibraryItem?,
      localEpisodeId: freezed == localEpisodeId
          ? _value.localEpisodeId
          : localEpisodeId // ignore: cast_nullable_to_non_nullable
              as String?,
      serverConnectionConfigId: freezed == serverConnectionConfigId
          ? _value.serverConnectionConfigId
          : serverConnectionConfigId // ignore: cast_nullable_to_non_nullable
              as String?,
      serverAddress: freezed == serverAddress
          ? _value.serverAddress
          : serverAddress // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaPlayer: freezed == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlaybackSessionImpl implements _PlaybackSession {
  const _$PlaybackSessionImpl(
      {required this.id,
      this.userId,
      this.libraryItemId,
      this.episodeId,
      required this.mediaType,
      required this.deviceInfo,
      required final List<BookChapter> chapters,
      this.displayTitle,
      this.displayAuthor,
      this.coverPath,
      required this.duration,
      required this.playMethod,
      required this.startedAt,
      required this.updatedAt,
      required this.timeListening,
      required final List<AudioTrack> audioTracks,
      required this.currentTime,
      this.libraryItem,
      this.localEpisodeId,
      this.serverConnectionConfigId,
      this.serverAddress,
      this.mediaPlayer})
      : _chapters = chapters,
        _audioTracks = audioTracks;

  factory _$PlaybackSessionImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlaybackSessionImplFromJson(json);

  @override
  final String id;
  @override
  final String? userId;
  @override
  final String? libraryItemId;
  @override
  final String? episodeId;
  @override
  final String mediaType;
//MediaTypeMetadata mediaMetadata,
  @override
  final DeviceInfoResponse deviceInfo;
  final List<BookChapter> _chapters;
  @override
  List<BookChapter> get chapters {
    if (_chapters is EqualUnmodifiableListView) return _chapters;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_chapters);
  }

  @override
  final String? displayTitle;
  @override
  final String? displayAuthor;
  @override
  final String? coverPath;
  @override
  final double duration;
  @override
  final int playMethod;
  @override
  final int startedAt;
  @override
  final int updatedAt;
  @override
  final int timeListening;
  final List<AudioTrack> _audioTracks;
  @override
  List<AudioTrack> get audioTracks {
    if (_audioTracks is EqualUnmodifiableListView) return _audioTracks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_audioTracks);
  }

  @override
  final double currentTime;
  @override
  final LibraryItem? libraryItem;
//LocalLibraryItem? localLibraryItem,
  @override
  final String? localEpisodeId;
  @override
  final String? serverConnectionConfigId;
  @override
  final String? serverAddress;
  @override
  final String? mediaPlayer;

  @override
  String toString() {
    return 'PlaybackSession(id: $id, userId: $userId, libraryItemId: $libraryItemId, episodeId: $episodeId, mediaType: $mediaType, deviceInfo: $deviceInfo, chapters: $chapters, displayTitle: $displayTitle, displayAuthor: $displayAuthor, coverPath: $coverPath, duration: $duration, playMethod: $playMethod, startedAt: $startedAt, updatedAt: $updatedAt, timeListening: $timeListening, audioTracks: $audioTracks, currentTime: $currentTime, libraryItem: $libraryItem, localEpisodeId: $localEpisodeId, serverConnectionConfigId: $serverConnectionConfigId, serverAddress: $serverAddress, mediaPlayer: $mediaPlayer)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlaybackSessionImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.userId, userId) || other.userId == userId) &&
            (identical(other.libraryItemId, libraryItemId) ||
                other.libraryItemId == libraryItemId) &&
            (identical(other.episodeId, episodeId) ||
                other.episodeId == episodeId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo) &&
            const DeepCollectionEquality().equals(other._chapters, _chapters) &&
            (identical(other.displayTitle, displayTitle) ||
                other.displayTitle == displayTitle) &&
            (identical(other.displayAuthor, displayAuthor) ||
                other.displayAuthor == displayAuthor) &&
            (identical(other.coverPath, coverPath) ||
                other.coverPath == coverPath) &&
            (identical(other.duration, duration) ||
                other.duration == duration) &&
            (identical(other.playMethod, playMethod) ||
                other.playMethod == playMethod) &&
            (identical(other.startedAt, startedAt) ||
                other.startedAt == startedAt) &&
            (identical(other.updatedAt, updatedAt) ||
                other.updatedAt == updatedAt) &&
            (identical(other.timeListening, timeListening) ||
                other.timeListening == timeListening) &&
            const DeepCollectionEquality()
                .equals(other._audioTracks, _audioTracks) &&
            (identical(other.currentTime, currentTime) ||
                other.currentTime == currentTime) &&
            (identical(other.libraryItem, libraryItem) ||
                other.libraryItem == libraryItem) &&
            (identical(other.localEpisodeId, localEpisodeId) ||
                other.localEpisodeId == localEpisodeId) &&
            (identical(
                    other.serverConnectionConfigId, serverConnectionConfigId) ||
                other.serverConnectionConfigId == serverConnectionConfigId) &&
            (identical(other.serverAddress, serverAddress) ||
                other.serverAddress == serverAddress) &&
            (identical(other.mediaPlayer, mediaPlayer) ||
                other.mediaPlayer == mediaPlayer));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hashAll([
        runtimeType,
        id,
        userId,
        libraryItemId,
        episodeId,
        mediaType,
        deviceInfo,
        const DeepCollectionEquality().hash(_chapters),
        displayTitle,
        displayAuthor,
        coverPath,
        duration,
        playMethod,
        startedAt,
        updatedAt,
        timeListening,
        const DeepCollectionEquality().hash(_audioTracks),
        currentTime,
        libraryItem,
        localEpisodeId,
        serverConnectionConfigId,
        serverAddress,
        mediaPlayer
      ]);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlaybackSessionImplCopyWith<_$PlaybackSessionImpl> get copyWith =>
      __$$PlaybackSessionImplCopyWithImpl<_$PlaybackSessionImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlaybackSessionImplToJson(
      this,
    );
  }
}

abstract class _PlaybackSession implements PlaybackSession {
  const factory _PlaybackSession(
      {required final String id,
      final String? userId,
      final String? libraryItemId,
      final String? episodeId,
      required final String mediaType,
      required final DeviceInfoResponse deviceInfo,
      required final List<BookChapter> chapters,
      final String? displayTitle,
      final String? displayAuthor,
      final String? coverPath,
      required final double duration,
      required final int playMethod,
      required final int startedAt,
      required final int updatedAt,
      required final int timeListening,
      required final List<AudioTrack> audioTracks,
      required final double currentTime,
      final LibraryItem? libraryItem,
      final String? localEpisodeId,
      final String? serverConnectionConfigId,
      final String? serverAddress,
      final String? mediaPlayer}) = _$PlaybackSessionImpl;

  factory _PlaybackSession.fromJson(Map<String, dynamic> json) =
      _$PlaybackSessionImpl.fromJson;

  @override
  String get id;
  @override
  String? get userId;
  @override
  String? get libraryItemId;
  @override
  String? get episodeId;
  @override
  String get mediaType;
  @override //MediaTypeMetadata mediaMetadata,
  DeviceInfoResponse get deviceInfo;
  @override
  List<BookChapter> get chapters;
  @override
  String? get displayTitle;
  @override
  String? get displayAuthor;
  @override
  String? get coverPath;
  @override
  double get duration;
  @override
  int get playMethod;
  @override
  int get startedAt;
  @override
  int get updatedAt;
  @override
  int get timeListening;
  @override
  List<AudioTrack> get audioTracks;
  @override
  double get currentTime;
  @override
  LibraryItem? get libraryItem;
  @override //LocalLibraryItem? localLibraryItem,
  String? get localEpisodeId;
  @override
  String? get serverConnectionConfigId;
  @override
  String? get serverAddress;
  @override
  String? get mediaPlayer;
  @override
  @JsonKey(ignore: true)
  _$$PlaybackSessionImplCopyWith<_$PlaybackSessionImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
