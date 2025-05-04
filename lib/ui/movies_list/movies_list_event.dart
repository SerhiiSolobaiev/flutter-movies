part of 'movies_list_bloc.dart';

@immutable
sealed class MoviesListEvent {
  const MoviesListEvent();
}

final class MoviesInitialEvent extends MoviesListEvent {}

final class MovieClickedEvent extends MoviesListEvent {
  final BuildContext context;
  final Movie movie;

  const MovieClickedEvent(this.context, this.movie);
}
