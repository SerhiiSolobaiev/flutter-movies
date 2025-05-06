import 'package:flutter_onboarding/repository/movies_repository.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage.dart';

import '../domain/movie.dart';
import '../network/movies_api_helper.dart';
import 'mapper/mapper.dart';

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
      return cachedMovies;
    }

    final response = await apiHelper.getMovies();
    if (response != null) {
      final moviesFromApi = mapper.mapResponseToMovies(response);

      final localModels = moviesFromApi.map(mapper.mapDomainToDao).toList();
      await moviesStorage.deleteAll();
      await moviesStorage.addMovies(localModels);

      return moviesFromApi;
    }

    return cachedMovies;
  }

  @override
  Future<Movie?> getMovieDetails(int movieId) async {
    final response = await apiHelper.getMoviesDetails(movieId);
    if (response == null) return null;
    return mapper.mapResponseToMovie(response);
  }
}
