part of movies_screen;

void registerMovieDetailsScreenModule(GetIt getIt) {
  getIt.registerLazySingleton(() => _MovieDetailsInteractor(getIt()));
  getIt.registerFactoryParam<_MovieDetailsBloc, _MovieUIModel, void>(
    (movie, _) => _MovieDetailsBloc(getIt(), getIt(), movie),
  );
}
