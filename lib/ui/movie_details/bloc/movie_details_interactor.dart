part of movies_screen;

class _MovieDetailsInteractor {
  final MoviesRepository _movieRepository;

  _MovieDetailsInteractor(this._movieRepository);

  Future<MovieLocalModel?> getMovieDetails(int movieId) {
    return _movieRepository.getMovieDetails(movieId);
  }
}
