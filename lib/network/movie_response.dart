part of network;

class MovieResponse {
  late int? id;
  late double? voteAverage;
  late String? title;
  late String? posterPath;
  late String? overview;
  late String? releaseDate;

  // from get details:
  late List<String>? genreNames;
  late int? budget;
  late int? revenue;
  late String? homepage;

  MovieResponse(result) {
    id = result['id'];
    voteAverage = result['vote_average']?.toDouble();
    title = result['title'];
    posterPath = result['poster_path'];
    overview = result['overview'];
    releaseDate = result['release_date'];
    budget = result['budget'];
    revenue = result['revenue'];
    homepage = result['homepage'];
    genreNames = (result['genres'] as List<dynamic>?)?.map((g) => g['name'] as String).toList();
  }

  factory MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    return MovieResponse(parsedJson);
  }
}
