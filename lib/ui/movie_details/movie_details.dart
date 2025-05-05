import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:flutter_bloc/flutter_bloc.dart';
import '../../di/di.dart';
import '../../models/movie.dart';
import 'movie_details_bloc.dart';

import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatefulWidget {
  final Movie movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  State<MovieDetailsScreen> createState() => _MovieDetailsScreenState();
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  late final MovieDetailsBloc _bloc;

  @override
  void initState() {
    super.initState();
    _bloc = getIt<MovieDetailsBloc>(param1: widget.movie);
    _bloc.add(MovieDetailsInitialEvent(widget.movie));
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocListener<MovieDetailsBloc, MovieDetailsState>(
        listener: (context, state) {
          if (state is MovieDetailsError) {
            ScaffoldMessenger.of(context).showSnackBar(
              SnackBar(content: Text("Cannot load movie details")),
            );
          }
        },
        child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            return Scaffold(
              appBar: AppBar(
                title: Text(widget.movie.title ?? ""),
              ),
              body: buildMovieDetails(state),
            );
          },
        ),
      ),
    );
  }

  Widget buildMovieDetails(MovieDetailsState state) {
    print("LOOOL buildMovieDetails state=${state.movie}, ${state.isLoading}");
    final isLoading = state.isLoading;
    final movieDetails = state.movie;
    final isError = state is MovieDetailsError;

    return SingleChildScrollView(
      padding: const EdgeInsets.all(16.0),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          Padding(
            padding:
                const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
            child: Hero(
              tag: 'movieImage_${movieDetails.id}',
              child: movieDetails.posterPath != null
                  ? CachedNetworkImage(
                      imageUrl:
                          'https://image.tmdb.org/t/p/w500${movieDetails.posterPath}',
                    )
                  : const SizedBox.shrink(),
            ),
          ),
          Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                movieDetails.overview ?? '',
                style: const TextStyle(fontSize: 16),
              ),
              const SizedBox(height: 16),
              Text('Rating: ${movieDetails.voteAverage}'),
              Text('Release Date: ${movieDetails.releaseDate}'),
              const SizedBox(height: 16),

              // Loaded Movie Details:
              isError
                  ? const SizedBox(height: 16)
                  : isLoading
                      ? const Center(child: CircularProgressIndicator())
                      : buildLoadedMovieDetails(movieDetails)
            ],
          ),
        ],
      ),
    );
  }

  Column buildLoadedMovieDetails(Movie movieDetails) {
    return Column(crossAxisAlignment: CrossAxisAlignment.start, children: [
      Text('Genres: ${movieDetails.genreNames.join(', ')}'),
      if (movieDetails.budget != null && movieDetails.budget != 0)
        Text('Budget: \$${(movieDetails.budget! / 1000000).round()}M'),
      if (movieDetails.revenue != null && movieDetails.revenue != 0)
        Text('Revenue: \$${(movieDetails.revenue! / 1000000).round()}M'),
      if (movieDetails.homepage != null && movieDetails.homepage!.isNotEmpty)
        Padding(
          padding: const EdgeInsets.only(top: 8.0),
          child: GestureDetector(
            onTap: () async {
              final url = Uri.parse(movieDetails.homepage!);
              if (await canLaunchUrl(url)) {
                await launchUrl(url);
              }
            },
            child: Text(
              'Homepage: ${movieDetails.homepage}',
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
