// GENERATED CODE - DO NOT MODIFY BY HAND
// coverage:ignore-file
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'advanced_search_provider.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

// dart format off
T _$identity<T>(T value) => value;
/// @nodoc
mixin _$AdvancedSearchState {

 List<SearchResult> get results; SearchFilters get filters; bool get isLoading; String? get error; String? get currentQuery; int get totalResults; bool get hasMore; List<String> get suggestions;
/// Create a copy of AdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
$AdvancedSearchStateCopyWith<AdvancedSearchState> get copyWith => _$AdvancedSearchStateCopyWithImpl<AdvancedSearchState>(this as AdvancedSearchState, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is AdvancedSearchState&&const DeepCollectionEquality().equals(other.results, results)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentQuery, currentQuery) || other.currentQuery == currentQuery)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other.suggestions, suggestions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(results),filters,isLoading,error,currentQuery,totalResults,hasMore,const DeepCollectionEquality().hash(suggestions));

@override
String toString() {
  return 'AdvancedSearchState(results: $results, filters: $filters, isLoading: $isLoading, error: $error, currentQuery: $currentQuery, totalResults: $totalResults, hasMore: $hasMore, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class $AdvancedSearchStateCopyWith<$Res>  {
  factory $AdvancedSearchStateCopyWith(AdvancedSearchState value, $Res Function(AdvancedSearchState) _then) = _$AdvancedSearchStateCopyWithImpl;
@useResult
$Res call({
 List<SearchResult> results, SearchFilters filters, bool isLoading, String? error, String? currentQuery, int totalResults, bool hasMore, List<String> suggestions
});




}
/// @nodoc
class _$AdvancedSearchStateCopyWithImpl<$Res>
    implements $AdvancedSearchStateCopyWith<$Res> {
  _$AdvancedSearchStateCopyWithImpl(this._self, this._then);

  final AdvancedSearchState _self;
  final $Res Function(AdvancedSearchState) _then;

/// Create a copy of AdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@pragma('vm:prefer-inline') @override $Res call({Object? results = null,Object? filters = null,Object? isLoading = null,Object? error = freezed,Object? currentQuery = freezed,Object? totalResults = null,Object? hasMore = null,Object? suggestions = null,}) {
  return _then(_self.copyWith(
results: null == results ? _self.results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as SearchFilters,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,currentQuery: freezed == currentQuery ? _self.currentQuery : currentQuery // ignore: cast_nullable_to_non_nullable
as String?,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,suggestions: null == suggestions ? _self.suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}

}


/// Adds pattern-matching-related methods to [AdvancedSearchState].
extension AdvancedSearchStatePatterns on AdvancedSearchState {
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

@optionalTypeArgs TResult maybeMap<TResult extends Object?>(TResult Function( _AdvancedSearchState value)?  $default,{required TResult orElse(),}){
final _that = this;
switch (_that) {
case _AdvancedSearchState() when $default != null:
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

@optionalTypeArgs TResult map<TResult extends Object?>(TResult Function( _AdvancedSearchState value)  $default,){
final _that = this;
switch (_that) {
case _AdvancedSearchState():
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

@optionalTypeArgs TResult? mapOrNull<TResult extends Object?>(TResult? Function( _AdvancedSearchState value)?  $default,){
final _that = this;
switch (_that) {
case _AdvancedSearchState() when $default != null:
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

@optionalTypeArgs TResult maybeWhen<TResult extends Object?>(TResult Function( List<SearchResult> results,  SearchFilters filters,  bool isLoading,  String? error,  String? currentQuery,  int totalResults,  bool hasMore,  List<String> suggestions)?  $default,{required TResult orElse(),}) {final _that = this;
switch (_that) {
case _AdvancedSearchState() when $default != null:
return $default(_that.results,_that.filters,_that.isLoading,_that.error,_that.currentQuery,_that.totalResults,_that.hasMore,_that.suggestions);case _:
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

@optionalTypeArgs TResult when<TResult extends Object?>(TResult Function( List<SearchResult> results,  SearchFilters filters,  bool isLoading,  String? error,  String? currentQuery,  int totalResults,  bool hasMore,  List<String> suggestions)  $default,) {final _that = this;
switch (_that) {
case _AdvancedSearchState():
return $default(_that.results,_that.filters,_that.isLoading,_that.error,_that.currentQuery,_that.totalResults,_that.hasMore,_that.suggestions);}
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

@optionalTypeArgs TResult? whenOrNull<TResult extends Object?>(TResult? Function( List<SearchResult> results,  SearchFilters filters,  bool isLoading,  String? error,  String? currentQuery,  int totalResults,  bool hasMore,  List<String> suggestions)?  $default,) {final _that = this;
switch (_that) {
case _AdvancedSearchState() when $default != null:
return $default(_that.results,_that.filters,_that.isLoading,_that.error,_that.currentQuery,_that.totalResults,_that.hasMore,_that.suggestions);case _:
  return null;

}
}

}

/// @nodoc


class _AdvancedSearchState implements AdvancedSearchState {
  const _AdvancedSearchState({final  List<SearchResult> results = const [], required this.filters, this.isLoading = false, this.error, this.currentQuery, this.totalResults = 0, this.hasMore = false, final  List<String> suggestions = const []}): _results = results,_suggestions = suggestions;
  

 final  List<SearchResult> _results;
@override@JsonKey() List<SearchResult> get results {
  if (_results is EqualUnmodifiableListView) return _results;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_results);
}

@override final  SearchFilters filters;
@override@JsonKey() final  bool isLoading;
@override final  String? error;
@override final  String? currentQuery;
@override@JsonKey() final  int totalResults;
@override@JsonKey() final  bool hasMore;
 final  List<String> _suggestions;
@override@JsonKey() List<String> get suggestions {
  if (_suggestions is EqualUnmodifiableListView) return _suggestions;
  // ignore: implicit_dynamic_type
  return EqualUnmodifiableListView(_suggestions);
}


/// Create a copy of AdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @JsonKey(includeFromJson: false, includeToJson: false)
@pragma('vm:prefer-inline')
_$AdvancedSearchStateCopyWith<_AdvancedSearchState> get copyWith => __$AdvancedSearchStateCopyWithImpl<_AdvancedSearchState>(this, _$identity);



@override
bool operator ==(Object other) {
  return identical(this, other) || (other.runtimeType == runtimeType&&other is _AdvancedSearchState&&const DeepCollectionEquality().equals(other._results, _results)&&(identical(other.filters, filters) || other.filters == filters)&&(identical(other.isLoading, isLoading) || other.isLoading == isLoading)&&(identical(other.error, error) || other.error == error)&&(identical(other.currentQuery, currentQuery) || other.currentQuery == currentQuery)&&(identical(other.totalResults, totalResults) || other.totalResults == totalResults)&&(identical(other.hasMore, hasMore) || other.hasMore == hasMore)&&const DeepCollectionEquality().equals(other._suggestions, _suggestions));
}


@override
int get hashCode => Object.hash(runtimeType,const DeepCollectionEquality().hash(_results),filters,isLoading,error,currentQuery,totalResults,hasMore,const DeepCollectionEquality().hash(_suggestions));

@override
String toString() {
  return 'AdvancedSearchState(results: $results, filters: $filters, isLoading: $isLoading, error: $error, currentQuery: $currentQuery, totalResults: $totalResults, hasMore: $hasMore, suggestions: $suggestions)';
}


}

/// @nodoc
abstract mixin class _$AdvancedSearchStateCopyWith<$Res> implements $AdvancedSearchStateCopyWith<$Res> {
  factory _$AdvancedSearchStateCopyWith(_AdvancedSearchState value, $Res Function(_AdvancedSearchState) _then) = __$AdvancedSearchStateCopyWithImpl;
@override @useResult
$Res call({
 List<SearchResult> results, SearchFilters filters, bool isLoading, String? error, String? currentQuery, int totalResults, bool hasMore, List<String> suggestions
});




}
/// @nodoc
class __$AdvancedSearchStateCopyWithImpl<$Res>
    implements _$AdvancedSearchStateCopyWith<$Res> {
  __$AdvancedSearchStateCopyWithImpl(this._self, this._then);

  final _AdvancedSearchState _self;
  final $Res Function(_AdvancedSearchState) _then;

/// Create a copy of AdvancedSearchState
/// with the given fields replaced by the non-null parameter values.
@override @pragma('vm:prefer-inline') $Res call({Object? results = null,Object? filters = null,Object? isLoading = null,Object? error = freezed,Object? currentQuery = freezed,Object? totalResults = null,Object? hasMore = null,Object? suggestions = null,}) {
  return _then(_AdvancedSearchState(
results: null == results ? _self._results : results // ignore: cast_nullable_to_non_nullable
as List<SearchResult>,filters: null == filters ? _self.filters : filters // ignore: cast_nullable_to_non_nullable
as SearchFilters,isLoading: null == isLoading ? _self.isLoading : isLoading // ignore: cast_nullable_to_non_nullable
as bool,error: freezed == error ? _self.error : error // ignore: cast_nullable_to_non_nullable
as String?,currentQuery: freezed == currentQuery ? _self.currentQuery : currentQuery // ignore: cast_nullable_to_non_nullable
as String?,totalResults: null == totalResults ? _self.totalResults : totalResults // ignore: cast_nullable_to_non_nullable
as int,hasMore: null == hasMore ? _self.hasMore : hasMore // ignore: cast_nullable_to_non_nullable
as bool,suggestions: null == suggestions ? _self._suggestions : suggestions // ignore: cast_nullable_to_non_nullable
as List<String>,
  ));
}


}

// dart format on
