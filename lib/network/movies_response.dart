part of network;

class MoviesResponse {
  late List<MovieResponse> movies;

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    movies = (json['results'] is List) ? (json['results'] as List).map((movie) => MovieResponse(movie)).toList() : [];
  }
}
