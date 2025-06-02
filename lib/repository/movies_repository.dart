part of repository_movies;

abstract interface class MoviesRepository {
  Future<List<MovieLocalModel>> getMovies();

  Future<MovieLocalModel?> getMovieDetails(int movieId);
}
