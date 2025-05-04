import 'package:get_it/get_it.dart';

import 'movies_interactor.dart';
import 'movies_list_bloc.dart';

void registerMovieScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MoviesInteractor(getIt()));
  getIt.registerFactory(() => MoviesListBloc(getIt()));
}
