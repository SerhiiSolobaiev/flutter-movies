part of movies_screen;

class _MoviesListBloc extends Bloc<_MoviesListEvent, _MoviesListState> {
  final _MoviesInteractor _movieInteractor;
  final _MovieUIMapper _mapper;

  _MoviesListBloc(this._movieInteractor, this._mapper) : super(_MoviesListState()) {
    on<_LoadMoviesEvent>(_onLoadMovies);
    on<_MovieClickedEvent>(_onNavigateToMovieDetails);
  }

  Future _onLoadMovies(
    _LoadMoviesEvent event,
    Emitter<_MoviesListState> emit,
  ) async {
    emit(_MoviesListState(isLoading: true));
    try {
      final movies = await _movieInteractor.getMovies();
      List<_MovieUIModel> moviesUIData =
      await Future.wait(movies.map(_mapper.mapToUIData));
      emit(_MoviesListState(title: "Popular Movies", movies: moviesUIData, isLoading: false, error: null));
    } catch (e) {
      emit(_MoviesListState(error: e.toString(), isLoading: false));
    }
  }

  Future _onNavigateToMovieDetails(
      _MovieClickedEvent event,
      Emitter<_MoviesListState> emit,
      ) async {
    Navigator.of(event.context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: event.movie)));
  }
}
