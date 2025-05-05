part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsState {
  final bool isLoading;
  final Movie movie;

  const MovieDetailsState(this.isLoading, this.movie);
}

final class MovieDetailsInitial extends MovieDetailsState {
  const MovieDetailsInitial(Movie movie) : super(true, movie);
}

final class MovieDetailsLoaded extends MovieDetailsState {
  const MovieDetailsLoaded(Movie movie) : super(false, movie);
}

final class MovieDetailsError extends MovieDetailsState {
  final String error;

  const MovieDetailsError(this.error, Movie movie) : super(false, movie);
}
