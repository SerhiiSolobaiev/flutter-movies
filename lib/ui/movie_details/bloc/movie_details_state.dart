part of movies_screen;

@immutable
class _MovieDetailsState {
  final bool isLoading;
  final _MovieUIModel movie;
  final String? error;

  const _MovieDetailsState({this.isLoading = true, required this.movie, this.error});
}
