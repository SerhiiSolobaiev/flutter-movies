part of movies_screen;

@immutable
class _MoviesListState {
  final String title;
  final bool isLoading;
  final List<_MovieUIModel> movies;
  final String? error;

  const _MoviesListState({this.title = "", this.isLoading = true, this.movies = const [], this.error});
}
