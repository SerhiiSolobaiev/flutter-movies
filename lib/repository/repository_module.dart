import 'package:flutter_onboarding/repository/storage/movies_storage.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage_impl.dart';
import 'package:get_it/get_it.dart';

import 'movies_repository.dart';
import 'movies_repository_impl.dart';
import 'storage/AppDatabaseBuilder.dart';

void registerDaoModule(GetIt getIt) {
  getIt.registerLazySingleton(() => AppDatabaseBuilder());
  // getIt.registerLazySingleton(() => AppDatabase._appDb._movieDao);
}

void registerMovieRepositoryModule(GetIt getIt) {
  // getIt.registerLazySingleton(() => _MovieMapper());
  // getIt.registerLazySingleton<BaseImageUrlStorage>(
  //         () => BaseImageUrlStorageImpl());
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt()));
}