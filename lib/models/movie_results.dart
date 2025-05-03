import 'movie.dart';

class ItemModel {
  int _page = 1;
  int _total_results = 0;
  int _total_pages = 0;
  List<Movie> _results = [];

  ItemModel({
    required int page,
    required int totalResults,
    required int totalPages,
    required List<Movie> results,
  })  : _page = page,
        _total_results = totalResults,
        _total_pages = totalPages,
        _results = results;

  factory ItemModel.fromJson(Map<String, dynamic> parsedJson) {
    List<Movie> temp = [];
    for (var result in parsedJson['results']) {
      temp.add(Movie(result));
    }
    return ItemModel(
      page: parsedJson['page'],
      totalResults: parsedJson['total_results'],
      totalPages: parsedJson['total_pages'],
      results: temp,
    );
  }

  List<Movie> get results => _results;

  int get total_pages => _total_pages;

  int get total_results => _total_results;

  int get page => _page;
}
