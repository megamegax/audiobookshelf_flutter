// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'user_model.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

UserModel _$UserModelFromJson(Map<String, dynamic> json) {
  return _UserModel.fromJson(json);
}

/// @nodoc
mixin _$UserModel {
  String? get id => throw _privateConstructorUsedError;
  String? get oldUserId => throw _privateConstructorUsedError;
  String? get username => throw _privateConstructorUsedError;
  String? get email => throw _privateConstructorUsedError;
  String? get type => throw _privateConstructorUsedError;
  String? get token => throw _privateConstructorUsedError;
  List<MediaProgress>? get mediaProgress => throw _privateConstructorUsedError;
  List<dynamic>? get seriesHideFromContinueListening =>
      throw _privateConstructorUsedError;
  List<dynamic>? get bookmarks => throw _privateConstructorUsedError;
  bool? get isActive => throw _privateConstructorUsedError;
  bool? get isLocked => throw _privateConstructorUsedError;
  int? get lastSeen => throw _privateConstructorUsedError;
  int? get createdAt => throw _privateConstructorUsedError;
  Permissions? get permissions => throw _privateConstructorUsedError;
  List<dynamic>? get librariesAccessible => throw _privateConstructorUsedError;
  List<dynamic>? get itemTagsSelected => throw _privateConstructorUsedError;
  bool? get hasOpenIDLink => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $UserModelCopyWith<UserModel> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $UserModelCopyWith<$Res> {
  factory $UserModelCopyWith(UserModel value, $Res Function(UserModel) then) =
      _$UserModelCopyWithImpl<$Res, UserModel>;
  @useResult
  $Res call(
      {String? id,
      String? oldUserId,
      String? username,
      String? email,
      String? type,
      String? token,
      List<MediaProgress>? mediaProgress,
      List<dynamic>? seriesHideFromContinueListening,
      List<dynamic>? bookmarks,
      bool? isActive,
      bool? isLocked,
      int? lastSeen,
      int? createdAt,
      Permissions? permissions,
      List<dynamic>? librariesAccessible,
      List<dynamic>? itemTagsSelected,
      bool? hasOpenIDLink});

  $PermissionsCopyWith<$Res>? get permissions;
}

/// @nodoc
class _$UserModelCopyWithImpl<$Res, $Val extends UserModel>
    implements $UserModelCopyWith<$Res> {
  _$UserModelCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? oldUserId = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? token = freezed,
    Object? mediaProgress = freezed,
    Object? seriesHideFromContinueListening = freezed,
    Object? bookmarks = freezed,
    Object? isActive = freezed,
    Object? isLocked = freezed,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? permissions = freezed,
    Object? librariesAccessible = freezed,
    Object? itemTagsSelected = freezed,
    Object? hasOpenIDLink = freezed,
  }) {
    return _then(_value.copyWith(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      oldUserId: freezed == oldUserId
          ? _value.oldUserId
          : oldUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaProgress: freezed == mediaProgress
          ? _value.mediaProgress
          : mediaProgress // ignore: cast_nullable_to_non_nullable
              as List<MediaProgress>?,
      seriesHideFromContinueListening: freezed ==
              seriesHideFromContinueListening
          ? _value.seriesHideFromContinueListening
          : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      bookmarks: freezed == bookmarks
          ? _value.bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions?,
      librariesAccessible: freezed == librariesAccessible
          ? _value.librariesAccessible
          : librariesAccessible // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      itemTagsSelected: freezed == itemTagsSelected
          ? _value.itemTagsSelected
          : itemTagsSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hasOpenIDLink: freezed == hasOpenIDLink
          ? _value.hasOpenIDLink
          : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
              as bool?,
    ) as $Val);
  }

  @override
  @pragma('vm:prefer-inline')
  $PermissionsCopyWith<$Res>? get permissions {
    if (_value.permissions == null) {
      return null;
    }

    return $PermissionsCopyWith<$Res>(_value.permissions!, (value) {
      return _then(_value.copyWith(permissions: value) as $Val);
    });
  }
}

