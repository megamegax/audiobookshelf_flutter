// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$UserModel implements DiagnosticableTreeMixin {

 String? get id; String? get oldUserId; String? get username; String? get email; String? get type; String? get token; String? get refreshToken; List<MediaProgress>? get mediaProgress; List<dynamic>? get seriesHideFromContinueListening; List<dynamic>? get bookmarks; bool? get isActive; bool? get isLocked; int? get lastSeen; int? get createdAt; Permissions? get permissions; List<dynamic>? get librariesAccessible; List<dynamic>? get itemTagsSelected; bool? get hasOpenIDLink;
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$UserModelCopyWith<UserModel> get copyWith => _$UserModelCopyWithImpl<UserModel>(this as UserModel, _$identity);

  /// Serializes this UserModel to a JSON map.
  Map<String, dynamic> toJson();

@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('oldUserId', oldUserId))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('refreshToken', refreshToken))..add(DiagnosticsProperty('mediaProgress', mediaProgress))..add(DiagnosticsProperty('seriesHideFromContinueListening', seriesHideFromContinueListening))..add(DiagnosticsProperty('bookmarks', bookmarks))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('isLocked', isLocked))..add(DiagnosticsProperty('lastSeen', lastSeen))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('permissions', permissions))..add(DiagnosticsProperty('librariesAccessible', librariesAccessible))..add(DiagnosticsProperty('itemTagsSelected', itemTagsSelected))..add(DiagnosticsProperty('hasOpenIDLink', hasOpenIDLink));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.oldUserId, oldUserId) || other.oldUserId == oldUserId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other.mediaProgress, mediaProgress)&&const DeepCollectionEquality().equals(other.seriesHideFromContinueListening, seriesHideFromContinueListening)&&const DeepCollectionEquality().equals(other.bookmarks, bookmarks)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&const DeepCollectionEquality().equals(other.librariesAccessible, librariesAccessible)&&const DeepCollectionEquality().equals(other.itemTagsSelected, itemTagsSelected)&&(identical(other.hasOpenIDLink, hasOpenIDLink) || other.hasOpenIDLink == hasOpenIDLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,oldUserId,username,email,type,token,refreshToken,const DeepCollectionEquality().hash(mediaProgress),const DeepCollectionEquality().hash(seriesHideFromContinueListening),const DeepCollectionEquality().hash(bookmarks),isActive,isLocked,lastSeen,createdAt,permissions,const DeepCollectionEquality().hash(librariesAccessible),const DeepCollectionEquality().hash(itemTagsSelected),hasOpenIDLink);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserModel(id: $id, oldUserId: $oldUserId, username: $username, email: $email, type: $type, token: $token, refreshToken: $refreshToken, mediaProgress: $mediaProgress, seriesHideFromContinueListening: $seriesHideFromContinueListening, bookmarks: $bookmarks, isActive: $isActive, isLocked: $isLocked, lastSeen: $lastSeen, createdAt: $createdAt, permissions: $permissions, librariesAccessible: $librariesAccessible, itemTagsSelected: $itemTagsSelected, hasOpenIDLink: $hasOpenIDLink)';
}


}

/// @nodoc
abstract mixin class $UserModelCopyWith<$Res>  {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) _then) = _$UserModelCopyWithImpl;
@useResult
$Res call({
 String? id, String? oldUserId, String? username, String? email, String? type, String? token, String? refreshToken, List<MediaProgress>? mediaProgress, List<dynamic>? seriesHideFromContinueListening, List<dynamic>? bookmarks, bool? isActive, bool? isLocked, int? lastSeen, int? createdAt, Permissions? permissions, List<dynamic>? librariesAccessible, List<dynamic>? itemTagsSelected, bool? hasOpenIDLink
});


