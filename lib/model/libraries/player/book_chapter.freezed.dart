// coverage:ignore-file
// GENERATED CODE - DO NOT MODIFY BY HAND
// ignore_for_file: type=lint
// ignore_for_file: unused_element, deprecated_member_use, deprecated_member_use_from_same_package, use_function_type_syntax_for_parameters, unnecessary_const, avoid_init_to_null, invalid_override_different_default_values_named, prefer_expression_function_bodies, annotate_overrides, invalid_annotation_target, unnecessary_question_mark

part of 'book_chapter.dart';

// **************************************************************************
// FreezedGenerator
// **************************************************************************

T _$identity<T>(T value) => value;

final _privateConstructorUsedError = UnsupportedError(
    'It seems like you constructed your class using `MyClass._()`. This constructor is only meant to be used by freezed and you are not supposed to need it nor use it.\nPlease check the documentation here for more information: https://github.com/rrousselGit/freezed#adding-getters-and-methods-to-our-models');

BookChapter _$BookChapterFromJson(Map<String, dynamic> json) {
  return _BookChapter.fromJson(json);
}

/// @nodoc
mixin _$BookChapter {
  int get id => throw _privateConstructorUsedError;
  double get start => throw _privateConstructorUsedError;
  double get end => throw _privateConstructorUsedError;
  String get title => throw _privateConstructorUsedError;

  Map<String, dynamic> toJson() => throw _privateConstructorUsedError;
  @JsonKey(ignore: true)
  $BookChapterCopyWith<BookChapter> get copyWith =>
      throw _privateConstructorUsedError;
}

/// @nodoc
abstract class $BookChapterCopyWith<$Res> {
  factory $BookChapterCopyWith(
          BookChapter value, $Res Function(BookChapter) then) =
      _$BookChapterCopyWithImpl<$Res, BookChapter>;
  @useResult
  $Res call({int id, double start, double end, String title});
}

/// @nodoc
class _$BookChapterCopyWithImpl<$Res, $Val extends BookChapter>
    implements $BookChapterCopyWith<$Res> {
  _$BookChapterCopyWithImpl(this._value, this._then);

  // ignore: unused_field
  final $Val _value;
  // ignore: unused_field
  final $Res Function($Val) _then;

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
  }) {
    return _then(_value.copyWith(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ) as $Val);
  }
}

/// @nodoc
abstract class _$$BookChapterImplCopyWith<$Res>
    implements $BookChapterCopyWith<$Res> {
  factory _$$BookChapterImplCopyWith(
          _$BookChapterImpl value, $Res Function(_$BookChapterImpl) then) =
      __$$BookChapterImplCopyWithImpl<$Res>;
  @override
  @useResult
  $Res call({int id, double start, double end, String title});
}

/// @nodoc
class __$$BookChapterImplCopyWithImpl<$Res>
    extends _$BookChapterCopyWithImpl<$Res, _$BookChapterImpl>
    implements _$$BookChapterImplCopyWith<$Res> {
  __$$BookChapterImplCopyWithImpl(
      _$BookChapterImpl _value, $Res Function(_$BookChapterImpl) _then)
      : super(_value, _then);

  @pragma('vm:prefer-inline')
  @override
  $Res call({
    Object? id = null,
    Object? start = null,
    Object? end = null,
    Object? title = null,
  }) {
    return _then(_$BookChapterImpl(
      id: null == id
          ? _value.id
          : id // ignore: cast_nullable_to_non_nullable
              as int,
      start: null == start
          ? _value.start
          : start // ignore: cast_nullable_to_non_nullable
              as double,
      end: null == end
          ? _value.end
          : end // ignore: cast_nullable_to_non_nullable
              as double,
      title: null == title
          ? _value.title
          : title // ignore: cast_nullable_to_non_nullable
              as String,
    ));
  }
}

/// @nodoc
@JsonSerializable()
class _$BookChapterImpl implements _BookChapter {
  const _$BookChapterImpl(
      {required this.id,
      required this.start,
      required this.end,
      required this.title});

  factory _$BookChapterImpl.fromJson(Map<String, dynamic> json) =>
      _$$BookChapterImplFromJson(json);

  @override
  final int id;
  @override
  final double start;
  @override
  final double end;
  @override
  final String title;

  @override
  String toString() {
    return 'BookChapter(id: $id, start: $start, end: $end, title: $title)';
  }

  @override
  bool operator ==(Object other) {
    return identical(this, other) ||
        (other.runtimeType == runtimeType &&
            other is _$BookChapterImpl &&
            (identical(other.id, id) || other.id == id) &&
            (identical(other.start, start) || other.start == start) &&
            (identical(other.end, end) || other.end == end) &&
            (identical(other.title, title) || other.title == title));
  }

  @JsonKey(ignore: true)
  @override
  int get hashCode => Object.hash(runtimeType, id, start, end, title);

  @JsonKey(ignore: true)
  @override
  @pragma('vm:prefer-inline')
  _$$BookChapterImplCopyWith<_$BookChapterImpl> get copyWith =>
      __$$BookChapterImplCopyWithImpl<_$BookChapterImpl>(this, _$identity);

  @override
  Map<String, dynamic> toJson() {
    return _$$BookChapterImplToJson(
      this,
    );
  }
}

abstract class _BookChapter implements BookChapter {
  const factory _BookChapter(
      {required final int id,
      required final double start,
      required final double end,
      required final String title}) = _$BookChapterImpl;

  factory _BookChapter.fromJson(Map<String, dynamic> json) =
      _$BookChapterImpl.fromJson;

  @override
  int get id;
  @override
  double get start;
  @override
  double get end;
  @override
  String get title;
  @override
  @JsonKey(ignore: true)
  _$$BookChapterImplCopyWith<_$BookChapterImpl> get copyWith =>
      throw _privateConstructorUsedError;
}
