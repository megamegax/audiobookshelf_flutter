import 'package:isar/isar.dart';

part 'collapsed_series_entity.g.dart';

@embedded
class CollapsedSeriesEntity {
  String? id;
  String? name;
  String? nameIgnorePrefix;
  int? numBooks;

  CollapsedSeriesEntity({
    this.id,
    this.name,
    this.nameIgnorePrefix,
    this.numBooks,
  });
}
