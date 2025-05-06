import '../../network/movie_response.dart';
import '../../network/movies_response.dart';
import '../../data/movie.dart';
import '../storage/movie_dao_model.dart';

class MovieMapper {
  Future<List<Movie>> mapResponseToMovies(MoviesResponse moviesResponse) async {
    final futures = moviesResponse.movies.map(mapResponseToMovie).toList();
    return await Future.wait(futures);
  }

  Future<Movie> mapResponseToMovie(MovieResponse movieResponse) async {
    return Movie(
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

  Movie mapDaoToDomain(MovieDaoModel local) {
    return Movie(
      id: local.id,
      title: local.title,
      overview: local.overview,
      posterPath: local.posterPath,
      voteAverage: local.voteAverage,
      releaseDate: local.releaseDate,
    );
  }

  MovieDaoModel mapDomainToDao(Movie movie) {
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
