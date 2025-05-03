import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/movie_results.dart';
import 'package:flutter_onboarding/repository/movies_repository.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../bloc/movies_list_bloc.dart';
import '../di/di.dart';
import '../resources/movie_api_provider.dart';
import 'movie_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MovieApiProvider apiProvider = MovieApiProvider();
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
                    tag: 'moviePoster_${movie.id}',
                    flightShuttleBuilder: (flightContext, animation,
                        flightDirection, fromHeroContext, toHeroContext) {
                      return RotationTransition(
                        turns: animation.drive(Tween(begin: 0.0, end: 1.0)),
                        // 1.0 = full rotation (360°)
                        child: toHeroContext.widget,
                      );
                    },
                    child: movie.poster_path != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.poster_path}',
                            width: 48)
                        : const SizedBox(width: 48),
                  ),
                  title: Hero(
                      tag: 'moviePoster_${movie.title}',
                      child: Text(movie.title ?? 'No Title')),
                  subtitle: Row(children: [
                    Text('Rating: ${movie.vote_average}'),
                    const SizedBox(width: 8),
                    Text('Year: ${movie.release_date?.split('-').first}')
                  ]),
                  onTap: () {
                    Navigator.push(
                      context,
                      MaterialPageRoute(
                        builder: (context) => MovieDetailsScreen(movie: movie),
                      ),
                    );
                  },
                );
              });
        }
      },
    );
  }
}
