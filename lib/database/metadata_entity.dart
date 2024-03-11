import 'package:isar/isar.dart';

part 'metadata_entity.g.dart';

@embedded
class MetadataEntity {
  String? title;
  String? titleIgnorePrefix;
  String? subtitle;
  String? authorName;
  String? narratorName;
  String? seriesName;
  List<String>? genres;
  String? publishedYear;
  String? publishedDate;
  String? publisher;
  String? description;
  String? isbn;
  String? asin;
  String? language;
  bool? explicit;

  MetadataEntity({
    this.title,
    this.titleIgnorePrefix,
    this.subtitle,
    this.authorName,
    this.narratorName,
    this.seriesName,
    this.genres,
    this.publishedYear,
    this.publishedDate,
    this.publisher,
    this.description,
    this.isbn,
    this.asin,
    this.language,
    this.explicit,
  });
}
