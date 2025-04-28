import 'package:flutter/material.dart';
import 'package:flutter_onboarding/models/item_model.dart';

class MovieDetailsScreen extends StatelessWidget {
  final Result movie;

  const MovieDetailsScreen({super.key, required this.movie});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: Text(movie.title ?? 'No Title')),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            Padding(
              padding:
                  const EdgeInsets.only(left: 32.0, right: 32.0, bottom: 16.0),
              child: Hero(
                tag: 'moviePoster_${movie.id}',
                child: movie.poster_path != null
                    ? Image.network(
                        'https://image.tmdb.org/t/p/w500${movie.poster_path}')
                    : const SizedBox.shrink(),
              ),
            ),
            Text(
              movie.overview ?? 'No overview available.',
              style: const TextStyle(fontSize: 16),
            ),
            Text(
              movie.overview ?? 'No overview available.',
              style: const TextStyle(fontSize: 16),
            ),
            const SizedBox(height: 16),
            Text('Rating: ${movie.vote_average}'),
            Text('Release Date: ${movie.release_date}'),
          ],
        ),
      ),
    );
  }
}