/// @nodoc
abstract class _$$UserModelImplCopyWith<$Res>
    implements $UserModelCopyWith<$Res> {
  factory _$$UserModelImplCopyWith(
          _$UserModelImpl value, $Res Function(_$UserModelImpl) then) =
      __$$UserModelImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call(
      {String? id,
      String? oldUserId,
      String? username,
      String? email,
      String? type,
      String? token,
      List<MediaProgress>? mediaProgress,
      List<dynamic>? seriesHideFromContinueListening,
      List<dynamic>? bookmarks,
      bool? isActive,
      bool? isLocked,
      int? lastSeen,
      int? createdAt,
      Permissions? permissions,
      List<dynamic>? librariesAccessible,
      List<dynamic>? itemTagsSelected,
      bool? hasOpenIDLink});

  @override
  $PermissionsCopyWith<$Res>? get permissions;
}

/// @nodoc
class __$$UserModelImplCopyWithImpl<$Res>
    extends _$UserModelCopyWithImpl<$Res, _$UserModelImpl>
    implements _$$UserModelImplCopyWith<$Res> {
  __$$UserModelImplCopyWithImpl(
      _$UserModelImpl _value, $Res Function(_$UserModelImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = freezed,
    Object? oldUserId = freezed,
    Object? username = freezed,
    Object? email = freezed,
    Object? type = freezed,
    Object? token = freezed,
    Object? mediaProgress = freezed,
    Object? seriesHideFromContinueListening = freezed,
    Object? bookmarks = freezed,
    Object? isActive = freezed,
    Object? isLocked = freezed,
    Object? lastSeen = freezed,
    Object? createdAt = freezed,
    Object? permissions = freezed,
    Object? librariesAccessible = freezed,
    Object? itemTagsSelected = freezed,
    Object? hasOpenIDLink = freezed,
  }) {
    return _then(_$UserModelImpl(
      id: freezed == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as String?,
      oldUserId: freezed == oldUserId
          ? _value.oldUserId
          : oldUserId // ignore: cast_nullable_to_non_nullable
              as String?,
      username: freezed == username
          ? _value.username
          : username // ignore: cast_nullable_to_non_nullable
              as String?,
      email: freezed == email
          ? _value.email
          : email // ignore: cast_nullable_to_non_nullable
              as String?,
      type: freezed == type
          ? _value.type
          : type // ignore: cast_nullable_to_non_nullable
              as String?,
      token: freezed == token
          ? _value.token
          : token // ignore: cast_nullable_to_non_nullable
              as String?,
      mediaProgress: freezed == mediaProgress
          ? _value._mediaProgress
          : mediaProgress // ignore: cast_nullable_to_non_nullable
              as List<MediaProgress>?,
      seriesHideFromContinueListening: freezed ==
              seriesHideFromContinueListening
          ? _value._seriesHideFromContinueListening
          : seriesHideFromContinueListening // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      bookmarks: freezed == bookmarks
          ? _value._bookmarks
          : bookmarks // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      isActive: freezed == isActive
          ? _value.isActive
          : isActive // ignore: cast_nullable_to_non_nullable
              as bool?,
      isLocked: freezed == isLocked
          ? _value.isLocked
          : isLocked // ignore: cast_nullable_to_non_nullable
              as bool?,
      lastSeen: freezed == lastSeen
          ? _value.lastSeen
          : lastSeen // ignore: cast_nullable_to_non_nullable
              as int?,
      createdAt: freezed == createdAt
          ? _value.createdAt
          : createdAt // ignore: cast_nullable_to_non_nullable
              as int?,
      permissions: freezed == permissions
          ? _value.permissions
          : permissions // ignore: cast_nullable_to_non_nullable
              as Permissions?,
      librariesAccessible: freezed == librariesAccessible
          ? _value._librariesAccessible
          : librariesAccessible // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      itemTagsSelected: freezed == itemTagsSelected
          ? _value._itemTagsSelected
          : itemTagsSelected // ignore: cast_nullable_to_non_nullable
              as List<dynamic>?,
      hasOpenIDLink: freezed == hasOpenIDLink
          ? _value.hasOpenIDLink
          : hasOpenIDLink // ignore: cast_nullable_to_non_nullable
              as bool?,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$UserModelImpl with DiagnosticableTreeMixin implements _UserModel {
  const _$UserModelImpl(
      {this.id,
      this.oldUserId,
      this.username,
      this.email,
      this.type,
      this.token,
      final List<MediaProgress>? mediaProgress,
      final List<dynamic>? seriesHideFromContinueListening,
      final List<dynamic>? bookmarks,
      this.isActive,
      this.isLocked,
      this.lastSeen,
      this.createdAt,
      this.permissions,
      final List<dynamic>? librariesAccessible,
      final List<dynamic>? itemTagsSelected,
      this.hasOpenIDLink})
      : _mediaProgress = mediaProgress,
        _seriesHideFromContinueListening = seriesHideFromContinueListening,
        _bookmarks = bookmarks,
        _librariesAccessible = librariesAccessible,
        _itemTagsSelected = itemTagsSelected;

  factory _$UserModelImpl.fromJson(Map<String, dynamic> json) =>
      _$$UserModelImplFromJson(json);

  @override
  final String? id;
  @override
  final String? oldUserId;
  @override
  final String? username;
  @override
  final String? email;
  @override
  final String? type;
  @override
  final String? token;
  final List<MediaProgress>? _mediaProgress;
  @override
  List<MediaProgress>? get mediaProgress {
    final value = _mediaProgress;
    if (value == null) return null;
    if (_mediaProgress is EqualUnmodifiableListView) return _mediaProgress;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _seriesHideFromContinueListening;
  @override
  List<dynamic>? get seriesHideFromContinueListening {
    final value = _seriesHideFromContinueListening;
    if (value == null) return null;
    if (_seriesHideFromContinueListening is EqualUnmodifiableListView)
      return _seriesHideFromContinueListening;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _bookmarks;
  @override
  List<dynamic>? get bookmarks {
    final value = _bookmarks;
    if (value == null) return null;
    if (_bookmarks is EqualUnmodifiableListView) return _bookmarks;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? isActive;
  @override
  final bool? isLocked;
  @override
  final int? lastSeen;
  @override
  final int? createdAt;
  @override
  final Permissions? permissions;
  final List<dynamic>? _librariesAccessible;
  @override
  List<dynamic>? get librariesAccessible {
    final value = _librariesAccessible;
    if (value == null) return null;
    if (_librariesAccessible is EqualUnmodifiableListView)
      return _librariesAccessible;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  final List<dynamic>? _itemTagsSelected;
  @override
  List<dynamic>? get itemTagsSelected {
    final value = _itemTagsSelected;
    if (value == null) return null;
    if (_itemTagsSelected is EqualUnmodifiableListView)
      return _itemTagsSelected;
    // ignore: implicit_dynamic_type
    return EqualUnmodifiableListView(value);
  }

  @override
  final bool? hasOpenIDLink;

  @override
  String toString({DiagnosticLevel minLevel = DiagnosticLevel.info}) {
    return 'UserModel(id: $id, oldUserId: $oldUserId, username: $username, email: $email, type: $type, token: $token, mediaProgress: $mediaProgress, seriesHideFromContinueListening: $seriesHideFromContinueListening, bookmarks: $bookmarks, isActive: $isActive, isLocked: $isLocked, lastSeen: $lastSeen, createdAt: $createdAt, permissions: $permissions, librariesAccessible: $librariesAccessible, itemTagsSelected: $itemTagsSelected, hasOpenIDLink: $hasOpenIDLink)';
  }

  @override
  void debugFillProperties(DiagnosticPropertiesBuilder properties) {
    super.debugFillProperties(properties);
    properties
      ..add(DiagnosticsProperty('type', 'UserModel'))
      ..add(DiagnosticsProperty('id', id))
      ..add(DiagnosticsProperty('oldUserId', oldUserId))
      ..add(DiagnosticsProperty('username', username))
      ..add(DiagnosticsProperty('email', email))
      ..add(DiagnosticsProperty('type', type))
      ..add(DiagnosticsProperty('token', token))
      ..add(DiagnosticsProperty('mediaProgress', mediaProgress))
      ..add(DiagnosticsProperty(
          'seriesHideFromContinueListening', seriesHideFromContinueListening))
      ..add(DiagnosticsProperty('bookmarks', bookmarks))
      ..add(DiagnosticsProperty('isActive', isActive))
      ..add(DiagnosticsProperty('isLocked', isLocked))
      ..add(DiagnosticsProperty('lastSeen', lastSeen))
      ..add(DiagnosticsProperty('createdAt', createdAt))
      ..add(DiagnosticsProperty('permissions', permissions))
      ..add(DiagnosticsProperty('librariesAccessible', librariesAccessible))
      ..add(DiagnosticsProperty('itemTagsSelected', itemTagsSelected))
      ..add(DiagnosticsProperty('hasOpenIDLink', hasOpenIDLink));
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$UserModelImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.oldUserId, oldUserId) ||
                other.oldUserId == oldUserId) &&
            (identical(other.username, username) ||
                other.username == username) &&
            (identical(other.email, email) || other.email == email) &&
            (identical(other.type, type) || other.type == type) &&
            (identical(other.token, token) || other.token == token) &&
            const DeepCollectionEquality()
                .equals(other._mediaProgress, _mediaProgress) &&
            const DeepCollectionEquality().equals(
                other._seriesHideFromContinueListening,
                _seriesHideFromContinueListening) &&
            const DeepCollectionEquality()
                .equals(other._bookmarks, _bookmarks) &&
            (identical(other.isActive, isActive) ||
                other.isActive == isActive) &&
            (identical(other.isLocked, isLocked) ||
                other.isLocked == isLocked) &&
            (identical(other.lastSeen, lastSeen) ||
                other.lastSeen == lastSeen) &&
            (identical(other.createdAt, createdAt) ||
                other.createdAt == createdAt) &&
            (identical(other.permissions, permissions) ||
                other.permissions == permissions) &&
            const DeepCollectionEquality()
                .equals(other._librariesAccessible, _librariesAccessible) &&
            const DeepCollectionEquality()
                .equals(other._itemTagsSelected, _itemTagsSelected) &&
            (identical(other.hasOpenIDLink, hasOpenIDLink) ||
                other.hasOpenIDLink == hasOpenIDLink));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(
      runtimeType,
      id,
      oldUserId,
      username,
      email,
      type,
      token,
      const DeepCollectionEquality().hash(_mediaProgress),
      const DeepCollectionEquality().hash(_seriesHideFromContinueListening),
      const DeepCollectionEquality().hash(_bookmarks),
      isActive,
      isLocked,
      lastSeen,
      createdAt,
      permissions,
      const DeepCollectionEquality().hash(_librariesAccessible),
      const DeepCollectionEquality().hash(_itemTagsSelected),
      hasOpenIDLink);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      __$$UserModelImplCopyWithImpl<_$UserModelImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$UserModelImplToJson(
      this,
    );
  }
}

abstract class _UserModel implements UserModel {
  const factory _UserModel(
      {final String? id,
      final String? oldUserId,
      final String? username,
      final String? email,
      final String? type,
      final String? token,
      final List<MediaProgress>? mediaProgress,
      final List<dynamic>? seriesHideFromContinueListening,
      final List<dynamic>? bookmarks,
      final bool? isActive,
      final bool? isLocked,
      final int? lastSeen,
      final int? createdAt,
      final Permissions? permissions,
      final List<dynamic>? librariesAccessible,
      final List<dynamic>? itemTagsSelected,
      final bool? hasOpenIDLink}) = _$UserModelImpl;

  factory _UserModel.fromJson(Map<String, dynamic> json) =
      _$UserModelImpl.fromJson;

  @override
  String? get id;
  @override
  String? get oldUserId;
  @override
  String? get username;
  @override
  String? get email;
  @override
  String? get type;
  @override
  String? get token;
  @override
  List<MediaProgress>? get mediaProgress;
  @override
  List<dynamic>? get seriesHideFromContinueListening;
  @override
  List<dynamic>? get bookmarks;
  @override
  bool? get isActive;
  @override
  bool? get isLocked;
  @override
  int? get lastSeen;
  @override
  int? get createdAt;
  @override
  Permissions? get permissions;
  @override
  List<dynamic>? get librariesAccessible;
  @override
  List<dynamic>? get itemTagsSelected;
  @override
  bool? get hasOpenIDLink;
  @override
  @JsonKey(ignore: true)
  _$$UserModelImplCopyWith<_$UserModelImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
