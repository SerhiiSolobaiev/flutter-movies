part of movies_screen;

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsInteractor _movieInteractor;
  final MovieUIMapper _mapper;

  MovieDetailsBloc(this._movieInteractor, this._mapper, MovieUIModel movie) : super(MovieDetailsState(movie: movie)) {
    on<LoadMovieDetailsEvent>(_onLoadMovie);
  }

  Future _onLoadMovie(
    LoadMovieDetailsEvent event,
    Emitter<MovieDetailsState> emit,
  ) async {
    try {
      final fullMovie = await _movieInteractor.getMovieDetails(event.movie.id);
      if (fullMovie != null) {
        MovieUIModel fullMovieUIData = await _mapper.mapToDetailsUIData(fullMovie);
        emit(MovieDetailsState(isLoading: false, movie: fullMovieUIData));
      } else {
        emit(MovieDetailsState(isLoading: false, movie: event.movie, error: "oops"));
      }
    } catch (e) {
      emit(MovieDetailsState(isLoading: false, movie: event.movie, error: e.toString()));
    }
  }
}
