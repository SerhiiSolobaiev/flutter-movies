import 'package:flutter_onboarding/repository/storage/movie_dao_model.dart';

abstract interface class MoviesStorage {
  Future<void> addMovies(List<MovieDaoModel> movies);

  Future<List<MovieDaoModel>> getMovies();

  Future<int?> deleteAll();

  Future<bool> isMoviesCacheDirty();
}
