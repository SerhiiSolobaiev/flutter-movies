import 'package:flutter/material.dart';

import '../models/movie.dart';
import '../resources/movie_api_provider.dart';
import 'package:url_launcher/url_launcher.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Result movie;
  final MovieApiProvider apiProvider = MovieApiProvider();

  MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? 'No Title')),
      body: FutureBuilder<Result?>(
        future: apiProvider.getMoviesDetails(movie.id),
        builder: (context, snapshot) {
          final isLoading = snapshot.connectionState == ConnectionState.waiting;
          final movieDetails = snapshot.data ?? movie; // Use fallback data

          return SingleChildScrollView(
            padding: const EdgeInsets.all(16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(
                      left: 32.0, right: 32.0, bottom: 16.0),
                  child: Hero(
                    tag: 'moviePoster_${movie.id}',
                    child: movie.poster_path != null
                        ? Image.network(
                            'https://image.tmdb.org/t/p/w500${movie.poster_path}')
                        : const SizedBox.shrink(),
                  ),
                ),
                isLoading
                    ? const Center(child: CircularProgressIndicator())
                    : Column(
                        crossAxisAlignment: CrossAxisAlignment.start,
                        children: [
                          Text(
                            movieDetails.overview ?? 'No overview available.',
                            style: const TextStyle(fontSize: 16),
                          ),
                          const SizedBox(height: 16),
                          Text('Rating: ${movieDetails.vote_average ?? 'N/A'}'),
                          Text(
                              'Release Date: ${movieDetails.release_date ?? 'N/A'}'),
                          const SizedBox(height: 16),
                          // Extra Details
                          Text(
                              'Genres: ${movieDetails.genre_names.join(', ')}'),
                          Text('Runtime: ${movieDetails.runtime ?? 'N/A'} min'),
                          Text('Budget: \$${movieDetails.budget ?? 'N/A'}'),
                          Text('Revenue: \$${movieDetails.revenue ?? 'N/A'}'),
                          if (movieDetails.homepage != null &&
                              movieDetails.homepage!.isNotEmpty)
                            Padding(
                              padding: const EdgeInsets.only(top: 8.0),
                              child: GestureDetector(
                                onTap: () async {
                                  final url = Uri.parse(movieDetails.homepage!);
                                  if (await canLaunchUrl(url)) {
                                    await launchUrl(url,
                                        mode: LaunchMode.externalApplication);
                                  } else {
                                    // Handle error
                                    ScaffoldMessenger.of(context).showSnackBar(
                                      SnackBar(
                                          content: Text(
                                              'Could not launch ${movieDetails.homepage}')),
                                    );
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
                        ],
                      ),
              ],
            ),
          );
        },
      ),
    );
  }
}
