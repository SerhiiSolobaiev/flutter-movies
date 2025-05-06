import 'package:flutter_onboarding/repository/movies_repository.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage.dart';

import '../network/movies_api_helper.dart';
import 'mapper/mapper.dart';
import '../data/movie.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiHelper apiHelper;
  final MoviesStorage moviesStorage;
  final MovieMapper mapper;

  MoviesRepositoryImpl(this.apiHelper, this.moviesStorage, this.mapper);

  @override
  Future<List<Movie>> getMovies() async {
    final isDirty = await moviesStorage.isMoviesCacheDirty();
    final cached = await moviesStorage.getMovies();
    final cachedMovies = cached.map((m) => mapper.mapDaoToDomain(m)).toList();

    if (!isDirty && cachedMovies.isNotEmpty) {
      print(
          "MoviesRepository return cached movies, size=${cachedMovies.length}");
      return cachedMovies;
    }

    final response = await apiHelper.getMovies();
    if (response != null) {
      final moviesFromApi = await mapper.mapResponseToMovies(response);

      final localModels = moviesFromApi.map(mapper.mapDomainToDao).toList();
      await moviesStorage.deleteAll();
      await moviesStorage.addMovies(localModels);

      print(
          "MoviesRepository return movies from api, size=${moviesFromApi.length}");
      return moviesFromApi;
    }

    print(
        "MoviesRepository return fallback cached movies, size=${cachedMovies.length}");
    return cachedMovies;
  }

  @override
  Future<Movie?> getMovieDetails(int movieId) async {
    final response = await apiHelper.getMoviesDetails(movieId);
    if (response == null) return null;
    return mapper.mapResponseToMovie(response);
  }
}
