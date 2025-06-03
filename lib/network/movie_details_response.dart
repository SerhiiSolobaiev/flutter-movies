part of network;

class MovieDetailsResponse {
  late int? id;
  late double? voteAverage;
  late String? title;
  late String? posterPath;
  late String? overview;
  late String? releaseDate;
  late List<String>? genreNames;
  late int? budget;
  late int? revenue;
  late String? homepage;

  MovieDetailsResponse(result) {
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

  factory MovieDetailsResponse.fromJson(Map<String, dynamic> parsedJson) {
    return MovieDetailsResponse(parsedJson);
  }
}
