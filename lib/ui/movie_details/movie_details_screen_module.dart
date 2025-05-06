import 'package:flutter_onboarding/ui/movie_details/movie_details_bloc.dart';
import 'package:flutter_onboarding/ui/movie_details/movie_details_interactor.dart';
import 'package:get_it/get_it.dart';

import '../../data/movie.dart';

void registerMovieDetailsScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MovieDetailsInteractor(getIt()));
  getIt.registerFactoryParam<MovieDetailsBloc, Movie, void>(
    (movie, _) => MovieDetailsBloc(getIt(), movie),
  );
}
