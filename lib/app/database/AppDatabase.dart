part of app;

@Database(version: 1, entities: [MovieDaoModel])
abstract class AppDatabase extends FloorDatabase {
  MovieDao get movieDao;
}
