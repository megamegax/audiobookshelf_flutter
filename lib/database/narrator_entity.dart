import 'package:isar_community/isar.dart';

part 'narrator_entity.g.dart';

@collection
class NarratorEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String narratorId;

  late String name;
  String? nameIgnorePrefix;
  String? description;
  String? imagePath;
  List<int>? imageBytes;
  int? addedAt;
  int? updatedAt;

  // Statistics
  int? bookCount;
  int? seriesCount;

  NarratorEntity();

  NarratorEntity.fromJson(Map<String, dynamic> json) {
    narratorId = json['id'] ?? '';
    name = json['name'] ?? '';
    nameIgnorePrefix = json['nameIgnorePrefix'];
    description = json['description'];
    imagePath = json['imagePath'];
    addedAt = json['addedAt'];
    updatedAt = json['updatedAt'];
    bookCount =
        json['numBooks'] ?? json['bookCount']; // Backend returns 'numBooks'
    seriesCount = json['seriesCount'];
  }

  Map<String, dynamic> toJson() {
    return {
      'id': narratorId,
      'name': name,
      'nameIgnorePrefix': nameIgnorePrefix,
      'description': description,
      'imagePath': imagePath,
      'imageBytes': imageBytes,
      'addedAt': addedAt,
      'updatedAt': updatedAt,
      'bookCount': bookCount,
      'seriesCount': seriesCount,
    };
  }
}
