import 'package:dio/dio.dart';
import 'package:get_it/get_it.dart';

import '../di/di.dart';
import 'bearer_interceptor.dart';
import 'movies_api_helper.dart';

const String _AUTH_DIO = 'dfhfghg3456356';

void registerNetworkApiModule(GetIt getIt) {
  getIt.registerLazySingleton(() => BearerInterceptor());
  getIt.registerLazySingleton<Dio>(
      instanceName: _AUTH_DIO, () => _registerDio());
  getIt.registerLazySingleton(
      () => MoviesApiHelper(getIt<Dio>(instanceName: _AUTH_DIO)));
}

Dio _registerDio() {
  return Dio(BaseOptions())..interceptors.add(getIt<BearerInterceptor>());
}
