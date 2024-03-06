// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

LoginResponse _$LoginResponseFromJson(Map<String, dynamic> json) {
  return _LoginResponse.fromJson(json);
}

/// @nodoc
mixin _$LoginResponse {
  UserModel get user => throw _privateConstructorUsedError;
  String get userDefaultLibraryId => throw _privateConstructorUsedError;
  ServerSettings get serverSettings => throw _privateConstructorUsedError;
  List<String> get ereaderDevices => throw _privateConstructorUsedError;
  String get Source => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $LoginResponseCopyWith<LoginResponse> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $LoginResponseCopyWith<$Res> {
  factory $LoginResponseCopyWith(
          LoginResponse value, $Res Function(LoginResponse) then) =
      _$LoginResponseCopyWithImpl<$Res, LoginResponse>;
  @useResult
  $Res call(
      {UserModel user,
      String userDefaultLibraryId,
      ServerSettings serverSettings,
      List<String> ereaderDevices,
      String Source});

  $UserModelCopyWith<$Res> get user;
  $ServerSettingsCopyWith<$Res> get serverSettings;
}

/// @nodoc
class _$LoginResponseCopyWithImpl<$Res, $Val extends LoginResponse>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? userDefaultLibraryId = null,
    Object? serverSettings = null,
    Object? ereaderDevices = null,
    Object? Source = null,
  }) {
    return _then(_value.copyWith(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userDefaultLibraryId: null == userDefaultLibraryId
          ? _value.userDefaultLibraryId
          : userDefaultLibraryId // ignore: cast_nullable_to_non_nullable
              as String,
      serverSettings: null == serverSettings
          ? _value.serverSettings
          : serverSettings // ignore: cast_nullable_to_non_nullable
              as ServerSettings,
      ereaderDevices: null == ereaderDevices
          ? _value.ereaderDevices
          : ereaderDevices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      Source: null == Source
          ? _value.Source
          : Source // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $UserModelCopyWith<$Res> get user {
    return $UserModelCopyWith<$Res>(_value.user, (value) {
      return _then(_value.copyWith(user: value) as $Val);
    });
  }

  @override
  @pragma('vm:prefer-inline')
  $ServerSettingsCopyWith<$Res> get serverSettings {
    return $ServerSettingsCopyWith<$Res>(_value.serverSettings, (value) {
      return _then(_value.copyWith(serverSettings: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$LoginResponseImplCopyWith<$Res>
    implements $LoginResponseCopyWith<$Res> {
  factory _$$LoginResponseImplCopyWith(
          _$LoginResponseImpl value, $Res Function(_$LoginResponseImpl) then) =
      __$$LoginResponseImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {UserModel user,
      String userDefaultLibraryId,
      ServerSettings serverSettings,
      List<String> ereaderDevices,
      String Source});

  @override
  $UserModelCopyWith<$Res> get user;
  @override
  $ServerSettingsCopyWith<$Res> get serverSettings;
}

/// @nodoc
class __$$LoginResponseImplCopyWithImpl<$Res>
    extends _$LoginResponseCopyWithImpl<$Res, _$LoginResponseImpl>
    implements _$$LoginResponseImplCopyWith<$Res> {
  __$$LoginResponseImplCopyWithImpl(
      _$LoginResponseImpl _value, $Res Function(_$LoginResponseImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? user = null,
    Object? userDefaultLibraryId = null,
    Object? serverSettings = null,
    Object? ereaderDevices = null,
    Object? Source = null,
  }) {
    return _then(_$LoginResponseImpl(
      user: null == user
          ? _value.user
          : user // ignore: cast_nullable_to_non_nullable
              as UserModel,
      userDefaultLibraryId: null == userDefaultLibraryId
          ? _value.userDefaultLibraryId
          : userDefaultLibraryId // ignore: cast_nullable_to_non_nullable
              as String,
      serverSettings: null == serverSettings
          ? _value.serverSettings
          : serverSettings // ignore: cast_nullable_to_non_nullable
              as ServerSettings,
      ereaderDevices: null == ereaderDevices
          ? _value._ereaderDevices
          : ereaderDevices // ignore: cast_nullable_to_non_nullable
              as List<String>,
      Source: null == Source
          ? _value.Source
          : Source // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$LoginResponseImpl
    with DiagnosticableTreeMixin
    implements _LoginResponse {
  const _$LoginResponseImpl(
      {required this.user,
      required this.userDefaultLibraryId,
      required this.serverSettings,
      required final List<String> ereaderDevices,
      required this.Source})
      : _ereaderDevices = ereaderDevices;

  factory _$LoginResponseImpl.fromJson(Map<String, dynamic> json) =>
      _$$LoginResponseImplFromJson(json);

  @override
  final UserModel user;
  @override
  final String userDefaultLibraryId;
  @override
  final ServerSettings serverSettings;
  final List<String> _ereaderDevices;
  @override
  List<String> get ereaderDevices {
    if (_ereaderDevices is EqualUnmodifiableListView) return _ereaderDevices;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(_ereaderDevices);
  }

  @override
  final String Source;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'LoginResponse(user: $user, userDefaultLibraryId: $userDefaultLibraryId, serverSettings: $serverSettings, ereaderDevices: $ereaderDevices, Source: $Source)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'LoginResponse'))
      ..add(DiagnosticsProperty('user', user))
      ..add(DiagnosticsProperty('userDefaultLibraryId', userDefaultLibraryId))
      ..add(DiagnosticsProperty('serverSettings', serverSettings))
      ..add(DiagnosticsProperty('ereaderDevices', ereaderDevices))
      ..add(DiagnosticsProperty('Source', Source));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$LoginResponseImpl &&
            (identical(other.user, user) || other.user == user) &&
            (identical(other.userDefaultLibraryId, userDefaultLibraryId) ||
                other.userDefaultLibraryId == userDefaultLibraryId) &&
            (identical(other.serverSettings, serverSettings) ||
                other.serverSettings == serverSettings) &&
            const DeepCollectionEquality()
                .equals(other._ereaderDevices, _ereaderDevices) &&
            (identical(other.Source, Source) || other.Source == Source));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      user,
      userDefaultLibraryId,
      serverSettings,
      const DeepCollectionEquality().hash(_ereaderDevices),
      Source);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      __$$LoginResponseImplCopyWithImpl<_$LoginResponseImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$LoginResponseImplToJson(
      this,
    );
  }
}

abstract class _LoginResponse implements LoginResponse {
  const factory _LoginResponse(
      {required final UserModel user,
      required final String userDefaultLibraryId,
      required final ServerSettings serverSettings,
      required final List<String> ereaderDevices,
      required final String Source}) = _$LoginResponseImpl;

  factory _LoginResponse.fromJson(Map<String, dynamic> json) =
      _$LoginResponseImpl.fromJson;

  @override
  UserModel get user;
  @override
  String get userDefaultLibraryId;
  @override
  ServerSettings get serverSettings;
  @override
  List<String> get ereaderDevices;
  @override
  String get Source;
  @override
  @JsonKey(ignore: true)
  _$$LoginResponseImplCopyWith<_$LoginResponseImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
