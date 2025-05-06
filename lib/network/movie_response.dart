class MovieResponse {
  int? _id;
  double? _voteAverage;
  String? _title;
  String? _posterPath;
  String? _overview;
  String? _releaseDate;

  // from get details:
  List<String>? _genreNames;
  int? _budget;
  int? _revenue;
  String? _homepage;

  MovieResponse(result) {
    _id = result['id'];
    _voteAverage = result['vote_average']?.toDouble();
    _title = result['title'];
    _posterPath = result['poster_path'];
    _overview = result['overview'];
    _releaseDate = result['release_date'];
    _budget = result['budget'];
    _revenue = result['revenue'];
    _homepage = result['homepage'];
    _genreNames = (result['genres'] as List<dynamic>?)
        ?.map((g) => g['name'] as String)
        .toList();
  }

  int? get id => _id;

  String? get title => _title;

  String? get overview => _overview;

  String? get releaseDate => _releaseDate;

  List<String>? get genreNames => _genreNames;

  String? get posterPath => _posterPath;

  double? get voteAverage => _voteAverage;

  int? get budget => _budget;

  int? get revenue => _revenue;

  String? get homepage => _homepage;

  factory MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    return MovieResponse(parsedJson);
  }
}
