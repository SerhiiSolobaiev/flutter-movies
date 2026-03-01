part of movies_screen;

@immutable
sealed class _MoviesListEvent {
  const _MoviesListEvent();
}

final class _LoadMoviesEvent extends _MoviesListEvent {}

final class _MovieClickedEvent extends _MoviesListEvent {
  final BuildContext context;
  final _MovieUIModel movie;

  const _MovieClickedEvent(this.context, this.movie);
}
