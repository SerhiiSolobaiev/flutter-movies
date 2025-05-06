import '../data/movie.dart';

abstract class MoviesRepository {
  Future<List<Movie>> getMovies();

  Future<Movie?> getMovieDetails(int movieId);
}
