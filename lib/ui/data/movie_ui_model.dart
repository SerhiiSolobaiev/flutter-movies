part of movies_screen;

class MovieUIModel {
  final int id;
  final String title;
  final String overview;
  final String imageUrl;
  final String voteAverage;
  final String releaseDate;

  final String genreNames;
  final String budget;
  final String revenue;
  final String homepage;

  const MovieUIModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.imageUrl,
    required this.voteAverage,
    required this.releaseDate,
    this.genreNames = "",
    this.budget = "",
    this.revenue = "",
    this.homepage = "",
  });
}
