part of di;

final getIt = GetIt.instance;

void setupDI() {
  registerDaoModule(getIt);
  registerNetworkApiModule(getIt);
  registerMovieRepositoryModule(getIt);
  registerMovieScreenModule(getIt);
  registerMovieDetailsScreenModule(getIt);
}
