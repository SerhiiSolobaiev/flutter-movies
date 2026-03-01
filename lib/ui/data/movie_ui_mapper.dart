part of movies_screen;

class _MovieUIMapper {
  Future<_MovieUIModel> mapToUIData(MovieLocalModel movie) async {
    return _MovieUIModel(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        voteAverage: movie.voteAverage.toStringAsFixed(1),
        releaseDate: movie.releaseDate.split('-').first);
  }

  Future<_MovieUIModel> mapToDetailsUIData(MovieLocalModel movie) async {
    return _MovieUIModel(
        id: movie.id,
        title: movie.title,
        overview: movie.overview,
        imageUrl: 'https://image.tmdb.org/t/p/w500${movie.posterPath}',
        voteAverage: movie.voteAverage.toStringAsFixed(1),
        releaseDate: movie.releaseDate,
        genreNames: movie.genreNames.join(', '),
        budget: (movie.budget == 0) ? '' : '${(movie.budget / 1000000).round()}',
        revenue: (movie.revenue == 0) ? '' : '${(movie.revenue / 1000000).round()}',
        homepage: movie.homepage);
  }
}
