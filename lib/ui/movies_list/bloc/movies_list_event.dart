part of movies_screen;

@immutable
sealed class MoviesListEvent {
  const MoviesListEvent();
}

final class LoadMoviesEvent extends MoviesListEvent {}

final class MovieClickedEvent extends MoviesListEvent {
  final BuildContext context;
  final MovieUIModel movie;

  const MovieClickedEvent(this.context, this.movie);
}
