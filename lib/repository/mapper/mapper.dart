part of repository_movies;

class _MovieMapper {
  List<MovieLocalModel> mapResponseToMovies(MoviesResponse moviesResponse) {
    return moviesResponse.movies.mapNotNull(mapResponseToMovie).toList();
  }

  MovieLocalModel? mapResponseToMovie(MovieResponse movieResponse) {
    return MovieLocalModel(
      id: movieResponse.id ?? 0,
      title: movieResponse.title ?? '',
      overview: movieResponse.overview ?? '',
      posterPath: movieResponse.posterPath ?? '',
      voteAverage: movieResponse.voteAverage ?? 0,
      releaseDate: movieResponse.releaseDate ?? '',
    );
  }

  MovieLocalModel? mapResponseToMovieDetails(MovieDetailsResponse movieResponse) {
    return MovieLocalModel(
      id: movieResponse.id ?? 0,
      title: movieResponse.title ?? '',
      overview: movieResponse.overview ?? '',
      posterPath: movieResponse.posterPath ?? '',
      voteAverage: movieResponse.voteAverage ?? 0,
      releaseDate: movieResponse.releaseDate ?? '',
      genreNames: movieResponse.genreNames ?? List.empty(),
      budget: movieResponse.budget ?? 0,
      revenue: movieResponse.revenue ?? 0,
      homepage: movieResponse.homepage ?? '',
    );
  }

  MovieLocalModel mapDaoToDomain(MovieDaoModel local) {
    return MovieLocalModel(
      id: local.id,
      title: local.title,
      overview: local.overview,
      posterPath: local.posterPath,
      voteAverage: local.voteAverage,
      releaseDate: local.releaseDate,
    );
  }

  MovieDaoModel mapDomainToDao(MovieLocalModel movie) {
    return MovieDaoModel(
      id: movie.id,
      title: movie.title,
      overview: movie.overview,
      posterPath: movie.posterPath,
      voteAverage: movie.voteAverage,
      releaseDate: movie.releaseDate,
    );
  }
}
