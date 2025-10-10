// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_tags.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$MetaTags {

 String? get tagAlbum; String? get tagArtist; String? get tagGenre; String? get tagTitle; String? get tagSeries; String? get tagSeriesPart; String? get tagAlbumArtist; String? get tagDate; String? get tagComposer; String? get tagPublisher; String? get tagComment; String? get tagLanguage; String? get tagASIN;
/// Create a copy of MetaTags
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetaTagsCopyWith<MetaTags> get copyWith => _$MetaTagsCopyWithImpl<MetaTags>(this as MetaTags, _$identity);

  /// Serializes this MetaTags to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is MetaTags&&(identical(other.tagAlbum, tagAlbum) || other.tagAlbum == tagAlbum)&&(identical(other.tagArtist, tagArtist) || other.tagArtist == tagArtist)&&(identical(other.tagGenre, tagGenre) || other.tagGenre == tagGenre)&&(identical(other.tagTitle, tagTitle) || other.tagTitle == tagTitle)&&(identical(other.tagSeries, tagSeries) || other.tagSeries == tagSeries)&&(identical(other.tagSeriesPart, tagSeriesPart) || other.tagSeriesPart == tagSeriesPart)&&(identical(other.tagAlbumArtist, tagAlbumArtist) || other.tagAlbumArtist == tagAlbumArtist)&&(identical(other.tagDate, tagDate) || other.tagDate == tagDate)&&(identical(other.tagComposer, tagComposer) || other.tagComposer == tagComposer)&&(identical(other.tagPublisher, tagPublisher) || other.tagPublisher == tagPublisher)&&(identical(other.tagComment, tagComment) || other.tagComment == tagComment)&&(identical(other.tagLanguage, tagLanguage) || other.tagLanguage == tagLanguage)&&(identical(other.tagASIN, tagASIN) || other.tagASIN == tagASIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagAlbum,tagArtist,tagGenre,tagTitle,tagSeries,tagSeriesPart,tagAlbumArtist,tagDate,tagComposer,tagPublisher,tagComment,tagLanguage,tagASIN);

@override
String toString() {
  return 'MetaTags(tagAlbum: $tagAlbum, tagArtist: $tagArtist, tagGenre: $tagGenre, tagTitle: $tagTitle, tagSeries: $tagSeries, tagSeriesPart: $tagSeriesPart, tagAlbumArtist: $tagAlbumArtist, tagDate: $tagDate, tagComposer: $tagComposer, tagPublisher: $tagPublisher, tagComment: $tagComment, tagLanguage: $tagLanguage, tagASIN: $tagASIN)';
}


}

