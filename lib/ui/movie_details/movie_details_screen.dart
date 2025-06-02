part of movies_screen;

class MovieDetailsScreen extends StatefulWidget {
  final _MovieUIModel movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final _MovieDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<_MovieDetailsBloc>(param1: widget.movie);
    _bloc.add(_LoadMovieDetailsEvent(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<_MovieDetailsBloc, _MovieDetailsState>(
        listener: (context, state) {
          if (state.error != null) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text(LocaleKeys.error.tr())),
            );
          }
        },
        child: BlocBuilder<_MovieDetailsBloc, _MovieDetailsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.movie.title),
              ),
              body: buildMovieDetails(state),
            );
          },
        ),
      ),
    );
  }

  Widget buildMovieDetails(_MovieDetailsState state) {
    final isLoading = state.isLoading;
    final movieDetails = state.movie;
    final isError = state.error != null;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
            child: Hero(
                tag: 'movieImage_${movieDetails.id}',
                child: CachedNetworkImage(
                  imageUrl: movieDetails.imageUrl,
                )),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetails.overview,
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text('${LocaleKeys.movie_details_rating.tr()}: ${movieDetails.voteAverage}'),
              Text('${LocaleKeys.movie_details_release_date.tr()}: ${movieDetails.releaseDate}'),
              const SizedBox(height: 16),

              // Loaded Movie Details:
              isError
                  ? const SizedBox(height: 16)
                  : isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : _buildLoadedMovieDetails(movieDetails)
            ],
          ),
        ],
      ),
    );
  }

  Widget _buildLoadedMovieDetails(_MovieUIModel movieDetails) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      if (movieDetails.genreNames.isNotEmpty) Text('${LocaleKeys.movie_details_genres.tr()}: ${movieDetails.genreNames}'),
      if (movieDetails.budget.isNotEmpty) Text('${LocaleKeys.movie_details_budget.tr()}: \$${movieDetails.budget}${LocaleKeys.millions}'),
      if (movieDetails.revenue.isNotEmpty) Text('${LocaleKeys.movie_details_revenue.tr()}: \$${movieDetails.revenue}${LocaleKeys.millions}'),
      if (movieDetails.homepage.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GestureDetector(
            onTap: () async {
              final url = Uri.parse(movieDetails.homepage);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Text(
              '${LocaleKeys.movie_details_homepage.tr()}: ${movieDetails.homepage}',
              style: const TextStyle(
                color: Colors.blue,
                decoration: TextDecoration.underline,
              ),
            ),
          ),
        ),
    ]);
  }
}
