import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_onboarding/models/movie_results.dart';

import '../models/movie.dart';

class MovieApiProvider {
  final _dio = Dio();
  final _apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWY0ZDg2MzY0ZjY2YWI0OGJkNjJmMGMzYmM4YmJjOSIsIm5iZiI6MTc0MjM4OTY4OS41NzQwMDAxLCJzdWIiOiI2N2RhYzFiOTdiYTdkYTcxNjNhMWVjMWQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.w8AObWJ7pJ9yxTupyNJxNYOcSKocHXI4NvFcsz0mx8M';

  Future<ItemModel?> getMovies() async {
    try {
      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/popular",
        queryParameters: {
          'language': 'en-US',
          'page': 1,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Accept': 'application/json',
          },
        ),
      );

      return ItemModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print("LOOOL getMoviesList error: ${e.response}");
      } else {
        print("LOOOL getMoviesList Unexpected error: $e");
      }
      return null;
    }
  }

  Future<Movie?> getMoviesDetails(int movieId) async {
    try {
      await Future.delayed(const Duration(milliseconds: 300));

      final response = await _dio.get(
        "https://api.themoviedb.org/3/movie/$movieId",
        queryParameters: {
          'language': 'en-US',
          // 'movie_id': movieId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Accept': 'application/json',
          },
        ),
      );

      return Movie.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print("LOOOL getMoviesDetails error: ${e.response}");
      } else {
        print("LOOOL getMoviesDetails Unexpected error: $e");
      }
      return null;
    }
  }
}
