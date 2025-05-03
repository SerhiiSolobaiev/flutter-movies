part of di;

final getIt = GetIt.instance;

void setupDI() {
  registerDaoModule(getIt);
  registerNetworkApiModule(getIt);
  registerMovieRepositoryModule(getIt);
  // registerStorageModule(getIt);
  // registerMovieScreenModule(getIt);
  registerMovieScreenModule(getIt);
}
