part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {
  final bool isLoading;
  final Movie? movie;

  const MovieDetailsState(this.isLoading, this.movie);
}

final class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial() : super(false, null);
}

final class MovieDetailsLoaded extends MovieDetailsState {
  const MovieDetailsLoaded(super.isLoading, super.movie);
}

final class MoviesListError extends MovieDetailsState {
  const MoviesListError(String e) : super(false, null);
}
