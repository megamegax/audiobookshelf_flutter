// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'meta_data.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;

/// @nodoc
mixin _$Metadata {

 String? get title; String? get titleIgnorePrefix; String? get subtitle; String? get authorName; String? get narratorName; String? get seriesName;@JsonKey(fromJson: _genresFromJson) List<String>? get genres;@JsonKey(fromJson: _publishedYearFromJson) int? get publishedYear; String? get publishedDate; String? get publisher; String? get description;@JsonKey(name: 'descriptionFormat', defaultValue: 'text') String? get descriptionFormat; String? get isbn; String? get asin; String? get language; bool get explicit;
/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$MetadataCopyWith<Metadata> get copyWith => _$MetadataCopyWithImpl<Metadata>(this as Metadata, _$identity);

  /// Serializes this Metadata to a JSON map.
  Map<String, dynamic> toJson();


@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is Metadata&&(identical(other.title, title) || other.title == title)&&(identical(other.titleIgnorePrefix, titleIgnorePrefix) || other.titleIgnorePrefix == titleIgnorePrefix)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.narratorName, narratorName) || other.narratorName == narratorName)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&const DeepCollectionEquality().equals(other.genres, genres)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionFormat, descriptionFormat) || other.descriptionFormat == descriptionFormat)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,titleIgnorePrefix,subtitle,authorName,narratorName,seriesName,const DeepCollectionEquality().hash(genres),publishedYear,publishedDate,publisher,description,descriptionFormat,isbn,asin,language,explicit);

@override
String toString() {
  return 'Metadata(title: $title, titleIgnorePrefix: $titleIgnorePrefix, subtitle: $subtitle, authorName: $authorName, narratorName: $narratorName, seriesName: $seriesName, genres: $genres, publishedYear: $publishedYear, publishedDate: $publishedDate, publisher: $publisher, description: $description, descriptionFormat: $descriptionFormat, isbn: $isbn, asin: $asin, language: $language, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class $MetadataCopyWith<$Res>  {
  factory $MetadataCopyWith(Metadata value, $Res Function(Metadata) _then) = _$MetadataCopyWithImpl;
@useResult
$Res call({
 String? title, String? titleIgnorePrefix, String? subtitle, String? authorName, String? narratorName, String? seriesName,@JsonKey(fromJson: _genresFromJson) List<String>? genres,@JsonKey(fromJson: _publishedYearFromJson) int? publishedYear, String? publishedDate, String? publisher, String? description,@JsonKey(name: 'descriptionFormat', defaultValue: 'text') String? descriptionFormat, String? isbn, String? asin, String? language, bool explicit
});




}
/// @nodoc
class _$MetadataCopyWithImpl<$Res>
    implements $MetadataCopyWith<$Res> {
  _$MetadataCopyWithImpl(this._self, this._then);

  final Metadata _self;
  final $Res Function(Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? title = freezed,Object? titleIgnorePrefix = freezed,Object? subtitle = freezed,Object? authorName = freezed,Object? narratorName = freezed,Object? seriesName = freezed,Object? genres = freezed,Object? publishedYear = freezed,Object? publishedDate = freezed,Object? publisher = freezed,Object? description = freezed,Object? descriptionFormat = freezed,Object? isbn = freezed,Object? asin = freezed,Object? language = freezed,Object? explicit = null,}) {
  return _then(_self.copyWith(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleIgnorePrefix: freezed == titleIgnorePrefix ? _self.titleIgnorePrefix : titleIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,narratorName: freezed == narratorName ? _self.narratorName : narratorName // ignore: cast_nullable_to_non_nullable
as String?,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self.genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionFormat: freezed == descriptionFormat ? _self.descriptionFormat : descriptionFormat // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}

}


/// Adds pattern-matching-related methods to [Metadata].
extension MetadataPatterns on Metadata {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _Metadata value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _Metadata value)  $default,){
final _that = this;
switch (_that) {
case _Metadata():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _Metadata value)?  $default,){
final _that = this;
switch (_that) {
case _Metadata() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  String? authorName,  String? narratorName,  String? seriesName, @JsonKey(fromJson: _genresFromJson)  List<String>? genres, @JsonKey(fromJson: _publishedYearFromJson)  int? publishedYear,  String? publishedDate,  String? publisher,  String? description, @JsonKey(name: 'descriptionFormat', defaultValue: 'text')  String? descriptionFormat,  String? isbn,  String? asin,  String? language,  bool explicit)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authorName,_that.narratorName,_that.seriesName,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.descriptionFormat,_that.isbn,_that.asin,_that.language,_that.explicit);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  String? authorName,  String? narratorName,  String? seriesName, @JsonKey(fromJson: _genresFromJson)  List<String>? genres, @JsonKey(fromJson: _publishedYearFromJson)  int? publishedYear,  String? publishedDate,  String? publisher,  String? description, @JsonKey(name: 'descriptionFormat', defaultValue: 'text')  String? descriptionFormat,  String? isbn,  String? asin,  String? language,  bool explicit)  $default,) {final _that = this;
switch (_that) {
case _Metadata():
return $default(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authorName,_that.narratorName,_that.seriesName,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.descriptionFormat,_that.isbn,_that.asin,_that.language,_that.explicit);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( String? title,  String? titleIgnorePrefix,  String? subtitle,  String? authorName,  String? narratorName,  String? seriesName, @JsonKey(fromJson: _genresFromJson)  List<String>? genres, @JsonKey(fromJson: _publishedYearFromJson)  int? publishedYear,  String? publishedDate,  String? publisher,  String? description, @JsonKey(name: 'descriptionFormat', defaultValue: 'text')  String? descriptionFormat,  String? isbn,  String? asin,  String? language,  bool explicit)?  $default,) {final _that = this;
switch (_that) {
case _Metadata() when $default != null:
return $default(_that.title,_that.titleIgnorePrefix,_that.subtitle,_that.authorName,_that.narratorName,_that.seriesName,_that.genres,_that.publishedYear,_that.publishedDate,_that.publisher,_that.description,_that.descriptionFormat,_that.isbn,_that.asin,_that.language,_that.explicit);case _:
  return null;

}
}

}

