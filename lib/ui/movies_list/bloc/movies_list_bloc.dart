part of movies_screen;

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final MoviesInteractor _movieInteractor;
  final MovieUIMapper _mapper;

  MoviesListBloc(this._movieInteractor, this._mapper) : super(MoviesListState()) {
    on<LoadMoviesEvent>(_onLoadMovies);
    on<MovieClickedEvent>(_onNavigateToMovieDetails);
  }

  Future _onLoadMovies(
    LoadMoviesEvent event,
    Emitter<MoviesListState> emit,
  ) async {
    emit(MoviesListState(isLoading: true));
    try {
      final movies = await _movieInteractor.getMovies();
      List<MovieUIModel> moviesUIData =
      await Future.wait(movies.map(_mapper.mapToUIData));
      emit(MoviesListState(title: "Popular Movies", movies: moviesUIData, isLoading: false, error: null));
    } catch (e) {
      emit(MoviesListState(error: e.toString(), isLoading: false));
    }
  }

  Future _onNavigateToMovieDetails(
      MovieClickedEvent event,
      Emitter<MoviesListState> emit,
      ) async {
    Navigator.of(event.context).push(MaterialPageRoute(builder: (context) => MovieDetailsScreen(movie: event.movie)));
  }
}
