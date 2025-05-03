import 'package:flutter_onboarding/bloc/movies_list_bloc.dart';
import 'package:get_it/get_it.dart';

import 'movies_interactor.dart';

void registerMovieScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MoviesInteractor(getIt()));
  getIt.registerFactory(() => MoviesListBloc(getIt()));
}
