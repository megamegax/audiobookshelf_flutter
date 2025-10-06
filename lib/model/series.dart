class Series {
  final String id;
  final String name;
  final String? description;
  final int numBooks;

  const Series({
    required this.id,
    required this.name,
    this.description,
    required this.numBooks,
  });
}
