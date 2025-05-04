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

  // @override
  // Widget build(BuildContext context) {
  //   // TODO: implement build
  //   throw UnimplementedError();
  // }

  // @override
  // Widget build(BuildContext context) {
  //   return Scaffold(
  //     appBar: AppBar(title: Text(movie.title ?? '')),
  //     body: FutureBuilder<Movie?>(
  //       future: apiProvider.getMoviesDetails(movie.id),
  //       builder: (context, snapshot) {
  //         final isLoading = snapshot.connectionState == ConnectionState.waiting;
  //         final movieDetails = snapshot.data ?? movie; // Use fallback data
  //
  //         return SingleChildScrollView(
  //           padding: const EdgeInsets.all(16.0),
  //           child: Column(
  //             crossAxisAlignment: CrossAxisAlignment.start,
  //             children: [
  //               Padding(
  //                 padding: const EdgeInsets.only(
  //                     left: 32.0, right: 32.0, bottom: 16.0),
  //                 child: Hero(
  //                   tag: 'movieImage_${movie.id}',
  //                   child: movie.posterPath != null
  //                       ? CachedNetworkImage(
  //                           imageUrl:
  //                               'https://image.tmdb.org/t/p/w500${movie.posterPath}',
  //                         )
  //                       : const SizedBox.shrink(),
  //                 ),
  //               ),
  //               isLoading
  //                   ? const Center(child: CircularProgressIndicator())
  //                   : Column(
  //                       crossAxisAlignment: CrossAxisAlignment.start,
  //                       children: [
  //                         Text(
  //                           movieDetails.overview ?? '',
  //                           style: const TextStyle(fontSize: 16),
  //                         ),
  //                         const SizedBox(height: 16),
  //                         Text('Rating: ${movieDetails.voteAverage}'),
  //                         Text('Release Date: ${movieDetails.releaseDate}'),
  //                         const SizedBox(height: 16),
  //                         // Extra Details
  //                         Text('Genres: ${movieDetails.genreNames.join(', ')}'),
  //                         if (movieDetails.budget != null && movieDetails.budget != 0)
  //                           Text('Budget: \$${movieDetails.budget}'),
  //                         if (movieDetails.revenue != null && movieDetails.revenue != 0)
  //                           Text('Revenue: \$${movieDetails.revenue}'),
  //                         if (movieDetails.homepage != null &&
  //                             movieDetails.homepage!.isNotEmpty)
  //                           Padding(
  //                             padding: const EdgeInsets.only(top: 8.0),
  //                             child: GestureDetector(
  //                               onTap: () async {
  //                                 final url = Uri.parse(movieDetails.homepage!);
  //                                 if (await canLaunchUrl(url)) {
  //                                   await launchUrl(url,
  //                                       mode: LaunchMode.externalApplication);
  //                                 } else {
  //                                   // Handle error
  //                                   ScaffoldMessenger.of(context).showSnackBar(
  //                                     SnackBar(
  //                                         content: Text(
  //                                             'Could not launch ${movieDetails.homepage}')),
  //                                   );
  //                                 }
  //                               },
  //                               child: Text(
  //                                 'Homepage: ${movieDetails.homepage}',
  //                                 style: const TextStyle(
  //                                   color: Colors.blue,
  //                                   decoration: TextDecoration.underline,
  //                                 ),
  //                               ),
  //                             ),
  //                           ),
  //                       ],
  //                     ),
  //             ],
  //           ),
  //         );
  //       },
  //     ),
  //   );
  // }
}

class _MovieDetailsScreenState extends State<MovieDetailsScreen> {
  final _bloc = getIt<MovieDetailsBloc>();

  @override
  void initState() {
    super.initState();
    _bloc.add(MovieDetailsInitialEvent());
  }

  @override
  Widget build(BuildContext context) {
    return BlocProvider(
      create: (context) => _bloc,
      child: BlocBuilder<MovieDetailsBloc, MovieDetailsState>(
          builder: (context, state) {
            return Scaffold(
                appBar: AppBar(
                  title: const Text('Popular Movies'),
                ),
                body: buildMoviesList(state));
          }),
    );
  }

  Widget buildMoviesList(MovieDetailsState state) {
    return Text("data=${state.movie?.title}");
  }
}