$PermissionsCopyWith<$Res>? get permissions;

}
/// @nodoc
class _$UserModelCopyWithImpl<$Res>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._self, this._then);

  final UserModel _self;
  final $Res Function(UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? id = freezed,Object? oldUserId = freezed,Object? username = freezed,Object? email = freezed,Object? type = freezed,Object? token = freezed,Object? refreshToken = freezed,Object? mediaProgress = freezed,Object? seriesHideFromContinueListening = freezed,Object? bookmarks = freezed,Object? isActive = freezed,Object? isLocked = freezed,Object? lastSeen = freezed,Object? createdAt = freezed,Object? permissions = freezed,Object? librariesAccessible = freezed,Object? itemTagsSelected = freezed,Object? hasOpenIDLink = freezed,}) {
  return _then(_self.copyWith(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,oldUserId: freezed == oldUserId ? _self.oldUserId : oldUserId // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,mediaProgress: freezed == mediaProgress ? _self.mediaProgress : mediaProgress // ignore: cast_nullable_to_non_nullable
as List<MediaProgress>?,seriesHideFromContinueListening: freezed == seriesHideFromContinueListening ? _self.seriesHideFromContinueListening : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,bookmarks: freezed == bookmarks ? _self.bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isLocked: freezed == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool?,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Permissions?,librariesAccessible: freezed == librariesAccessible ? _self.librariesAccessible : librariesAccessible // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,itemTagsSelected: freezed == itemTagsSelected ? _self.itemTagsSelected : itemTagsSelected // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,hasOpenIDLink: freezed == hasOpenIDLink ? _self.hasOpenIDLink : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}
/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PermissionsCopyWith<$Res>? get permissions {
    if (_self.permissions == null) {
    return null;
  }

  return $PermissionsCopyWith<$Res>(_self.permissions!, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}


/// Adds pattern-matching-related methods to [UserModel].
extension UserModelPatterns on UserModel {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _UserModel value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _UserModel value)  $default,){
final _that = this;
switch (_that) {
case _UserModel():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _UserModel value)?  $default,){
final _that = this;
switch (_that) {
case _UserModel() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? id,  String? oldUserId,  String? username,  String? email,  String? type,  String? token,  String? refreshToken,  List<MediaProgress>? mediaProgress,  List<dynamic>? seriesHideFromContinueListening,  List<dynamic>? bookmarks,  bool? isActive,  bool? isLocked,  int? lastSeen,  int? createdAt,  Permissions? permissions,  List<dynamic>? librariesAccessible,  List<dynamic>? itemTagsSelected,  bool? hasOpenIDLink)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.oldUserId,_that.username,_that.email,_that.type,_that.token,_that.refreshToken,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? id,  String? oldUserId,  String? username,  String? email,  String? type,  String? token,  String? refreshToken,  List<MediaProgress>? mediaProgress,  List<dynamic>? seriesHideFromContinueListening,  List<dynamic>? bookmarks,  bool? isActive,  bool? isLocked,  int? lastSeen,  int? createdAt,  Permissions? permissions,  List<dynamic>? librariesAccessible,  List<dynamic>? itemTagsSelected,  bool? hasOpenIDLink)  $default,) {final _that = this;
switch (_that) {
case _UserModel():
return $default(_that.id,_that.oldUserId,_that.username,_that.email,_that.type,_that.token,_that.refreshToken,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? id,  String? oldUserId,  String? username,  String? email,  String? type,  String? token,  String? refreshToken,  List<MediaProgress>? mediaProgress,  List<dynamic>? seriesHideFromContinueListening,  List<dynamic>? bookmarks,  bool? isActive,  bool? isLocked,  int? lastSeen,  int? createdAt,  Permissions? permissions,  List<dynamic>? librariesAccessible,  List<dynamic>? itemTagsSelected,  bool? hasOpenIDLink)?  $default,) {final _that = this;
switch (_that) {
case _UserModel() when $default != null:
return $default(_that.id,_that.oldUserId,_that.username,_that.email,_that.type,_that.token,_that.refreshToken,_that.mediaProgress,_that.seriesHideFromContinueListening,_that.bookmarks,_that.isActive,_that.isLocked,_that.lastSeen,_that.createdAt,_that.permissions,_that.librariesAccessible,_that.itemTagsSelected,_that.hasOpenIDLink);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _UserModel with DiagnosticableTreeMixin implements UserModel {
  const _UserModel({this.id, this.oldUserId, this.username, this.email, this.type, this.token, this.refreshToken, final  List<MediaProgress>? mediaProgress, final  List<dynamic>? seriesHideFromContinueListening, final  List<dynamic>? bookmarks, this.isActive, this.isLocked, this.lastSeen, this.createdAt, this.permissions, final  List<dynamic>? librariesAccessible, final  List<dynamic>? itemTagsSelected, this.hasOpenIDLink}): _mediaProgress = mediaProgress,_seriesHideFromContinueListening = seriesHideFromContinueListening,_bookmarks = bookmarks,_librariesAccessible = librariesAccessible,_itemTagsSelected = itemTagsSelected;
  factory _UserModel.fromJson(Map<String, dynamic> json) => _$UserModelFromJson(json);

@override final  String? id;
@override final  String? oldUserId;
@override final  String? username;
@override final  String? email;
@override final  String? type;
@override final  String? token;
@override final  String? refreshToken;
 final  List<MediaProgress>? _mediaProgress;
@override List<MediaProgress>? get mediaProgress {
  final value = _mediaProgress;
  if (value == null) return null;
  if (_mediaProgress is EqualUnmodifiableListView) return _mediaProgress;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _seriesHideFromContinueListening;
@override List<dynamic>? get seriesHideFromContinueListening {
  final value = _seriesHideFromContinueListening;
  if (value == null) return null;
  if (_seriesHideFromContinueListening is EqualUnmodifiableListView) return _seriesHideFromContinueListening;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _bookmarks;
@override List<dynamic>? get bookmarks {
  final value = _bookmarks;
  if (value == null) return null;
  if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? isActive;
@override final  bool? isLocked;
@override final  int? lastSeen;
@override final  int? createdAt;
@override final  Permissions? permissions;
 final  List<dynamic>? _librariesAccessible;
@override List<dynamic>? get librariesAccessible {
  final value = _librariesAccessible;
  if (value == null) return null;
  if (_librariesAccessible is EqualUnmodifiableListView) return _librariesAccessible;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

 final  List<dynamic>? _itemTagsSelected;
@override List<dynamic>? get itemTagsSelected {
  final value = _itemTagsSelected;
  if (value == null) return null;
  if (_itemTagsSelected is EqualUnmodifiableListView) return _itemTagsSelected;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override final  bool? hasOpenIDLink;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$UserModelCopyWith<_UserModel> get copyWith => __$UserModelCopyWithImpl<_UserModel>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$UserModelToJson(this, );
}
@override
void debugFillProperties(DiagnosticPropertiesBuilder properties) {
  properties
    ..add(DiagnosticsProperty('type', 'UserModel'))
    ..add(DiagnosticsProperty('id', id))..add(DiagnosticsProperty('oldUserId', oldUserId))..add(DiagnosticsProperty('username', username))..add(DiagnosticsProperty('email', email))..add(DiagnosticsProperty('type', type))..add(DiagnosticsProperty('token', token))..add(DiagnosticsProperty('refreshToken', refreshToken))..add(DiagnosticsProperty('mediaProgress', mediaProgress))..add(DiagnosticsProperty('seriesHideFromContinueListening', seriesHideFromContinueListening))..add(DiagnosticsProperty('bookmarks', bookmarks))..add(DiagnosticsProperty('isActive', isActive))..add(DiagnosticsProperty('isLocked', isLocked))..add(DiagnosticsProperty('lastSeen', lastSeen))..add(DiagnosticsProperty('createdAt', createdAt))..add(DiagnosticsProperty('permissions', permissions))..add(DiagnosticsProperty('librariesAccessible', librariesAccessible))..add(DiagnosticsProperty('itemTagsSelected', itemTagsSelected))..add(DiagnosticsProperty('hasOpenIDLink', hasOpenIDLink));
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _UserModel&&(identical(other.id, id) || other.id == id)&&(identical(other.oldUserId, oldUserId) || other.oldUserId == oldUserId)&&(identical(other.username, username) || other.username == username)&&(identical(other.email, email) || other.email == email)&&(identical(other.type, type) || other.type == type)&&(identical(other.token, token) || other.token == token)&&(identical(other.refreshToken, refreshToken) || other.refreshToken == refreshToken)&&const DeepCollectionEquality().equals(other._mediaProgress, _mediaProgress)&&const DeepCollectionEquality().equals(other._seriesHideFromContinueListening, _seriesHideFromContinueListening)&&const DeepCollectionEquality().equals(other._bookmarks, _bookmarks)&&(identical(other.isActive, isActive) || other.isActive == isActive)&&(identical(other.isLocked, isLocked) || other.isLocked == isLocked)&&(identical(other.lastSeen, lastSeen) || other.lastSeen == lastSeen)&&(identical(other.createdAt, createdAt) || other.createdAt == createdAt)&&(identical(other.permissions, permissions) || other.permissions == permissions)&&const DeepCollectionEquality().equals(other._librariesAccessible, _librariesAccessible)&&const DeepCollectionEquality().equals(other._itemTagsSelected, _itemTagsSelected)&&(identical(other.hasOpenIDLink, hasOpenIDLink) || other.hasOpenIDLink == hasOpenIDLink));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,id,oldUserId,username,email,type,token,refreshToken,const DeepCollectionEquality().hash(_mediaProgress),const DeepCollectionEquality().hash(_seriesHideFromContinueListening),const DeepCollectionEquality().hash(_bookmarks),isActive,isLocked,lastSeen,createdAt,permissions,const DeepCollectionEquality().hash(_librariesAccessible),const DeepCollectionEquality().hash(_itemTagsSelected),hasOpenIDLink);

@override
String toString({ DiagnosticLevel minLevel = DiagnosticLevel.info }) {
  return 'UserModel(id: $id, oldUserId: $oldUserId, username: $username, email: $email, type: $type, token: $token, refreshToken: $refreshToken, mediaProgress: $mediaProgress, seriesHideFromContinueListening: $seriesHideFromContinueListening, bookmarks: $bookmarks, isActive: $isActive, isLocked: $isLocked, lastSeen: $lastSeen, createdAt: $createdAt, permissions: $permissions, librariesAccessible: $librariesAccessible, itemTagsSelected: $itemTagsSelected, hasOpenIDLink: $hasOpenIDLink)';
}


}

/// @nodoc
abstract mixin class _$UserModelCopyWith<$Res> implements $UserModelCopyWith<$Res> {
  factory _$UserModelCopyWith(_UserModel value, $Res Function(_UserModel) _then) = __$UserModelCopyWithImpl;
@override @useResult
$Res call({
 String? id, String? oldUserId, String? username, String? email, String? type, String? token, String? refreshToken, List<MediaProgress>? mediaProgress, List<dynamic>? seriesHideFromContinueListening, List<dynamic>? bookmarks, bool? isActive, bool? isLocked, int? lastSeen, int? createdAt, Permissions? permissions, List<dynamic>? librariesAccessible, List<dynamic>? itemTagsSelected, bool? hasOpenIDLink
});


@override $PermissionsCopyWith<$Res>? get permissions;

}
/// @nodoc
class __$UserModelCopyWithImpl<$Res>
    implements _$UserModelCopyWith<$Res> {
  __$UserModelCopyWithImpl(this._self, this._then);

  final _UserModel _self;
  final $Res Function(_UserModel) _then;

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? id = freezed,Object? oldUserId = freezed,Object? username = freezed,Object? email = freezed,Object? type = freezed,Object? token = freezed,Object? refreshToken = freezed,Object? mediaProgress = freezed,Object? seriesHideFromContinueListening = freezed,Object? bookmarks = freezed,Object? isActive = freezed,Object? isLocked = freezed,Object? lastSeen = freezed,Object? createdAt = freezed,Object? permissions = freezed,Object? librariesAccessible = freezed,Object? itemTagsSelected = freezed,Object? hasOpenIDLink = freezed,}) {
  return _then(_UserModel(
id: freezed == id ? _self.id : id // ignore: cast_nullable_to_non_nullable
as String?,oldUserId: freezed == oldUserId ? _self.oldUserId : oldUserId // ignore: cast_nullable_to_non_nullable
as String?,username: freezed == username ? _self.username : username // ignore: cast_nullable_to_non_nullable
as String?,email: freezed == email ? _self.email : email // ignore: cast_nullable_to_non_nullable
as String?,type: freezed == type ? _self.type : type // ignore: cast_nullable_to_non_nullable
as String?,token: freezed == token ? _self.token : token // ignore: cast_nullable_to_non_nullable
as String?,refreshToken: freezed == refreshToken ? _self.refreshToken : refreshToken // ignore: cast_nullable_to_non_nullable
as String?,mediaProgress: freezed == mediaProgress ? _self._mediaProgress : mediaProgress // ignore: cast_nullable_to_non_nullable
as List<MediaProgress>?,seriesHideFromContinueListening: freezed == seriesHideFromContinueListening ? _self._seriesHideFromContinueListening : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,bookmarks: freezed == bookmarks ? _self._bookmarks : bookmarks // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,isActive: freezed == isActive ? _self.isActive : isActive // ignore: cast_nullable_to_non_nullable
as bool?,isLocked: freezed == isLocked ? _self.isLocked : isLocked // ignore: cast_nullable_to_non_nullable
as bool?,lastSeen: freezed == lastSeen ? _self.lastSeen : lastSeen // ignore: cast_nullable_to_non_nullable
as int?,createdAt: freezed == createdAt ? _self.createdAt : createdAt // ignore: cast_nullable_to_non_nullable
as int?,permissions: freezed == permissions ? _self.permissions : permissions // ignore: cast_nullable_to_non_nullable
as Permissions?,librariesAccessible: freezed == librariesAccessible ? _self._librariesAccessible : librariesAccessible // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,itemTagsSelected: freezed == itemTagsSelected ? _self._itemTagsSelected : itemTagsSelected // ignore: cast_nullable_to_non_nullable
as List<dynamic>?,hasOpenIDLink: freezed == hasOpenIDLink ? _self.hasOpenIDLink : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
as bool?,
  ));
}

/// Create a copy of UserModel
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$PermissionsCopyWith<$Res>? get permissions {
    if (_self.permissions == null) {
    return null;
  }

  return $PermissionsCopyWith<$Res>(_self.permissions!, (value) {
    return _then(_self.copyWith(permissions: value));
  });
}
}

// dart format on
