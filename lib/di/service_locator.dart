part of di;

final getIt = GetIt.instance;

Future setupDI() async {
  final db = await $FloorAppDatabase.databaseBuilder("movies.db").build();
  getIt.registerSingleton<AppDatabase>(db);
  getIt.registerSingleton<MovieDao>(db.movieDao);

  registerNetworkApiModule(getIt);
  registerMovieRepositoryModule(getIt);
  registerMovieScreenModule(getIt);
  registerMovieDetailsScreenModule(getIt);
}
