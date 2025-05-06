import 'package:bloc/bloc.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:meta/meta.dart';

import '../../data/movie.dart';
import 'movie_details_interactor.dart';

part 'movie_details_event.dart';

part 'movie_details_state.dart';

class MovieDetailsBloc extends Bloc<MovieDetailsEvent, MovieDetailsState> {
  final MovieDetailsInteractor _movieInteractor;

  MovieDetailsBloc(this._movieInteractor, Movie movie)
      : super(MovieDetailsInitial(movie)) {
    on<MovieDetailsInitialEvent>((event, emit) async {
      try {
        final fullMovie =
            await _movieInteractor.getMovieDetails(event.movie.id);
        if (fullMovie != null) {
          emit(MovieDetailsLoaded(fullMovie));
        } else {
          emit(MovieDetailsError("TBD", event.movie));
        }
      } catch (e) {
        emit(MovieDetailsError(e.toString(), event.movie));
      }
    });
  }
}
