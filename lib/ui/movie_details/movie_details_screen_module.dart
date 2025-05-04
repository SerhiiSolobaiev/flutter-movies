import 'package:flutter_onboarding/ui/movie_details/movie_details_bloc.dart';
import 'package:flutter_onboarding/ui/movie_details/movie_details_interactor.dart';
import 'package:get_it/get_it.dart';

void registerMovieDetailsScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MovieDetailsInteractor(getIt()));
  getIt.registerFactory(() => MovieDetailsBloc(getIt()));
}
