part of repository_movies;

abstract interface class MoviesStorage {
  Future addMovies(List<MovieDaoModel> movies);

  Future<List<MovieDaoModel>> getMovies();

  Future<int?> deleteAll();
}
