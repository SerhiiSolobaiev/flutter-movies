part of repository_movies;

@dao
abstract class MovieDao implements MoviesStorage {
  static const MOVIE_TABLE = 'movies';

  @override
  @Query('SELECT * FROM $MOVIE_TABLE')
  Future<List<MovieDaoModel>> getMovies();

  @override
  @Insert(onConflict: OnConflictStrategy.replace)
  Future<void> addMovies(List<MovieDaoModel> movies);

  @override
  @Query('DELETE FROM $MOVIE_TABLE')
  Future<int?> deleteAll();
}