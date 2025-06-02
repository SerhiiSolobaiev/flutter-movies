part of repository_movies;

class MoviesRepositoryImpl implements MoviesRepository {
  final MoviesApiHelper apiHelper;
  final MovieDao moviesStorage;
  final MovieMapper mapper;

  static const _cachedAtKey = 'cached_at';
  static const _ttl = Duration(minutes: 5); // Time to live for cache

  MoviesRepositoryImpl(this.apiHelper, this.moviesStorage, this.mapper);

  @override
  Future<List<MovieLocalModel>> getMovies() async {
    final isDirty = await isMoviesCacheDirty();
    final cached = await moviesStorage.getMovies();
    final cachedMovies = cached.map((m) => mapper.mapDaoToDomain(m)).toList();

    if (!isDirty && cachedMovies.isNotEmpty) {
      return cachedMovies;
    } else {
      final moviesFromApi = await apiHelper.getMovies().then((response) => mapper.mapResponseToMovies(response));
      if (moviesFromApi.isNotEmpty) {
        final localModels = moviesFromApi.map((m) => mapper.mapDomainToDao(m)).toList();
        await moviesStorage.deleteAll();
        await moviesStorage.addMovies(localModels);
        SharedPreferencesAsync().setInt(_cachedAtKey, DateTime.now().millisecondsSinceEpoch);

        return moviesFromApi;
      }
    }

    return cachedMovies;
  }

  @override
  Future<MovieLocalModel?> getMovieDetails(int movieId)  {
    return apiHelper.getMoviesDetails(movieId).then((details) => mapper.mapResponseToMovie(details));
  }

  Future<bool> isMoviesCacheDirty() async {
    final cachedMillis = await SharedPreferencesAsync().getInt(_cachedAtKey);
    if (cachedMillis == null) return true;

    final cachedTime = DateTime.fromMillisecondsSinceEpoch(cachedMillis);
    return DateTime.now().difference(cachedTime) > _ttl;
  }
}
