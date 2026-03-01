part of movies_screen;

class _MoviesInteractor {
  final MoviesRepository _movieRepository;

  _MoviesInteractor(this._movieRepository);

  Future<List<MovieLocalModel>> getMovies() {
    return _movieRepository.getMovies();
  }
}
