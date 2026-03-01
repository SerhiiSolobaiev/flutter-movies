part of repository_movies;

class _MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiHelper apiHelper;
  final MoviesStorage moviesStorage;
  final _MovieMapper mapper;
  final _sharedPrefs = SharedPreferencesAsync();

  static const _cachedAtKey = 'cached_at';
  static const _ttl = Duration(minutes: 5); // Time to live for cache

  _MoviesRepositoryImpl(this.apiHelper, this.moviesStorage, this.mapper);

  @override
  Future<List<MovieLocalModel>> getMovies() async {
    final [isDirtyResult, cachedDaoModels] = await Future.wait([
      _isMoviesCacheDirty(),
      moviesStorage.getMovies(),
    ]);

    final isDirty = isDirtyResult as bool;
    final cachedMovies = (cachedDaoModels as List<MovieDaoModel>).map(mapper.mapDaoToDomain).toList();

    if (!isDirty && cachedMovies.isNotEmpty) {
      return cachedMovies;
    }

    final response = await apiHelper.getMovies();
    final moviesFromApi = mapper.mapResponseToMovies(response);

    if (moviesFromApi.isEmpty) return cachedMovies;

    await Future.wait([
      moviesStorage.deleteAll(),
      _sharedPrefs.setInt(
        _cachedAtKey,
        DateTime.now().millisecondsSinceEpoch,
      ),
    ]);

    final localModels = moviesFromApi.map(mapper.mapDomainToDao).toList();
    await moviesStorage.addMovies(localModels);

    return moviesFromApi;
  }

  @override
  Future<MovieLocalModel?> getMovieDetails(int movieId) {
    return apiHelper.getMoviesDetails(movieId).then((details) => mapper.mapResponseToMovieDetails(details));
  }

  Future<bool> _isMoviesCacheDirty() async {
    final cachedMillis = await _sharedPrefs.getInt(_cachedAtKey);
    if (cachedMillis == null) return true;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(cachedMillis);
    return DateTime.now().difference(cachedTime) > _ttl;
  }
}
