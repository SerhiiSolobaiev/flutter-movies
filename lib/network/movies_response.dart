part of network;

class MoviesResponse {
  late List<MovieResponse> movies;

  MoviesResponse.fromJson(Map<String, dynamic> json) {
    final results = json['results'];
    if (results is List) {
      movies = results.map((movie) => MovieResponse(movie)).toList();
    } else {
      movies = [];
    }
  }
}
