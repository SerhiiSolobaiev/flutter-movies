part of network;

class MovieResponse {
  late int? id;
  late double? voteAverage;
  late String? title;
  late String? posterPath;
  late String? overview;
  late String? releaseDate;

  MovieResponse(result) {
    id = result['id'];
    voteAverage = result['vote_average']?.toDouble();
    title = result['title'];
    posterPath = result['poster_path'];
    overview = result['overview'];
    releaseDate = result['release_date'];
  }

  factory MovieResponse.fromJson(Map<String, dynamic> parsedJson) {
    return MovieResponse(parsedJson);
  }
}
