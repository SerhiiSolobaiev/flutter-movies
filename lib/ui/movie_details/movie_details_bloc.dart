import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../models/movie.dart';
import 'movie_details_interactor.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsInteractor _movieInteractor;

  MovieDetailsBloc(this._movieInteractor) : super(const MovieDetailsInitial()) {
    on<MovieDetailsInitialEvent>((event, emit) async {

      // try {
      //   List<Movie> movies = await _movieInteractor.getMovies();
      //   emit(MoviesListLoaded(false, movies));
      // } catch (e) {
      //   emit(MoviesListError(e.toString()));
      // }
    });
  }
}