/// @nodoc
@JsonSerializable()

class _Metadata implements Metadata {
  const _Metadata({this.title, this.titleIgnorePrefix, this.subtitle, this.authorName, this.narratorName, this.seriesName, @JsonKey(fromJson: _genresFromJson) final  List<String>? genres, @JsonKey(fromJson: _publishedYearFromJson) this.publishedYear, this.publishedDate, this.publisher, this.description, @JsonKey(name: 'descriptionFormat', defaultValue: 'text') this.descriptionFormat, this.isbn, this.asin, this.language, required this.explicit}): _genres = genres;
  factory _Metadata.fromJson(Map<String, dynamic> json) => _$MetadataFromJson(json);

@override final  String? title;
@override final  String? titleIgnorePrefix;
@override final  String? subtitle;
@override final  String? authorName;
@override final  String? narratorName;
@override final  String? seriesName;
 final  List<String>? _genres;
@override@JsonKey(fromJson: _genresFromJson) List<String>? get genres {
  final value = _genres;
  if (value == null) return null;
  if (_genres is EqualUnmodifiableListView) return _genres;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(value);
}

@override@JsonKey(fromJson: _publishedYearFromJson) final  int? publishedYear;
@override final  String? publishedDate;
@override final  String? publisher;
@override final  String? description;
@override@JsonKey(name: 'descriptionFormat', defaultValue: 'text') final  String? descriptionFormat;
@override final  String? isbn;
@override final  String? asin;
@override final  String? language;
@override final  bool explicit;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$MetadataCopyWith<_Metadata> get copyWith => __$MetadataCopyWithImpl<_Metadata>(this, _$identity);

@override
Map<String, dynamic> toJson() {
  return _$MetadataToJson(this, );
}

@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _Metadata&&(identical(other.title, title) || other.title == title)&&(identical(other.titleIgnorePrefix, titleIgnorePrefix) || other.titleIgnorePrefix == titleIgnorePrefix)&&(identical(other.subtitle, subtitle) || other.subtitle == subtitle)&&(identical(other.authorName, authorName) || other.authorName == authorName)&&(identical(other.narratorName, narratorName) || other.narratorName == narratorName)&&(identical(other.seriesName, seriesName) || other.seriesName == seriesName)&&const DeepCollectionEquality().equals(other._genres, _genres)&&(identical(other.publishedYear, publishedYear) || other.publishedYear == publishedYear)&&(identical(other.publishedDate, publishedDate) || other.publishedDate == publishedDate)&&(identical(other.publisher, publisher) || other.publisher == publisher)&&(identical(other.description, description) || other.description == description)&&(identical(other.descriptionFormat, descriptionFormat) || other.descriptionFormat == descriptionFormat)&&(identical(other.isbn, isbn) || other.isbn == isbn)&&(identical(other.asin, asin) || other.asin == asin)&&(identical(other.language, language) || other.language == language)&&(identical(other.explicit, explicit) || other.explicit == explicit));
}

