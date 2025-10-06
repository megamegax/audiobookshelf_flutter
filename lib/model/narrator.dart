class Narrator {
  final String id;
  final String name;
  final int numBooks;

  const Narrator({
    required this.id,
    required this.name,
    this.numBooks = 0,
  });

  factory Narrator.fromJson(Map<String, dynamic> json) {
    return Narrator(
      id: json['id'] as String,
      name: json['name'] as String,
      numBooks: json['numBooks'] as int? ?? 0,
    );
  }

  Map<String, dynamic> toJson() {
    return {
      'id': id,
      'name': name,
      'numBooks': numBooks,
    };
  }
}
