part of 'movies_list_bloc.dart';

@immutable
sealed class MoviesListState {
  final bool isLoading;
  final List<Movie> movies;

  const MoviesListState(this.isLoading, this.movies);
}

final class MoviesListInitial extends MoviesListState {
  const MoviesListInitial() : super(true, const []);
}

final class MoviesListLoaded extends MoviesListState {
  const MoviesListLoaded(super.isLoading, super.movies);
}

final class MoviesListError extends MoviesListState {
  const MoviesListError(String e) : super(false, const []);
}
