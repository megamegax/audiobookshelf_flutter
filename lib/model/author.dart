class Author {
  final String id;
  final String name;
  final String description;
  final String asin;
  final String imagePath;
  final int addedAt;
  final int updatedAt;
  final int numBooks;

  const Author({
    required this.id,
    required this.name,
    this.description = '',
    this.asin = '',
    this.imagePath = '',
    required this.addedAt,
    required this.updatedAt,
    this.numBooks = 0,
  });

  factory Author.fromJson(Map<String, dynamic> json) {
    return Author(
      id: json['id'] as String,
      name: json['name'] as String,
      description: json['description'] as String? ?? '',
      asin: json['asin'] as String? ?? '',
      imagePath: json['imagePath'] as String? ?? '',
      addedAt: json['addedAt'] as int,
      updatedAt: json['updatedAt'] as int,
      numBooks: json['numBooks'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'description': description,
      'asin': asin,
      'imagePath': imagePath,
      'addedAt': addedAt,
      'updatedAt': updatedAt,
      'numBooks': numBooks,
    };
  }
}
