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
  Future<void> addMovies(List<MovieDaoModel> movies) async {
    final db = _database.db;
    final batch = db.batch();

    for (final movie in movies) {
      batch.insert(
        moviesTable,
        movie.toMap(),
        conflictAlgorithm: ConflictAlgorithm.replace,
      );
    }

    SharedPreferencesAsync()
        .setInt(_cachedAtKey, DateTime.now().millisecondsSinceEpoch);
    await batch.commit(noResult: true);
  }

  @override
  Future<List<MovieDaoModel>> getMovies() async {
    final db = _database.db;

    final List<Map<String, dynamic>> movies = await db.query(moviesTable);

    try {
      return List.generate(movies.length, (i) {
        final movie = movies[i];
        return MovieDaoModel(
          id: movie['id'] as int,
          title: movie['title'] as String,
          overview: movie['overview'] as String,
          posterPath: movie['posterPath'] as String,
          voteAverage: movie['voteAverage'] as double,
          releaseDate: movie['releaseDate'] as String,
        );
      });
    } catch (e) {
      print("MoviesStorage getMovies from db error=$e");
      return List.empty();
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
