class MovieLocalModel {
  final int id;
  final String title;

  const MovieLocalModel({required this.id, required this.title});

  Map<String, Object?> toMap() {
    return {'id': id, 'title': title};
  }

  @override
  String toString() {
    return 'MovieLocalModel{id: $id, title: $title}';
  }
}
