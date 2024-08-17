import 'package:freezed_annotation/freezed_annotation.dart';

part 'meta_tags.freezed.dart';
part 'meta_tags.g.dart';

@freezed
class MetaTags with _$MetaTags {
  const factory MetaTags({
    String? tagAlbum,
    String? tagArtist,
    String? tagGenre,
    String? tagTitle,
    String? tagSeries,
    String? tagSeriesPart,
    String? tagAlbumArtist,
    String? tagDate,
    String? tagComposer,
    String? tagPublisher,
    String? tagComment,
    String? tagLanguage,
    String? tagASIN,
  }) = _MetaTags;

  factory MetaTags.fromJson(Map<String, dynamic> json) =>
      _$MetaTagsFromJson(json);
}
