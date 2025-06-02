part of movies_screen;

class MoviesInteractor {
  final MoviesRepository _movieRepository;

  MoviesInteractor(this._movieRepository);

  Future<List<MovieLocalModel>> getMovies() {
    return _movieRepository.getMovies();
  }
}
