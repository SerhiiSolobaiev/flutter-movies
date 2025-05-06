import '../repository/movies_repository.dart';
import 'movie.dart';

class MoviesInteractor {
  final MoviesRepository _movieRepository;

  MoviesInteractor(this._movieRepository);

  Future<List<Movie>> getMovies() {
    return _movieRepository.getMovies();
  }
}
