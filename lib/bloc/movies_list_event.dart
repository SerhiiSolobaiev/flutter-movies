part of 'movies_list_bloc.dart';

@immutable
sealed class MoviesListEvent {
  const MoviesListEvent();
}

final class MoviesInitialEvent extends MoviesListEvent {}

final class MoviesLoadLocallyEvent extends MoviesListEvent {}

final class MoviesLoadRemotelyEvent extends MoviesListEvent {}

final class MovieClickedEvent extends MoviesListEvent {
  final int movieId;

  const MovieClickedEvent(this.movieId);
}
