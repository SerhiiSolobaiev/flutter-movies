part of repository_movies;

void registerMovieRepositoryModule(GetIt getIt) {
  getIt.registerLazySingleton<_MovieMapper>(() => _MovieMapper());
  getIt.registerLazySingleton<MoviesStorage>(() => getIt<MovieDao>());
  getIt.registerLazySingleton<MoviesRepository>(() => _MoviesRepositoryImpl(getIt(), getIt(), getIt()));
}
