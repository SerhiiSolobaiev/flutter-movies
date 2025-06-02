part of movies_screen;

@immutable
sealed class _MovieDetailsEvent {
  const _MovieDetailsEvent();
}

final class _LoadMovieDetailsEvent extends _MovieDetailsEvent {
  final _MovieUIModel movie;

  const _LoadMovieDetailsEvent(this.movie);
}