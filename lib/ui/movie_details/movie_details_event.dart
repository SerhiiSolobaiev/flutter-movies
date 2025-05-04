part of 'movie_details_bloc.dart';

@immutable
sealed class MovieDetailsEvent {
  const MovieDetailsEvent();
}

final class MovieDetailsInitialEvent extends MovieDetailsEvent {}
