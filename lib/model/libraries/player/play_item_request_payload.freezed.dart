// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'play_item_request_payload.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

PlayItemRequestPayload _$PlayItemRequestPayloadFromJson(
    Map<String, dynamic> json) {
  return _PlayItemRequestPayload.fromJson(json);
}

/// @nodoc
mixin _$PlayItemRequestPayload {
  String get itemId => throw _privateConstructorUsedError;
  String get mediaType => throw _privateConstructorUsedError;
  String get mediaPlayer => throw _privateConstructorUsedError;
  bool get forceDirectPlay => throw _privateConstructorUsedError;
  bool get forceTranscode => throw _privateConstructorUsedError;
  DeviceInfo get deviceInfo => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $PlayItemRequestPayloadCopyWith<PlayItemRequestPayload> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $PlayItemRequestPayloadCopyWith<$Res> {
  factory $PlayItemRequestPayloadCopyWith(PlayItemRequestPayload value,
          $Res Function(PlayItemRequestPayload) then) =
      _$PlayItemRequestPayloadCopyWithImpl<$Res, PlayItemRequestPayload>;
  @useResult
  $Res call(
      {String itemId,
      String mediaType,
      String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class _$PlayItemRequestPayloadCopyWithImpl<$Res,
        $Val extends PlayItemRequestPayload>
    implements $PlayItemRequestPayloadCopyWith<$Res> {
  _$PlayItemRequestPayloadCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? mediaType = null,
    Object? mediaPlayer = null,
    Object? forceDirectPlay = null,
    Object? forceTranscode = null,
    Object? deviceInfo = null,
  }) {
    return _then(_value.copyWith(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaPlayer: null == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: null == forceDirectPlay
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: null == forceTranscode
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $DeviceInfoCopyWith<$Res> get deviceInfo {
    return $DeviceInfoCopyWith<$Res>(_value.deviceInfo, (value) {
      return _then(_value.copyWith(deviceInfo: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$PlayItemRequestPayloadImplCopyWith<$Res>
    implements $PlayItemRequestPayloadCopyWith<$Res> {
  factory _$$PlayItemRequestPayloadImplCopyWith(
          _$PlayItemRequestPayloadImpl value,
          $Res Function(_$PlayItemRequestPayloadImpl) then) =
      __$$PlayItemRequestPayloadImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String itemId,
      String mediaType,
      String mediaPlayer,
      bool forceDirectPlay,
      bool forceTranscode,
      DeviceInfo deviceInfo});

  @override
  $DeviceInfoCopyWith<$Res> get deviceInfo;
}

/// @nodoc
class __$$PlayItemRequestPayloadImplCopyWithImpl<$Res>
    extends _$PlayItemRequestPayloadCopyWithImpl<$Res,
        _$PlayItemRequestPayloadImpl>
    implements _$$PlayItemRequestPayloadImplCopyWith<$Res> {
  __$$PlayItemRequestPayloadImplCopyWithImpl(
      _$PlayItemRequestPayloadImpl _value,
      $Res Function(_$PlayItemRequestPayloadImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? itemId = null,
    Object? mediaType = null,
    Object? mediaPlayer = null,
    Object? forceDirectPlay = null,
    Object? forceTranscode = null,
    Object? deviceInfo = null,
  }) {
    return _then(_$PlayItemRequestPayloadImpl(
      itemId: null == itemId
          ? _value.itemId
          : itemId // ignore: cast_nullable_to_non_nullable
              as String,
      mediaType: null == mediaType
          ? _value.mediaType
          : mediaType // ignore: cast_nullable_to_non_nullable
              as String,
      mediaPlayer: null == mediaPlayer
          ? _value.mediaPlayer
          : mediaPlayer // ignore: cast_nullable_to_non_nullable
              as String,
      forceDirectPlay: null == forceDirectPlay
          ? _value.forceDirectPlay
          : forceDirectPlay // ignore: cast_nullable_to_non_nullable
              as bool,
      forceTranscode: null == forceTranscode
          ? _value.forceTranscode
          : forceTranscode // ignore: cast_nullable_to_non_nullable
              as bool,
      deviceInfo: null == deviceInfo
          ? _value.deviceInfo
          : deviceInfo // ignore: cast_nullable_to_non_nullable
              as DeviceInfo,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$PlayItemRequestPayloadImpl implements _PlayItemRequestPayload {
  const _$PlayItemRequestPayloadImpl(
      {required this.itemId,
      required this.mediaType,
      required this.mediaPlayer,
      required this.forceDirectPlay,
      required this.forceTranscode,
      required this.deviceInfo});

  factory _$PlayItemRequestPayloadImpl.fromJson(Map<String, dynamic> json) =>
      _$$PlayItemRequestPayloadImplFromJson(json);

  @override
  final String itemId;
  @override
  final String mediaType;
  @override
  final String mediaPlayer;
  @override
  final bool forceDirectPlay;
  @override
  final bool forceTranscode;
  @override
  final DeviceInfo deviceInfo;

  @override
  String toString() {
    return 'PlayItemRequestPayload(itemId: $itemId, mediaType: $mediaType, mediaPlayer: $mediaPlayer, forceDirectPlay: $forceDirectPlay, forceTranscode: $forceTranscode, deviceInfo: $deviceInfo)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$PlayItemRequestPayloadImpl &&
            (identical(other.itemId, itemId) || other.itemId == itemId) &&
            (identical(other.mediaType, mediaType) ||
                other.mediaType == mediaType) &&
            (identical(other.mediaPlayer, mediaPlayer) ||
                other.mediaPlayer == mediaPlayer) &&
            (identical(other.forceDirectPlay, forceDirectPlay) ||
                other.forceDirectPlay == forceDirectPlay) &&
            (identical(other.forceTranscode, forceTranscode) ||
                other.forceTranscode == forceTranscode) &&
            (identical(other.deviceInfo, deviceInfo) ||
                other.deviceInfo == deviceInfo));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, itemId, mediaType, mediaPlayer,
      forceDirectPlay, forceTranscode, deviceInfo);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$PlayItemRequestPayloadImplCopyWith<_$PlayItemRequestPayloadImpl>
      get copyWith => __$$PlayItemRequestPayloadImplCopyWithImpl<
          _$PlayItemRequestPayloadImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$PlayItemRequestPayloadImplToJson(
      this,
    );
  }
}

abstract class _PlayItemRequestPayload implements PlayItemRequestPayload {
  const factory _PlayItemRequestPayload(
      {required final String itemId,
      required final String mediaType,
      required final String mediaPlayer,
      required final bool forceDirectPlay,
      required final bool forceTranscode,
      required final DeviceInfo deviceInfo}) = _$PlayItemRequestPayloadImpl;

  factory _PlayItemRequestPayload.fromJson(Map<String, dynamic> json) =
      _$PlayItemRequestPayloadImpl.fromJson;

  @override
  String get itemId;
  @override
  String get mediaType;
  @override
  String get mediaPlayer;
  @override
  bool get forceDirectPlay;
  @override
  bool get forceTranscode;
  @override
  DeviceInfo get deviceInfo;
  @override
  @JsonKey(ignore: true)
  _$$PlayItemRequestPayloadImplCopyWith<_$PlayItemRequestPayloadImpl>
      get copyWith => throw _privateConstructorUsedError;
}
