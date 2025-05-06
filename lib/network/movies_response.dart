import 'movie_response.dart';

class MoviesResponse {
  late List<MovieResponse> movies;

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    movies = (json['results'] as List)
        .map((movie) => MovieResponse(movie))
        .toList();
  }
}
