import '../../models/movie.dart';
import '../../repository/movies_repository.dart';

class MovieDetailsInteractor {
  final MoviesRepository _movieRepository;

  MovieDetailsInteractor(this._movieRepository);

  Future<Movie?> getMovieDetails(int movieId) {
    return _movieRepository.getMovieDetails(movieId);
  }
}