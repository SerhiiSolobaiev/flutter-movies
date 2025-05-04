import 'package:flutter_onboarding/repository/movies_repository.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage.dart';

import '../models/movie.dart';
import '../network/movie_api_provider.dart';

class MoviesRepositoryImpl implements MoviesRepository {
  final MovieApiProvider apiProvider;
  final MoviesStorage moviesStorage;

  MoviesRepositoryImpl(this.apiProvider, this.moviesStorage);

  @override
  Future<List<Movie>> getMovies() async {
    final isDirty = await moviesStorage.isMoviesCacheDirty();
    final cached = await moviesStorage.getMovies();
    final movies = cached.map((m) => Movie.fromLocal(m)).toList();

    if (!isDirty && movies.isNotEmpty) {
      print("LOOOL return cached movies, size=${movies.length}");
      return movies;
    }

    final response = await apiProvider.getMovies();
    if (response != null) {
      final moviesFromApi = response.results;
      await moviesStorage.deleteAll();
      await moviesStorage
          .addMovies(moviesFromApi.map((m) => m.toLocalModel()).toList());
      print("LOOOL return moviesFromApi, size=${moviesFromApi.length}");
      return moviesFromApi;
    }
    print("LOOOL return lol, size=${movies.length}");
    return movies;
  }

  @override
  Future<Movie> getMovieDetails(int movieId) {
    throw UnimplementedError();
  }
}
