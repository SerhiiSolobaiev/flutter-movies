class MovieDaoModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  const MovieDaoModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });

  Map<String, Object?> toMap() {
    return {
      'id': id,
      'title': title,
      'overview': overview,
      'posterPath': posterPath,
      'voteAverage' : voteAverage,
      'releaseDate' : releaseDate,
    };
  }
}
