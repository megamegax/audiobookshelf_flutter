// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_details_state.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$BookDetailsData {

 LibraryItemEntity get item; DetailedLibraryItem? get detailedItem; bool get isLoading; String? get error;
/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDetailsDataCopyWith<BookDetailsData> get copyWith => _$BookDetailsDataCopyWithImpl<BookDetailsData>(this as BookDetailsData, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDetailsData&&(identical(other.item, item) || other.item == item)&&(identical(other.detailedItem, detailedItem) || other.detailedItem == detailedItem)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,detailedItem,isLoading,error);

@override
String toString() {
  return 'BookDetailsData(item: $item, detailedItem: $detailedItem, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class $BookDetailsDataCopyWith<$Res>  {
  factory $BookDetailsDataCopyWith(BookDetailsData value, $Res Function(BookDetailsData) _then) = _$BookDetailsDataCopyWithImpl;
@useResult
$Res call({
 LibraryItemEntity item, DetailedLibraryItem? detailedItem, bool isLoading, String? error
});


$DetailedLibraryItemCopyWith<$Res>? get detailedItem;

}
/// @nodoc
class _$BookDetailsDataCopyWithImpl<$Res>
    implements $BookDetailsDataCopyWith<$Res> {
  _$BookDetailsDataCopyWithImpl(this._self, this._then);

  final BookDetailsData _self;
  final $Res Function(BookDetailsData) _then;

/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? item = null,Object? detailedItem = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_self.copyWith(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as LibraryItemEntity,detailedItem: freezed == detailedItem ? _self.detailedItem : detailedItem // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}
/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res>? get detailedItem {
    if (_self.detailedItem == null) {
    return null;
  }

  return $DetailedLibraryItemCopyWith<$Res>(_self.detailedItem!, (value) {
    return _then(_self.copyWith(detailedItem: value));
  });
}
}


/// Adds pattern-matching-related methods to [BookDetailsData].
extension BookDetailsDataPatterns on BookDetailsData {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDetailsData value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDetailsData() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDetailsData value)  $default,){
final _that = this;
switch (_that) {
case _BookDetailsData():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDetailsData value)?  $default,){
final _that = this;
switch (_that) {
case _BookDetailsData() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( LibraryItemEntity item,  DetailedLibraryItem? detailedItem,  bool isLoading,  String? error)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDetailsData() when $default != null:
return $default(_that.item,_that.detailedItem,_that.isLoading,_that.error);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( LibraryItemEntity item,  DetailedLibraryItem? detailedItem,  bool isLoading,  String? error)  $default,) {final _that = this;
switch (_that) {
case _BookDetailsData():
return $default(_that.item,_that.detailedItem,_that.isLoading,_that.error);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( LibraryItemEntity item,  DetailedLibraryItem? detailedItem,  bool isLoading,  String? error)?  $default,) {final _that = this;
switch (_that) {
case _BookDetailsData() when $default != null:
return $default(_that.item,_that.detailedItem,_that.isLoading,_that.error);case _:
  return null;

}
}

}

/// @nodoc


class _BookDetailsData implements BookDetailsData {
  const _BookDetailsData({required this.item, this.detailedItem, this.isLoading = false, this.error});
  

@override final  LibraryItemEntity item;
@override final  DetailedLibraryItem? detailedItem;
@override@JsonKey() final  bool isLoading;
@override final  String? error;

/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDetailsDataCopyWith<_BookDetailsData> get copyWith => __$BookDetailsDataCopyWithImpl<_BookDetailsData>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDetailsData&&(identical(other.item, item) || other.item == item)&&(identical(other.detailedItem, detailedItem) || other.detailedItem == detailedItem)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error));
}


@override
int get hashCode => Object.hash(runtimeType,item,detailedItem,isLoading,error);

@override
String toString() {
  return 'BookDetailsData(item: $item, detailedItem: $detailedItem, isLoading: $isLoading, error: $error)';
}


}

