// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'login_response.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$LoginResponse implements DiagnosticableTreeMixin {

 UserModel get user; String get userDefaultLibraryId; ServerSettings get serverSettings; List<String> get ereaderDevices; String get Source;
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$LoginResponseCopyWith<LoginResponse> get copyWith => _$LoginResponseCopyWithImpl<LoginResponse>(this as LoginResponse, _$identity);

  /// Serializes this LoginResponse to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginResponse'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('userDefaultLibraryId', userDefaultLibraryId))..add(DiagnosticsProperty('serverSettings', serverSettings))..add(DiagnosticsProperty('ereaderDevices', ereaderDevices))..add(DiagnosticsProperty('Source', Source));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is LoginResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.userDefaultLibraryId, userDefaultLibraryId) || other.userDefaultLibraryId == userDefaultLibraryId)&&(identical(other.serverSettings, serverSettings) || other.serverSettings == serverSettings)&&const DeepCollectionEquality().equals(other.ereaderDevices, ereaderDevices)&&(identical(other.Source, Source) || other.Source == Source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,userDefaultLibraryId,serverSettings,const DeepCollectionEquality().hash(ereaderDevices),Source);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginResponse(user: $user, userDefaultLibraryId: $userDefaultLibraryId, serverSettings: $serverSettings, ereaderDevices: $ereaderDevices, Source: $Source)';
}


}

/// @nodoc
abstract mixin class $LoginResponseCopyWith<$Res>  {
  factory $LoginResponseCopyWith(LoginResponse value, $Res Function(LoginResponse) _then) = _$LoginResponseCopyWithImpl;
@useResult
$Res call({
 UserModel user, String userDefaultLibraryId, ServerSettings serverSettings, List<String> ereaderDevices, String Source
});


$UserModelCopyWith<$Res> get user;$ServerSettingsCopyWith<$Res> get serverSettings;

}
/// @nodoc
class _$LoginResponseCopyWithImpl<$Res>
    implements $LoginResponseCopyWith<$Res> {
  _$LoginResponseCopyWithImpl(this._self, this._then);

  final LoginResponse _self;
  final $Res Function(LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? user = null,Object? userDefaultLibraryId = null,Object? serverSettings = null,Object? ereaderDevices = null,Object? Source = null,}) {
  return _then(_self.copyWith(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,userDefaultLibraryId: null == userDefaultLibraryId ? _self.userDefaultLibraryId : userDefaultLibraryId // ignore: cast_nullable_to_non_nullable
as String,serverSettings: null == serverSettings ? _self.serverSettings : serverSettings // ignore: cast_nullable_to_non_nullable
as ServerSettings,ereaderDevices: null == ereaderDevices ? _self.ereaderDevices : ereaderDevices // ignore: cast_nullable_to_non_nullable
as List<String>,Source: null == Source ? _self.Source : Source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}
/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSettingsCopyWith<$Res> get serverSettings {
  
  return $ServerSettingsCopyWith<$Res>(_self.serverSettings, (value) {
    return _then(_self.copyWith(serverSettings: value));
  });
}
}


/// Adds pattern-matching-related methods to [LoginResponse].
extension LoginResponsePatterns on LoginResponse {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _LoginResponse value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _LoginResponse value)  $default,){
final _that = this;
switch (_that) {
case _LoginResponse():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _LoginResponse value)?  $default,){
final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( UserModel user,  String userDefaultLibraryId,  ServerSettings serverSettings,  List<String> ereaderDevices,  String Source)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.user,_that.userDefaultLibraryId,_that.serverSettings,_that.ereaderDevices,_that.Source);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( UserModel user,  String userDefaultLibraryId,  ServerSettings serverSettings,  List<String> ereaderDevices,  String Source)  $default,) {final _that = this;
switch (_that) {
case _LoginResponse():
return $default(_that.user,_that.userDefaultLibraryId,_that.serverSettings,_that.ereaderDevices,_that.Source);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( UserModel user,  String userDefaultLibraryId,  ServerSettings serverSettings,  List<String> ereaderDevices,  String Source)?  $default,) {final _that = this;
switch (_that) {
case _LoginResponse() when $default != null:
return $default(_that.user,_that.userDefaultLibraryId,_that.serverSettings,_that.ereaderDevices,_that.Source);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _LoginResponse with DiagnosticableTreeMixin implements LoginResponse {
  const _LoginResponse({required this.user, required this.userDefaultLibraryId, required this.serverSettings, required final  List<String> ereaderDevices, required this.Source}): _ereaderDevices = ereaderDevices;
  factory _LoginResponse.fromJson(Map<String, dynamic> json) => _$LoginResponseFromJson(json);

@override final  UserModel user;
@override final  String userDefaultLibraryId;
@override final  ServerSettings serverSettings;
 final  List<String> _ereaderDevices;
@override List<String> get ereaderDevices {
  if (_ereaderDevices is EqualUnmodifiableListView) return _ereaderDevices;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_ereaderDevices);
}

@override final  String Source;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$LoginResponseCopyWith<_LoginResponse> get copyWith => __$LoginResponseCopyWithImpl<_LoginResponse>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$LoginResponseToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'LoginResponse'))
    ..add(DiagnosticsProperty('user', user))..add(DiagnosticsProperty('userDefaultLibraryId', userDefaultLibraryId))..add(DiagnosticsProperty('serverSettings', serverSettings))..add(DiagnosticsProperty('ereaderDevices', ereaderDevices))..add(DiagnosticsProperty('Source', Source));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _LoginResponse&&(identical(other.user, user) || other.user == user)&&(identical(other.userDefaultLibraryId, userDefaultLibraryId) || other.userDefaultLibraryId == userDefaultLibraryId)&&(identical(other.serverSettings, serverSettings) || other.serverSettings == serverSettings)&&const DeepCollectionEquality().equals(other._ereaderDevices, _ereaderDevices)&&(identical(other.Source, Source) || other.Source == Source));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,user,userDefaultLibraryId,serverSettings,const DeepCollectionEquality().hash(_ereaderDevices),Source);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'LoginResponse(user: $user, userDefaultLibraryId: $userDefaultLibraryId, serverSettings: $serverSettings, ereaderDevices: $ereaderDevices, Source: $Source)';
}


}

