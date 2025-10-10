// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'selected_book_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$SelectedBookState {

 DetailedLibraryItem? get book; Uint8List? get coverImageBytes;
/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$SelectedBookStateCopyWith<SelectedBookState> get copyWith => _$SelectedBookStateCopyWithImpl<SelectedBookState>(this as SelectedBookState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is SelectedBookState&&(identical(other.book, book) || other.book == book)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,book,const DeepCollectionEquality().hash(coverImageBytes));

@override
String toString() {
  return 'SelectedBookState(book: $book, coverImageBytes: $coverImageBytes)';
}


}

/// @nodoc
abstract mixin class $SelectedBookStateCopyWith<$Res>  {
  factory $SelectedBookStateCopyWith(SelectedBookState value, $Res Function(SelectedBookState) _then) = _$SelectedBookStateCopyWithImpl;
@useResult
$Res call({
 DetailedLibraryItem? book, Uint8List? coverImageBytes
});


$DetailedLibraryItemCopyWith<$Res>? get book;

}
/// @nodoc
class _$SelectedBookStateCopyWithImpl<$Res>
    implements $SelectedBookStateCopyWith<$Res> {
  _$SelectedBookStateCopyWithImpl(this._self, this._then);

  final SelectedBookState _self;
  final $Res Function(SelectedBookState) _then;

/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? book = freezed,Object? coverImageBytes = freezed,}) {
  return _then(_self.copyWith(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem?,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}
/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $DetailedLibraryItemCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}


/// Adds pattern-matching-related methods to [SelectedBookState].
extension SelectedBookStatePatterns on SelectedBookState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _SelectedBookState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _SelectedBookState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _SelectedBookState value)  $default,){
final _that = this;
switch (_that) {
case _SelectedBookState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _SelectedBookState value)?  $default,){
final _that = this;
switch (_that) {
case _SelectedBookState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( DetailedLibraryItem? book,  Uint8List? coverImageBytes)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _SelectedBookState() when $default != null:
return $default(_that.book,_that.coverImageBytes);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( DetailedLibraryItem? book,  Uint8List? coverImageBytes)  $default,) {final _that = this;
switch (_that) {
case _SelectedBookState():
return $default(_that.book,_that.coverImageBytes);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( DetailedLibraryItem? book,  Uint8List? coverImageBytes)?  $default,) {final _that = this;
switch (_that) {
case _SelectedBookState() when $default != null:
return $default(_that.book,_that.coverImageBytes);case _:
  return null;

}
}

}

/// @nodoc


class _SelectedBookState implements SelectedBookState {
  const _SelectedBookState({this.book, this.coverImageBytes});
  

@override final  DetailedLibraryItem? book;
@override final  Uint8List? coverImageBytes;

/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$SelectedBookStateCopyWith<_SelectedBookState> get copyWith => __$SelectedBookStateCopyWithImpl<_SelectedBookState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _SelectedBookState&&(identical(other.book, book) || other.book == book)&&const DeepCollectionEquality().equals(other.coverImageBytes, coverImageBytes));
}


@override
int get hashCode => Object.hash(runtimeType,book,const DeepCollectionEquality().hash(coverImageBytes));

@override
String toString() {
  return 'SelectedBookState(book: $book, coverImageBytes: $coverImageBytes)';
}


}

/// @nodoc
abstract mixin class _$SelectedBookStateCopyWith<$Res> implements $SelectedBookStateCopyWith<$Res> {
  factory _$SelectedBookStateCopyWith(_SelectedBookState value, $Res Function(_SelectedBookState) _then) = __$SelectedBookStateCopyWithImpl;
@override @useResult
$Res call({
 DetailedLibraryItem? book, Uint8List? coverImageBytes
});


@override $DetailedLibraryItemCopyWith<$Res>? get book;

}
/// @nodoc
class __$SelectedBookStateCopyWithImpl<$Res>
    implements _$SelectedBookStateCopyWith<$Res> {
  __$SelectedBookStateCopyWithImpl(this._self, this._then);

  final _SelectedBookState _self;
  final $Res Function(_SelectedBookState) _then;

/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? book = freezed,Object? coverImageBytes = freezed,}) {
  return _then(_SelectedBookState(
book: freezed == book ? _self.book : book // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem?,coverImageBytes: freezed == coverImageBytes ? _self.coverImageBytes : coverImageBytes // ignore: cast_nullable_to_non_nullable
as Uint8List?,
  ));
}

/// Create a copy of SelectedBookState
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res>? get book {
    if (_self.book == null) {
    return null;
  }

  return $DetailedLibraryItemCopyWith<$Res>(_self.book!, (value) {
    return _then(_self.copyWith(book: value));
  });
}
}

// dart format on
