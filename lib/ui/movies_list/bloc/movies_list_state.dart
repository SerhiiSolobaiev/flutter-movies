part of movies_screen;

@immutable
class MoviesListState {
  final String title;
  final bool isLoading;
  final List<MovieUIModel> movies;
  final String? error;

  const MoviesListState({this.title = "", this.isLoading = true, this.movies = const [], this.error});
}
