import 'package:flutter_onboarding/repository/movies_repository.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage.dart';

import '../models/movie.dart';
import '../resources/movie_api_provider.dart';

class MoviesRepositoryImpl implements MoviesRepository {

  final MovieApiProvider apiProvider;
  // final MoviesStorage moviesStorage;

  MoviesRepositoryImpl(this.apiProvider/*, this.moviesStorage*/);

  @override
  Future<List<Movie>> getMovies() async {
    final response = await apiProvider.getMovies();
    return response!.results;
  }

  @override
  Future<Movie> getMovieDetails(int movieId) {
    throw UnimplementedError();
  }
}