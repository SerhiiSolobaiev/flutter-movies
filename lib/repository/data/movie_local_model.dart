part of repository_movies;

class MovieLocalModel {
  final int id;
  final String title;
  final String overview;
  final String posterPath;
  final double voteAverage;
  final String releaseDate;

  final List<String> genreNames;
  final int budget;
  final int revenue;
  final String homepage;

  MovieLocalModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
    this.genreNames = const [],
    this.budget = 0,
    this.revenue = 0,
    this.homepage = "",
  });
}
