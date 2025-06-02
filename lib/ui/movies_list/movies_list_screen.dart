part of movies_screen;

class MoviesListScreen extends StatefulWidget {
  const MoviesListScreen({super.key});

  @override
  State<MoviesListScreen> createState() => _MoviesListScreenState();
}

class _MoviesListScreenState extends State<MoviesListScreen> {
  final _bloc = getIt<_MoviesListBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(_LoadMoviesEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<_MoviesListBloc, _MoviesListState>(builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: Text(state.title),
            ),
            body: _buildMoviesList(state));
      }),
    );
  }

  Widget _buildMoviesList(_MoviesListState state) {
    return Builder(
      builder: (context) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.movies.isEmpty) {
          return Center(child: Text(LocaleKeys.error.tr()));
        } else {
          return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  leading: Hero(
                      tag: 'movieImage_${movie.id}',
                      flightShuttleBuilder:
                          (flightContext, animation, flightDirection, fromHeroContext, toHeroContext) {
                        return RotationTransition(
                          turns: animation.drive(Tween(begin: 0.0, end: 1.0)),
                          child: toHeroContext.widget,
                        );
                      },
                      child: CachedNetworkImage(
                        imageUrl: movie.imageUrl,
                        width: 48,
                      )),
                  title: Text(movie.title),
                  subtitle: Row(children: [
                    Text('${LocaleKeys.movie_details_rating.tr()}: ${movie.voteAverage}'),
                    const SizedBox(width: 8),
                    Text('${LocaleKeys.movie_details_year.tr()}: ${movie.releaseDate}')
                  ]),
                  onTap: () {
                    _bloc.add(_MovieClickedEvent(context, movie));
                  },
                );
              });
        }
      },
    );
  }
}
