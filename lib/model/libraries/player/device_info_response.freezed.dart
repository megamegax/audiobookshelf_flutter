// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'device_info_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

DeviceInfoResponse _$DeviceInfoResponseFromJson(Map<String, dynamic> json) {
  return _DeviceInfoResponse.fromJson(json);
}

/// @nodoc
mixin _$DeviceInfoResponse {
  String get clientVersion => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $DeviceInfoResponseCopyWith<DeviceInfoResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $DeviceInfoResponseCopyWith<$Res> {
  factory $DeviceInfoResponseCopyWith(
          DeviceInfoResponse value, $Res Function(DeviceInfoResponse) then) =
      _$DeviceInfoResponseCopyWithImpl<$Res, DeviceInfoResponse>;
  @useResult
  $Res call({String clientVersion});
}

/// @nodoc
class _$DeviceInfoResponseCopyWithImpl<$Res, $Val extends DeviceInfoResponse>
    implements $DeviceInfoResponseCopyWith<$Res> {
  _$DeviceInfoResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientVersion = null,
  }) {
    return _then(_value.copyWith(
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$DeviceInfoResponseImplCopyWith<$Res>
    implements $DeviceInfoResponseCopyWith<$Res> {
  factory _$$DeviceInfoResponseImplCopyWith(_$DeviceInfoResponseImpl value,
          $Res Function(_$DeviceInfoResponseImpl) then) =
      __$$DeviceInfoResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({String clientVersion});
}

/// @nodoc
class __$$DeviceInfoResponseImplCopyWithImpl<$Res>
    extends _$DeviceInfoResponseCopyWithImpl<$Res, _$DeviceInfoResponseImpl>
    implements _$$DeviceInfoResponseImplCopyWith<$Res> {
  __$$DeviceInfoResponseImplCopyWithImpl(_$DeviceInfoResponseImpl _value,
      $Res Function(_$DeviceInfoResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? clientVersion = null,
  }) {
    return _then(_$DeviceInfoResponseImpl(
      clientVersion: null == clientVersion
          ? _value.clientVersion
          : clientVersion // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$DeviceInfoResponseImpl implements _DeviceInfoResponse {
  const _$DeviceInfoResponseImpl({required this.clientVersion});

  factory _$DeviceInfoResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$DeviceInfoResponseImplFromJson(json);

  @override
  final String clientVersion;

  @override
  String toString() {
    return 'DeviceInfoResponse(clientVersion: $clientVersion)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$DeviceInfoResponseImpl &&
            (identical(other.clientVersion, clientVersion) ||
                other.clientVersion == clientVersion));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, clientVersion);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$DeviceInfoResponseImplCopyWith<_$DeviceInfoResponseImpl> get copyWith =>
      __$$DeviceInfoResponseImplCopyWithImpl<_$DeviceInfoResponseImpl>(
          this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$DeviceInfoResponseImplToJson(
      this,
    );
  }
}

abstract class _DeviceInfoResponse implements DeviceInfoResponse {
  const factory _DeviceInfoResponse({required final String clientVersion}) =
      _$DeviceInfoResponseImpl;

  factory _DeviceInfoResponse.fromJson(Map<String, dynamic> json) =
      _$DeviceInfoResponseImpl.fromJson;

  @override
  String get clientVersion;
  @override
  @JsonKey(ignore: true)
  _$$DeviceInfoResponseImplCopyWith<_$DeviceInfoResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
