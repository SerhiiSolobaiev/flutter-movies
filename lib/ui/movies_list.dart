import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/movie_results.dart';

import '../resources/movie_api_provider.dart';
import 'movie_details.dart';

class MyHomePage extends StatefulWidget {
  const MyHomePage({super.key});

  @override
  State<MyHomePage> createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  final MovieApiProvider apiProvider = MovieApiProvider();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Popular Movies'),
      ),
      body: FutureBuilder<ItemModel?>(
        future: apiProvider.getMoviesList(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(child: CircularProgressIndicator());
          } else if (snapshot.hasError) {
            return Center(child: Text('Error: ${snapshot.error}'));
          } else if (!snapshot.hasData || snapshot.data == null) {
            return const Center(child: Text('No data'));
          } else {
            final movies = snapshot.data!.results;
            print("LOOOL movies=${movies.map((it) => it.title).toList()}");
            return ListView.builder(
              itemCount: movies.length,
              itemBuilder: (context, index) {
                final movie = movies[index];
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
              },
            );
          }
        },
      ),
    );
  }
}