/// @nodoc
abstract mixin class _$BookDetailsDataCopyWith<$Res> implements $BookDetailsDataCopyWith<$Res> {
  factory _$BookDetailsDataCopyWith(_BookDetailsData value, $Res Function(_BookDetailsData) _then) = __$BookDetailsDataCopyWithImpl;
@override @useResult
$Res call({
 LibraryItemEntity item, DetailedLibraryItem? detailedItem, bool isLoading, String? error
});


@override $DetailedLibraryItemCopyWith<$Res>? get detailedItem;

}
/// @nodoc
class __$BookDetailsDataCopyWithImpl<$Res>
    implements _$BookDetailsDataCopyWith<$Res> {
  __$BookDetailsDataCopyWithImpl(this._self, this._then);

  final _BookDetailsData _self;
  final $Res Function(_BookDetailsData) _then;

/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? item = null,Object? detailedItem = freezed,Object? isLoading = null,Object? error = freezed,}) {
  return _then(_BookDetailsData(
item: null == item ? _self.item : item // ignore: cast_nullable_to_non_nullable
as LibraryItemEntity,detailedItem: freezed == detailedItem ? _self.detailedItem : detailedItem // ignore: cast_nullable_to_non_nullable
as DetailedLibraryItem?,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

/// Create a copy of BookDetailsData
/// with the given fields replaced by the non-null parameter values.
@override
@pragma('vm:prefer-inline')
$DetailedLibraryItemCopyWith<$Res>? get detailedItem {
    if (_self.detailedItem == null) {
    return null;
  }

  return $DetailedLibraryItemCopyWith<$Res>(_self.detailedItem!, (value) {
    return _then(_self.copyWith(detailedItem: value));
  });
}
}

/// @nodoc
mixin _$BookDetailsUI {

 bool get isDescriptionExpanded; bool get showCoverModal; Set<String> get expandedSections;
/// Create a copy of BookDetailsUI
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$BookDetailsUICopyWith<BookDetailsUI> get copyWith => _$BookDetailsUICopyWithImpl<BookDetailsUI>(this as BookDetailsUI, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is BookDetailsUI&&(identical(other.isDescriptionExpanded, isDescriptionExpanded) || other.isDescriptionExpanded == isDescriptionExpanded)&&(identical(other.showCoverModal, showCoverModal) || other.showCoverModal == showCoverModal)&&const DeepCollectionEquality().equals(other.expandedSections, expandedSections));
}


@override
int get hashCode => Object.hash(runtimeType,isDescriptionExpanded,showCoverModal,const DeepCollectionEquality().hash(expandedSections));

@override
String toString() {
  return 'BookDetailsUI(isDescriptionExpanded: $isDescriptionExpanded, showCoverModal: $showCoverModal, expandedSections: $expandedSections)';
}


}

/// @nodoc
abstract mixin class $BookDetailsUICopyWith<$Res>  {
  factory $BookDetailsUICopyWith(BookDetailsUI value, $Res Function(BookDetailsUI) _then) = _$BookDetailsUICopyWithImpl;
@useResult
$Res call({
 bool isDescriptionExpanded, bool showCoverModal, Set<String> expandedSections
});




}
/// @nodoc
class _$BookDetailsUICopyWithImpl<$Res>
    implements $BookDetailsUICopyWith<$Res> {
  _$BookDetailsUICopyWithImpl(this._self, this._then);

  final BookDetailsUI _self;
  final $Res Function(BookDetailsUI) _then;

/// Create a copy of BookDetailsUI
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? isDescriptionExpanded = null,Object? showCoverModal = null,Object? expandedSections = null,}) {
  return _then(_self.copyWith(
isDescriptionExpanded: null == isDescriptionExpanded ? _self.isDescriptionExpanded : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
as bool,showCoverModal: null == showCoverModal ? _self.showCoverModal : showCoverModal // ignore: cast_nullable_to_non_nullable
as bool,expandedSections: null == expandedSections ? _self.expandedSections : expandedSections // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [BookDetailsUI].
extension BookDetailsUIPatterns on BookDetailsUI {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _BookDetailsUI value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _BookDetailsUI() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _BookDetailsUI value)  $default,){
final _that = this;
switch (_that) {
case _BookDetailsUI():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _BookDetailsUI value)?  $default,){
final _that = this;
switch (_that) {
case _BookDetailsUI() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( bool isDescriptionExpanded,  bool showCoverModal,  Set<String> expandedSections)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _BookDetailsUI() when $default != null:
return $default(_that.isDescriptionExpanded,_that.showCoverModal,_that.expandedSections);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( bool isDescriptionExpanded,  bool showCoverModal,  Set<String> expandedSections)  $default,) {final _that = this;
switch (_that) {
case _BookDetailsUI():
return $default(_that.isDescriptionExpanded,_that.showCoverModal,_that.expandedSections);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( bool isDescriptionExpanded,  bool showCoverModal,  Set<String> expandedSections)?  $default,) {final _that = this;
switch (_that) {
case _BookDetailsUI() when $default != null:
return $default(_that.isDescriptionExpanded,_that.showCoverModal,_that.expandedSections);case _:
  return null;

}
}

}

/// @nodoc


class _BookDetailsUI implements BookDetailsUI {
  const _BookDetailsUI({this.isDescriptionExpanded = false, this.showCoverModal = false, final  Set<String> expandedSections = const <String>{}}): _expandedSections = expandedSections;
  

@override@JsonKey() final  bool isDescriptionExpanded;
@override@JsonKey() final  bool showCoverModal;
 final  Set<String> _expandedSections;
@override@JsonKey() Set<String> get expandedSections {
  if (_expandedSections is EqualUnmodifiableSetView) return _expandedSections;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableSetView(_expandedSections);
}


/// Create a copy of BookDetailsUI
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$BookDetailsUICopyWith<_BookDetailsUI> get copyWith => __$BookDetailsUICopyWithImpl<_BookDetailsUI>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _BookDetailsUI&&(identical(other.isDescriptionExpanded, isDescriptionExpanded) || other.isDescriptionExpanded == isDescriptionExpanded)&&(identical(other.showCoverModal, showCoverModal) || other.showCoverModal == showCoverModal)&&const DeepCollectionEquality().equals(other._expandedSections, _expandedSections));
}


@override
int get hashCode => Object.hash(runtimeType,isDescriptionExpanded,showCoverModal,const DeepCollectionEquality().hash(_expandedSections));

@override
String toString() {
  return 'BookDetailsUI(isDescriptionExpanded: $isDescriptionExpanded, showCoverModal: $showCoverModal, expandedSections: $expandedSections)';
}


}

/// @nodoc
abstract mixin class _$BookDetailsUICopyWith<$Res> implements $BookDetailsUICopyWith<$Res> {
  factory _$BookDetailsUICopyWith(_BookDetailsUI value, $Res Function(_BookDetailsUI) _then) = __$BookDetailsUICopyWithImpl;
@override @useResult
$Res call({
 bool isDescriptionExpanded, bool showCoverModal, Set<String> expandedSections
});




}
/// @nodoc
class __$BookDetailsUICopyWithImpl<$Res>
    implements _$BookDetailsUICopyWith<$Res> {
  __$BookDetailsUICopyWithImpl(this._self, this._then);

  final _BookDetailsUI _self;
  final $Res Function(_BookDetailsUI) _then;

/// Create a copy of BookDetailsUI
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? isDescriptionExpanded = null,Object? showCoverModal = null,Object? expandedSections = null,}) {
  return _then(_BookDetailsUI(
isDescriptionExpanded: null == isDescriptionExpanded ? _self.isDescriptionExpanded : isDescriptionExpanded // ignore: cast_nullable_to_non_nullable
as bool,showCoverModal: null == showCoverModal ? _self.showCoverModal : showCoverModal // ignore: cast_nullable_to_non_nullable
as bool,expandedSections: null == expandedSections ? _self._expandedSections : expandedSections // ignore: cast_nullable_to_non_nullable
as Set<String>,
  ));
}


}

// dart format on
