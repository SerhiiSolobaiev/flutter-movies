part of movies_screen;

void registerMovieScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MoviesInteractor(getIt()));
  getIt.registerLazySingleton(() => MovieUIMapper());
  getIt.registerFactory(() => MoviesListBloc(getIt(), getIt()));
}
