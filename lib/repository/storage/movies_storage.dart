import 'package:flutter_onboarding/repository/storage/movie_local_model.dart';

abstract interface class MoviesStorage {
  Future<void> addMovies(List<MovieLocalModel> movies);
  Future<List<MovieLocalModel>> getMovies();
  Future<int?> deleteAll();

  Future<bool> isMoviesCacheDirty();
}