/// @nodoc
abstract mixin class $MetaTagsCopyWith<$Res>  {
  factory $MetaTagsCopyWith(MetaTags value, $Res Function(MetaTags) _then) = _$MetaTagsCopyWithImpl;
@useResult
$Res call({
 String? tagAlbum, String? tagArtist, String? tagGenre, String? tagTitle, String? tagSeries, String? tagSeriesPart, String? tagAlbumArtist, String? tagDate, String? tagComposer, String? tagPublisher, String? tagComment, String? tagLanguage, String? tagASIN
});




}
/// @nodoc
class _$MetaTagsCopyWithImpl<$Res>
    implements $MetaTagsCopyWith<$Res> {
  _$MetaTagsCopyWithImpl(this._self, this._then);

  final MetaTags _self;
  final $Res Function(MetaTags) _then;

/// Create a copy of MetaTags
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? tagAlbum = freezed,Object? tagArtist = freezed,Object? tagGenre = freezed,Object? tagTitle = freezed,Object? tagSeries = freezed,Object? tagSeriesPart = freezed,Object? tagAlbumArtist = freezed,Object? tagDate = freezed,Object? tagComposer = freezed,Object? tagPublisher = freezed,Object? tagComment = freezed,Object? tagLanguage = freezed,Object? tagASIN = freezed,}) {
  return _then(_self.copyWith(
tagAlbum: freezed == tagAlbum ? _self.tagAlbum : tagAlbum // ignore: cast_nullable_to_non_nullable
as String?,tagArtist: freezed == tagArtist ? _self.tagArtist : tagArtist // ignore: cast_nullable_to_non_nullable
as String?,tagGenre: freezed == tagGenre ? _self.tagGenre : tagGenre // ignore: cast_nullable_to_non_nullable
as String?,tagTitle: freezed == tagTitle ? _self.tagTitle : tagTitle // ignore: cast_nullable_to_non_nullable
as String?,tagSeries: freezed == tagSeries ? _self.tagSeries : tagSeries // ignore: cast_nullable_to_non_nullable
as String?,tagSeriesPart: freezed == tagSeriesPart ? _self.tagSeriesPart : tagSeriesPart // ignore: cast_nullable_to_non_nullable
as String?,tagAlbumArtist: freezed == tagAlbumArtist ? _self.tagAlbumArtist : tagAlbumArtist // ignore: cast_nullable_to_non_nullable
as String?,tagDate: freezed == tagDate ? _self.tagDate : tagDate // ignore: cast_nullable_to_non_nullable
as String?,tagComposer: freezed == tagComposer ? _self.tagComposer : tagComposer // ignore: cast_nullable_to_non_nullable
as String?,tagPublisher: freezed == tagPublisher ? _self.tagPublisher : tagPublisher // ignore: cast_nullable_to_non_nullable
as String?,tagComment: freezed == tagComment ? _self.tagComment : tagComment // ignore: cast_nullable_to_non_nullable
as String?,tagLanguage: freezed == tagLanguage ? _self.tagLanguage : tagLanguage // ignore: cast_nullable_to_non_nullable
as String?,tagASIN: freezed == tagASIN ? _self.tagASIN : tagASIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}

}


/// Adds pattern-matching-related methods to [MetaTags].
extension MetaTagsPatterns on MetaTags {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _MetaTags value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _MetaTags() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _MetaTags value)  $default,){
final _that = this;
switch (_that) {
case _MetaTags():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _MetaTags value)?  $default,){
final _that = this;
switch (_that) {
case _MetaTags() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? tagAlbum,  String? tagArtist,  String? tagGenre,  String? tagTitle,  String? tagSeries,  String? tagSeriesPart,  String? tagAlbumArtist,  String? tagDate,  String? tagComposer,  String? tagPublisher,  String? tagComment,  String? tagLanguage,  String? tagASIN)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _MetaTags() when $default != null:
return $default(_that.tagAlbum,_that.tagArtist,_that.tagGenre,_that.tagTitle,_that.tagSeries,_that.tagSeriesPart,_that.tagAlbumArtist,_that.tagDate,_that.tagComposer,_that.tagPublisher,_that.tagComment,_that.tagLanguage,_that.tagASIN);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? tagAlbum,  String? tagArtist,  String? tagGenre,  String? tagTitle,  String? tagSeries,  String? tagSeriesPart,  String? tagAlbumArtist,  String? tagDate,  String? tagComposer,  String? tagPublisher,  String? tagComment,  String? tagLanguage,  String? tagASIN)  $default,) {final _that = this;
switch (_that) {
case _MetaTags():
return $default(_that.tagAlbum,_that.tagArtist,_that.tagGenre,_that.tagTitle,_that.tagSeries,_that.tagSeriesPart,_that.tagAlbumArtist,_that.tagDate,_that.tagComposer,_that.tagPublisher,_that.tagComment,_that.tagLanguage,_that.tagASIN);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? tagAlbum,  String? tagArtist,  String? tagGenre,  String? tagTitle,  String? tagSeries,  String? tagSeriesPart,  String? tagAlbumArtist,  String? tagDate,  String? tagComposer,  String? tagPublisher,  String? tagComment,  String? tagLanguage,  String? tagASIN)?  $default,) {final _that = this;
switch (_that) {
case _MetaTags() when $default != null:
return $default(_that.tagAlbum,_that.tagArtist,_that.tagGenre,_that.tagTitle,_that.tagSeries,_that.tagSeriesPart,_that.tagAlbumArtist,_that.tagDate,_that.tagComposer,_that.tagPublisher,_that.tagComment,_that.tagLanguage,_that.tagASIN);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _MetaTags implements MetaTags {
  const _MetaTags({this.tagAlbum, this.tagArtist, this.tagGenre, this.tagTitle, this.tagSeries, this.tagSeriesPart, this.tagAlbumArtist, this.tagDate, this.tagComposer, this.tagPublisher, this.tagComment, this.tagLanguage, this.tagASIN});
  factory _MetaTags.fromJson(Map<String, dynamic> json) => _$MetaTagsFromJson(json);

@override final  String? tagAlbum;
@override final  String? tagArtist;
@override final  String? tagGenre;
@override final  String? tagTitle;
@override final  String? tagSeries;
@override final  String? tagSeriesPart;
@override final  String? tagAlbumArtist;
@override final  String? tagDate;
@override final  String? tagComposer;
@override final  String? tagPublisher;
@override final  String? tagComment;
@override final  String? tagLanguage;
@override final  String? tagASIN;

/// Create a copy of MetaTags
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetaTagsCopyWith<_MetaTags> get copyWith => __$MetaTagsCopyWithImpl<_MetaTags>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetaTagsToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _MetaTags&&(identical(other.tagAlbum, tagAlbum) || other.tagAlbum == tagAlbum)&&(identical(other.tagArtist, tagArtist) || other.tagArtist == tagArtist)&&(identical(other.tagGenre, tagGenre) || other.tagGenre == tagGenre)&&(identical(other.tagTitle, tagTitle) || other.tagTitle == tagTitle)&&(identical(other.tagSeries, tagSeries) || other.tagSeries == tagSeries)&&(identical(other.tagSeriesPart, tagSeriesPart) || other.tagSeriesPart == tagSeriesPart)&&(identical(other.tagAlbumArtist, tagAlbumArtist) || other.tagAlbumArtist == tagAlbumArtist)&&(identical(other.tagDate, tagDate) || other.tagDate == tagDate)&&(identical(other.tagComposer, tagComposer) || other.tagComposer == tagComposer)&&(identical(other.tagPublisher, tagPublisher) || other.tagPublisher == tagPublisher)&&(identical(other.tagComment, tagComment) || other.tagComment == tagComment)&&(identical(other.tagLanguage, tagLanguage) || other.tagLanguage == tagLanguage)&&(identical(other.tagASIN, tagASIN) || other.tagASIN == tagASIN));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,tagAlbum,tagArtist,tagGenre,tagTitle,tagSeries,tagSeriesPart,tagAlbumArtist,tagDate,tagComposer,tagPublisher,tagComment,tagLanguage,tagASIN);

@override
String toString() {
  return 'MetaTags(tagAlbum: $tagAlbum, tagArtist: $tagArtist, tagGenre: $tagGenre, tagTitle: $tagTitle, tagSeries: $tagSeries, tagSeriesPart: $tagSeriesPart, tagAlbumArtist: $tagAlbumArtist, tagDate: $tagDate, tagComposer: $tagComposer, tagPublisher: $tagPublisher, tagComment: $tagComment, tagLanguage: $tagLanguage, tagASIN: $tagASIN)';
}


}