/// @nodoc
abstract mixin class _$LoginResponseCopyWith<$Res> implements $LoginResponseCopyWith<$Res> {
  factory _$LoginResponseCopyWith(_LoginResponse value, $Res Function(_LoginResponse) _then) = __$LoginResponseCopyWithImpl;
@override @useResult
$Res call({
 UserModel user, String userDefaultLibraryId, ServerSettings serverSettings, List<String> ereaderDevices, String Source
});


@override $UserModelCopyWith<$Res> get user;@override $ServerSettingsCopyWith<$Res> get serverSettings;

}
/// @nodoc
class __$LoginResponseCopyWithImpl<$Res>
    implements _$LoginResponseCopyWith<$Res> {
  __$LoginResponseCopyWithImpl(this._self, this._then);

  final _LoginResponse _self;
  final $Res Function(_LoginResponse) _then;

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? user = null,Object? userDefaultLibraryId = null,Object? serverSettings = null,Object? ereaderDevices = null,Object? Source = null,}) {
  return _then(_LoginResponse(
user: null == user ? _self.user : user // ignore: cast_nullable_to_non_nullable
as UserModel,userDefaultLibraryId: null == userDefaultLibraryId ? _self.userDefaultLibraryId : userDefaultLibraryId // ignore: cast_nullable_to_non_nullable
as String,serverSettings: null == serverSettings ? _self.serverSettings : serverSettings // ignore: cast_nullable_to_non_nullable
as ServerSettings,ereaderDevices: null == ereaderDevices ? _self._ereaderDevices : ereaderDevices // ignore: cast_nullable_to_non_nullable
as List<String>,Source: null == Source ? _self.Source : Source // ignore: cast_nullable_to_non_nullable
as String,
  ));
}

/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$UserModelCopyWith<$Res> get user {
  
  return $UserModelCopyWith<$Res>(_self.user, (value) {
    return _then(_self.copyWith(user: value));
  });
}/// Create a copy of LoginResponse
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$ServerSettingsCopyWith<$Res> get serverSettings {
  
  return $ServerSettingsCopyWith<$Res>(_self.serverSettings, (value) {
    return _then(_self.copyWith(serverSettings: value));
  });
}
}

// dart format on
