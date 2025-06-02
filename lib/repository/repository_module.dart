part of repository_movies;

void registerMovieRepositoryModule(GetIt getIt) {
  getIt.registerLazySingleton<MovieMapper>(() => MovieMapper());
  getIt.registerLazySingleton<MoviesStorage>(() => getIt<MovieDao>());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt(), getIt(), getIt()));
}
