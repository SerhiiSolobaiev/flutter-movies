part of network;

class MoviesApiHelper {
  final Dio _dio;

  MoviesApiHelper(this._dio);

  Future<MoviesResponse> getMovies() async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/popular",
      queryParameters: {
        'language': 'en-US',
        'page': 1,
      },
    );
    return MoviesResponse.fromJson(response.data);
  }

  Future<MovieResponse?> getMoviesDetails(int movieId) async {
    final response = await _dio.get(
      "https://api.themoviedb.org/3/movie/$movieId",
      queryParameters: {
        'language': 'en-US',
      },
    );

    return MovieResponse.fromJson(response.data);
  }
}
