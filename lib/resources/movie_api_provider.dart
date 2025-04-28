import 'dart:async';
import 'package:dio/dio.dart';
import 'package:flutter_onboarding/models/item_model.dart';

class MovieApiProvider {
  final dio = Dio();
  final _apiKey =
      'eyJhbGciOiJIUzI1NiJ9.eyJhdWQiOiJlMWY0ZDg2MzY0ZjY2YWI0OGJkNjJmMGMzYmM4YmJjOSIsIm5iZiI6MTc0MjM4OTY4OS41NzQwMDAxLCJzdWIiOiI2N2RhYzFiOTdiYTdkYTcxNjNhMWVjMWQiLCJzY29wZXMiOlsiYXBpX3JlYWQiXSwidmVyc2lvbiI6MX0.w8AObWJ7pJ9yxTupyNJxNYOcSKocHXI4NvFcsz0mx8M';

  Future<ItemModel?> getMoviesList() async {
    try {
      final response = await dio.get(
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

      // Map the full response to ItemModel
      return ItemModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print("LOOOL error: ${e.response}");
      } else {
        print("LOOOL Unexpected error: $e");
      }
      return null;
    }
  }

  Future<ItemModel?> getMoviesDetails(String movieId) async {
    try {
      final response = await dio.get(
        "https://api.themoviedb.org/3/movie",
        queryParameters: {
          'language': 'en-US',
          'movie_id': movieId,
        },
        options: Options(
          headers: {
            'Authorization': 'Bearer $_apiKey',
            'Accept': 'application/json',
          },
        ),
      );

      // Map the full response to ItemModel
      return ItemModel.fromJson(response.data);
    } catch (e) {
      if (e is DioException) {
        print("LOOOL error: ${e.response}");
      } else {
        print("LOOOL Unexpected error: $e");
      }
      return null;
    }
  }
}
