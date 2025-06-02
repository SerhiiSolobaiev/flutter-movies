part of movies_screen;

class MovieDetailsInteractor {
  final MoviesRepository _movieRepository;

  MovieDetailsInteractor(this._movieRepository);

  Future<MovieLocalModel?> getMovieDetails(int movieId) {
    return _movieRepository.getMovieDetails(movieId);
  }
}