@JsonKey(includeFromJson: false, includeToJson: false)
@override
int get hashCode => Object.hash(runtimeType,title,titleIgnorePrefix,subtitle,authorName,narratorName,seriesName,const DeepCollectionEquality().hash(_genres),publishedYear,publishedDate,publisher,description,descriptionFormat,isbn,asin,language,explicit);

@override
String toString() {
  return 'Metadata(title: $title, titleIgnorePrefix: $titleIgnorePrefix, subtitle: $subtitle, authorName: $authorName, narratorName: $narratorName, seriesName: $seriesName, genres: $genres, publishedYear: $publishedYear, publishedDate: $publishedDate, publisher: $publisher, description: $description, descriptionFormat: $descriptionFormat, isbn: $isbn, asin: $asin, language: $language, explicit: $explicit)';
}


}

/// @nodoc
abstract mixin class _$MetadataCopyWith<$Res> implements $MetadataCopyWith<$Res> {
  factory _$MetadataCopyWith(_Metadata value, $Res Function(_Metadata) _then) = __$MetadataCopyWithImpl;
@override @useResult
$Res call({
 String? title, String? titleIgnorePrefix, String? subtitle, String? authorName, String? narratorName, String? seriesName,@JsonKey(fromJson: _genresFromJson) List<String>? genres,@JsonKey(fromJson: _publishedYearFromJson) int? publishedYear, String? publishedDate, String? publisher, String? description,@JsonKey(name: 'descriptionFormat', defaultValue: 'text') String? descriptionFormat, String? isbn, String? asin, String? language, bool explicit
});




}
/// @nodoc
class __$MetadataCopyWithImpl<$Res>
    implements _$MetadataCopyWith<$Res> {
  __$MetadataCopyWithImpl(this._self, this._then);

  final _Metadata _self;
  final $Res Function(_Metadata) _then;

/// Create a copy of Metadata
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? title = freezed,Object? titleIgnorePrefix = freezed,Object? subtitle = freezed,Object? authorName = freezed,Object? narratorName = freezed,Object? seriesName = freezed,Object? genres = freezed,Object? publishedYear = freezed,Object? publishedDate = freezed,Object? publisher = freezed,Object? description = freezed,Object? descriptionFormat = freezed,Object? isbn = freezed,Object? asin = freezed,Object? language = freezed,Object? explicit = null,}) {
  return _then(_Metadata(
title: freezed == title ? _self.title : title // ignore: cast_nullable_to_non_nullable
as String?,titleIgnorePrefix: freezed == titleIgnorePrefix ? _self.titleIgnorePrefix : titleIgnorePrefix // ignore: cast_nullable_to_non_nullable
as String?,subtitle: freezed == subtitle ? _self.subtitle : subtitle // ignore: cast_nullable_to_non_nullable
as String?,authorName: freezed == authorName ? _self.authorName : authorName // ignore: cast_nullable_to_non_nullable
as String?,narratorName: freezed == narratorName ? _self.narratorName : narratorName // ignore: cast_nullable_to_non_nullable
as String?,seriesName: freezed == seriesName ? _self.seriesName : seriesName // ignore: cast_nullable_to_non_nullable
as String?,genres: freezed == genres ? _self._genres : genres // ignore: cast_nullable_to_non_nullable
as List<String>?,publishedYear: freezed == publishedYear ? _self.publishedYear : publishedYear // ignore: cast_nullable_to_non_nullable
as int?,publishedDate: freezed == publishedDate ? _self.publishedDate : publishedDate // ignore: cast_nullable_to_non_nullable
as String?,publisher: freezed == publisher ? _self.publisher : publisher // ignore: cast_nullable_to_non_nullable
as String?,description: freezed == description ? _self.description : description // ignore: cast_nullable_to_non_nullable
as String?,descriptionFormat: freezed == descriptionFormat ? _self.descriptionFormat : descriptionFormat // ignore: cast_nullable_to_non_nullable
as String?,isbn: freezed == isbn ? _self.isbn : isbn // ignore: cast_nullable_to_non_nullable
as String?,asin: freezed == asin ? _self.asin : asin // ignore: cast_nullable_to_non_nullable
as String?,language: freezed == language ? _self.language : language // ignore: cast_nullable_to_non_nullable
as String?,explicit: null == explicit ? _self.explicit : explicit // ignore: cast_nullable_to_non_nullable
as bool,
  ));
}


}

// dart format on