/// @nodoc
abstract mixin class _$MetaTagsCopyWith<$Res> implements $MetaTagsCopyWith<$Res> {
  factory _$MetaTagsCopyWith(_MetaTags value, $Res Function(_MetaTags) _then) = __$MetaTagsCopyWithImpl;
@override @useResult
$Res call({
 String? tagAlbum, String? tagArtist, String? tagGenre, String? tagTitle, String? tagSeries, String? tagSeriesPart, String? tagAlbumArtist, String? tagDate, String? tagComposer, String? tagPublisher, String? tagComment, String? tagLanguage, String? tagASIN
});




}
/// @nodoc
class __$MetaTagsCopyWithImpl<$Res>
    implements _$MetaTagsCopyWith<$Res> {
  __$MetaTagsCopyWithImpl(this._self, this._then);

  final _MetaTags _self;
  final $Res Function(_MetaTags) _then;

/// Create a copy of MetaTags
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? tagAlbum = freezed,Object? tagArtist = freezed,Object? tagGenre = freezed,Object? tagTitle = freezed,Object? tagSeries = freezed,Object? tagSeriesPart = freezed,Object? tagAlbumArtist = freezed,Object? tagDate = freezed,Object? tagComposer = freezed,Object? tagPublisher = freezed,Object? tagComment = freezed,Object? tagLanguage = freezed,Object? tagASIN = freezed,}) {
  return _then(_MetaTags(
tagAlbum: freezed == tagAlbum ? _self.tagAlbum : tagAlbum // ignore: cast_nullable_to_non_nullable
as String?,tagArtist: freezed == tagArtist ? _self.tagArtist : tagArtist // ignore: cast_nullable_to_non_nullable
as String?,tagGenre: freezed == tagGenre ? _self.tagGenre : tagGenre // ignore: cast_nullable_to_non_nullable
as String?,tagTitle: freezed == tagTitle ? _self.tagTitle : tagTitle // ignore: cast_nullable_to_non_nullable
as String?,tagSeries: freezed == tagSeries ? _self.tagSeries : tagSeries // ignore: cast_nullable_to_non_nullable
as String?,tagSeriesPart: freezed == tagSeriesPart ? _self.tagSeriesPart : tagSeriesPart // ignore: cast_nullable_to_non_nullable
as String?,tagAlbumArtist: freezed == tagAlbumArtist ? _self.tagAlbumArtist : tagAlbumArtist // ignore: cast_nullable_to_non_nullable
as String?,tagDate: freezed == tagDate ? _self.tagDate : tagDate // ignore: cast_nullable_to_non_nullable
as String?,tagComposer: freezed == tagComposer ? _self.tagComposer : tagComposer // ignore: cast_nullable_to_non_nullable
as String?,tagPublisher: freezed == tagPublisher ? _self.tagPublisher : tagPublisher // ignore: cast_nullable_to_non_nullable
as String?,tagComment: freezed == tagComment ? _self.tagComment : tagComment // ignore: cast_nullable_to_non_nullable
as String?,tagLanguage: freezed == tagLanguage ? _self.tagLanguage : tagLanguage // ignore: cast_nullable_to_non_nullable
as String?,tagASIN: freezed == tagASIN ? _self.tagASIN : tagASIN // ignore: cast_nullable_to_non_nullable
as String?,
  ));
}


}

// dart format on
