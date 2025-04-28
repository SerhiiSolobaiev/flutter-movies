part of 'movies_list_bloc.dart';

@immutable
sealed class MoviesListState {}

final class MoviesListInitial extends MoviesListState {}
final class MoviesListLoaded extends MoviesListState {}
