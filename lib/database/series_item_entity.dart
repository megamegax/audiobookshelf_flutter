import 'package:isar/isar.dart';

part 'series_item_entity.g.dart';

@collection
class SeriesItemEntity {
  Id id = Isar.autoIncrement;
  @Index()
  String? seriesId;
  String name;
  String nameIgnorePrefix;
  int addedAt;
  int? updatedAt;
  String? description;
  List<String> books;

  SeriesItemEntity(
      {this.seriesId,
      required this.name,
      required this.nameIgnorePrefix,
      required this.addedAt,
      required this.updatedAt,
      required this.description,
      required this.books});
}
