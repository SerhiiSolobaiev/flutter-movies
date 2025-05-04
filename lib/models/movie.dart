import '../repository/storage/movie_local_model.dart';

class Movie {
  int _id = 0;
  double? _voteAverage;
  String? _title;
  String? _posterPath;
  final _genreNames = <String>[];
  String? _overview;
  String? _releaseDate;

  // from get details:
  int? _budget;
  int? _revenue;
  String? _homepage;

  Movie(result) {
    _id = result['id'];
    _voteAverage = result['vote_average']?.toDouble();
    _title = result['title'];
    _posterPath = result['poster_path'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
    _budget = result['budget'];
    _revenue = result['revenue'];
    _homepage = result['homepage'];
    if (result['genres'] != null) {
      for (var genre in result['genres']) {
        _genreNames.add(genre['name']);
      }
    }
  }

  // Getters
  int get id => _id;

  String? get title => _title;

  String? get overview => _overview;

  String? get releaseDate => _releaseDate;

  List<String> get genreNames => _genreNames;

  String? get posterPath => _posterPath;

  double? get voteAverage => _voteAverage;

  int? get budget => _budget;

  int? get revenue => _revenue;

  String? get homepage => _homepage;

  factory Movie.fromJson(Map<String, dynamic> parsedJson) {
    return Movie(parsedJson);
  }

  MovieLocalModel toLocalModel() {
    return MovieLocalModel(
        id: _id,
        title: _title ?? '',
        overview: _overview ?? '',
        posterPath: _posterPath ?? '',
        voteAverage: _voteAverage ?? 0,
        releaseDate: _releaseDate ?? '');
  }

  Movie.fromLocal(MovieLocalModel local) {
    _id = local.id;
    _title = local.title;
    _overview = local.overview;
    _posterPath = local.posterPath;
    _voteAverage = local.voteAverage;
    _releaseDate = local.releaseDate;
  }
}
