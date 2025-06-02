part of movies_screen;

class MovieUIMapper {
  Future<MovieUIModel> mapToUIData(MovieLocalModel movie) async {
    return MovieUIModel(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        voteAverage: movie.voteAverage.toStringAsFixed(1),
        releaseDate: movie.releaseDate.split('-').first);
  }

  Future<MovieUIModel> mapToDetailsUIData(MovieLocalModel movie) async {
    return MovieUIModel(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        voteAverage: movie.voteAverage.toStringAsFixed(1),
        releaseDate: movie.releaseDate,
        genreNames: movie.genreNames.join(', '),
        budget: '${(movie.budget / 1000000).round()}',
        revenue: '${(movie.revenue / 1000000).round()}');
  }
}
