import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../models/movie.dart';
import '../movie_details/movie_details.dart';
import 'movies_interactor.dart';

part 'movies_list_event.dart';

part 'movies_list_state.dart';

class MoviesListBloc extends Bloc<MoviesListEvent, MoviesListState> {
  final MoviesInteractor _movieInteractor;

  MoviesListBloc(this._movieInteractor) : super(const MoviesListInitial()) {
    on<MoviesInitialEvent>((event, emit) async {
      try {
        List<Movie> movies = await _movieInteractor.getMovies();
        emit(MoviesListLoaded(false, movies));
      } catch (e) {
        emit(MoviesListError(e.toString()));
      }
    });
    on<MovieClickedEvent>((event, emit) async {
      navigateToDetailsPage(event.context, event.movie);
    });
  }

  void navigateToDetailsPage(context, movie) {
    Navigator.of(context).push(MaterialPageRoute(
        builder: (context) => MovieDetailsScreen(movie: movie)));
  }
}
