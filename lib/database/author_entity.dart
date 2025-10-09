import 'package:isar_community/isar.dart';

part 'author_entity.g.dart';

@collection
class AuthorEntity {
  Id id = Isar.autoIncrement;

  @Index(unique: true)
  late String authorId;

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

  AuthorEntity();

  AuthorEntity.fromJson(Map<String, dynamic> json) {
    authorId = json['id'] ?? '';
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
      'id': authorId,
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
