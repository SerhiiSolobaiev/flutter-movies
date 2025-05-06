import 'package:flutter_onboarding/repository/storage/AppDatabase.dart';
import 'package:flutter_onboarding/repository/storage/movies_storage.dart';
import 'package:flutter_onboarding/repository/storage/movie_dao_model.dart';
import 'package:shared_preferences/shared_preferences.dart';

import 'dart:async';

import 'package:sqflite/sqflite.dart';

class MoviesStorageImpl implements MoviesStorage {
  final AppDatabase _database;

  static const _cachedAtKey = 'cached_at';
  static const _ttl = Duration(minutes: 5); // Time to live

  final String moviesTable = "movies";

  MoviesStorageImpl(this._database);

  @override
  Future addMovies(List<MovieDaoModel> movies) {
    final batch = _database.db.batch();

    for (final movie in movies) {
      batch.insert(
        moviesTable,
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    SharedPreferencesAsync().setInt(_cachedAtKey, DateTime.now().millisecondsSinceEpoch);
    return batch.commit(noResult: true);
  }

  @override
  Future<List<MovieDaoModel>> getMovies() {
    try {
      return _database.db.query(moviesTable).then((moviesFromDb) {
        return List.generate(moviesFromDb.length, (i) {
          final movie = moviesFromDb[i];
          return MovieDaoModel(
            id: movie['id'] as int,
            title: movie['title'] as String,
            overview: movie['overview'] as String,
            posterPath: movie['posterPath'] as String,
            voteAverage: movie['voteAverage'] as double,
            releaseDate: movie['releaseDate'] as String,
          );
        });
      }).catchError((e) {
        print("MoviesStorage query error in getMovies: $e");
        return <MovieDaoModel>[];
      });
    } catch (e) {
      print("MoviesStorage error in getMovies: $e");
      return Future.value(<MovieDaoModel>[]);
    }
  }

  @override
  Future<int?> deleteAll() {
    return _database.db.delete(moviesTable);
  }

  @override
  Future<bool> isMoviesCacheDirty() async {
    final cachedMillis = await SharedPreferencesAsync().getInt(_cachedAtKey);
    if (cachedMillis == null) return true;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(cachedMillis);
    return DateTime.now().difference(cachedTime) > _ttl;
  }
}
