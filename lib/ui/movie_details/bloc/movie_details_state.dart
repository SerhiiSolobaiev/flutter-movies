part of movies_screen;

@immutable
class MovieDetailsState {
  final bool isLoading;
  final MovieUIModel movie;
  final String? error;

  const MovieDetailsState({this.isLoading = true, required this.movie, this.error});
}
