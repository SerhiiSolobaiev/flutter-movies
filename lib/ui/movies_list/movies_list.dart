import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/di.dart';
import 'movies_list_bloc.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final _bloc = getIt<MoviesListBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(MoviesInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<MoviesListBloc, MoviesListState>(
          builder: (context, state) {
        return Scaffold(
            appBar: AppBar(
              title: const Text('Popular Movies'),
            ),
            body: buildMoviesList(state));
      }),
    );
  }

  Widget buildMoviesList(MoviesListState state) {
    return Builder(
      builder: (context) {
        if (state.isLoading) {
          return const Center(child: CircularProgressIndicator());
        } else if (state.movies.isEmpty) {
          return const Center(child: Text('No data'));
        } else {
          return ListView.builder(
              itemCount: state.movies.length,
              itemBuilder: (context, index) {
                final movie = state.movies[index];
                return ListTile(
                  leading: Hero(
                    tag: 'movieImage_${movie.id}',
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
                      return RotationTransition(
                        turns: animation.drive(Tween(begin: 0.0, end: 1.0)),
                        child: toHeroContext.widget,
                      );
                    },
                    child: movie.posterPath != null
                        ? CachedNetworkImage(
                            imageUrl:
                                'https://image.tmdb.org/t/p/w500${movie.posterPath}',
                            width: 48,
                          )
                        : const SizedBox(width: 48),
                  ),
                  title: Text(movie.title ?? 'No Title'),
                  subtitle: Row(children: [
                    Text('Rating: ${movie.voteAverage}'),
                    const SizedBox(width: 8),
                    Text('Year: ${movie.releaseDate?.split('-').first}')
                  ]),
                  onTap: () {
                    _bloc.add(MovieClickedEvent(context, movie));
                  },
                );
              });
        }
      },
    );
  }
}
