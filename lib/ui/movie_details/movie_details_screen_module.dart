part of movies_screen;

void registerMovieDetailsScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MovieDetailsInteractor(getIt()));
  getIt.registerFactoryParam<MovieDetailsBloc, MovieUIModel, void>(
    (movie, _) => MovieDetailsBloc(getIt(), getIt(), movie),
  );
}
