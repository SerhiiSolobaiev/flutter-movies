import 'package:flutter_onboarding/repository/storage/movies_storage.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage_impl.dart';
import 'package:get_it/get_it.dart';

import 'mapper/mapper.dart';
import 'movies_repository.dart';
import 'movies_repository_impl.dart';
import 'storage/AppDatabase.dart';

void registerDaoModule(GetIt getIt) {
  getIt.registerLazySingleton(() => AppDatabase());
}

void registerMovieRepositoryModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MovieMapper());
  getIt.registerLazySingleton<MoviesStorage>(() => MoviesStorageImpl(getIt()));
  getIt.registerLazySingleton<MoviesRepository>(() => MoviesRepositoryImpl(getIt(), getIt(), getIt()));
}