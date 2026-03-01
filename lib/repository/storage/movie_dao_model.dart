part of repository_movies;

@Entity(tableName: MovieDao.MOVIE_TABLE)
class MovieDaoModel {
  static const ID_COL_NAME = 'c0';

  @primaryKey
  @ColumnInfo(name: ID_COL_NAME)
  final int id;
  @ColumnInfo(name: 'c1')
  final String title;
  @ColumnInfo(name: 'c2')
  final String overview;
  @ColumnInfo(name: 'c3')
  final String posterPath;
  @ColumnInfo(name: 'c4')
  final double voteAverage;
  @ColumnInfo(name: 'c5')
  final String releaseDate;

  MovieDaoModel({
    required this.id,
    required this.title,
    required this.overview,
    required this.posterPath,
    required this.voteAverage,
    required this.releaseDate,
  });
}
