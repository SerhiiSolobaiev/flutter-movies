class Result {
  int? _vote_count;
  int _id = 0;
  bool? _video;
  double? _vote_average;
  String? _title;
  double? _popularity;
  String? _poster_path;
  String? _original_language;
  String? _original_title;
  List<int> _genre_ids = [];         // For list endpoint (IDs only)
  List<String> _genre_names = [];    // For details endpoint (Names)
  String? _backdrop_path;
  bool? _adult;
  String? _overview;
  String? _release_date;

  // New fields from details endpoint
  int? _runtime;
  int? _budget;
  int? _revenue;
  String? _homepage;

  Result(result) {
    _vote_count = result['vote_count'];
    _id = result['id'];
    _video = result['video'];
    _vote_average = result['vote_average']?.toDouble();
    _title = result['title'];
    _popularity = result['popularity']?.toDouble();
    _poster_path = result['poster_path'];
    _original_language = result['original_language'];
    _original_title = result['original_title'];

    // Handle genre_ids (list endpoint)
    if (result['genre_ids'] != null) {
      for (int i = 0; i < result['genre_ids'].length; i++) {
        _genre_ids.add(result['genre_ids'][i]);
      }
    }

    // Handle genres (details endpoint)
    if (result['genres'] != null) {
      for (var genre in result['genres']) {
        _genre_names.add(genre['name']);
      }
    }

    _backdrop_path = result['backdrop_path'];
    _adult = result['adult'];
    _overview = result['overview'];
    _release_date = result['release_date'];

    // New fields
    _runtime = result['runtime'];
    _budget = result['budget'];
    _revenue = result['revenue'];
    _homepage = result['homepage'];
  }

  // Getters
  String? get release_date => _release_date;
  String? get overview => _overview;
  bool? get adult => _adult;
  String? get backdrop_path => _backdrop_path;
  List<int> get genre_ids => _genre_ids;
  List<String> get genre_names => _genre_names;
  String? get original_title => _original_title;
  String? get original_language => _original_language;
  String? get poster_path => _poster_path;
  double? get popularity => _popularity;
  String? get title => _title;
  double? get vote_average => _vote_average;
  bool? get video => _video;
  int get id => _id;
  int? get vote_count => _vote_count;

  // New getters
  int? get runtime => _runtime;
  int? get budget => _budget;
  int? get revenue => _revenue;
  String? get homepage => _homepage;

  factory Result.fromJson(Map<String, dynamic> parsedJson) {
    return Result(parsedJson);
  }

  String getGenresString(Result movie) {
    // Assuming your Result model holds genres as List<int> or List<String>
    if (movie.genre_ids.isNotEmpty) {
      return movie.genre_ids.join(', ');
    }
    return 'N/A';
  }
}
