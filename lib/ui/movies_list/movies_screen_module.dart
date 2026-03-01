part of movies_screen;

void registerMovieScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => _MoviesInteractor(getIt()));
  getIt.registerLazySingleton(() => _MovieUIMapper());
  getIt.registerFactory(() => _MoviesListBloc(getIt(), getIt()));
}
