part of movies_screen;

@immutable
sealed class MovieDetailsEvent {
  const MovieDetailsEvent();
}

final class LoadMovieDetailsEvent extends MovieDetailsEvent {
  final MovieUIModel movie;

  const LoadMovieDetailsEvent(this.movie);
}