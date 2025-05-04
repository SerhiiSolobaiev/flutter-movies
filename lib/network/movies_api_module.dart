import 'package:get_it/get_it.dart';

import 'movie_api_provider.dart';

void registerNetworkApiModule(GetIt getIt) {
  getIt.registerLazySingleton(() => MovieApiProvider());
}