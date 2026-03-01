part of movies_screen;

class _MovieDetailsBloc extends Bloc<_MovieDetailsEvent, _MovieDetailsState> {
  final _MovieDetailsInteractor _movieInteractor;
  final _MovieUIMapper _mapper;

  _MovieDetailsBloc(this._movieInteractor, this._mapper, _MovieUIModel movie) : super(_MovieDetailsState(movie: movie)) {
    on<_LoadMovieDetailsEvent>(_onLoadMovie);
  }

  Future _onLoadMovie(
      _LoadMovieDetailsEvent event,
    Emitter<_MovieDetailsState> emit,
  ) async {
    try {
      final fullMovie = await _movieInteractor.getMovieDetails(event.movie.id);
      if (fullMovie != null) {
        _MovieUIModel fullMovieUIData = await _mapper.mapToDetailsUIData(fullMovie);
        emit(_MovieDetailsState(isLoading: false, movie: fullMovieUIData));
      } else {
        emit(_MovieDetailsState(isLoading: false, movie: event.movie, error: "oops"));
      }
    } catch (e) {
      emit(_MovieDetailsState(isLoading: false, movie: event.movie, error: e.toString()));
    }
  }
}
