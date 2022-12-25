import 'package:flutter/material.dart';
import 'package:okoul_movie/features/favorite_movies/providers/favorite_movies_provider.dart';
import 'package:okoul_movie/features/movie_details/views/cast_list_view.dart';
import 'package:okoul_movie/models/movie.dart';
import 'package:provider/provider.dart';

class MovieDetailsPage extends StatelessWidget {
  final Movie movie;
  const MovieDetailsPage({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      extendBodyBehindAppBar: true,
      appBar: AppBar(
        backgroundColor: Colors.transparent,
        actions: [
          Consumer<FavoriteMovieProvider>(
            builder: (context, controler, _) {
              return IconButton(
                onPressed: () {
                  controler.toggleFavorite(movie);
                },
                icon: controler.isFavorite(movie)
                    ? const Icon(Icons.favorite)
                    : const Icon(Icons.favorite_outline),
              );
            },
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            Opacity(
              opacity: 0.3,
              child: movie.backdropLink != null
                  ? FadeInImage(
                      image: NetworkImage(movie.backdropLink!),
                      placeholder: const AssetImage(
                          'assets/images/image-placeholder.png'),
                      fit: BoxFit.fill,
                    )
                  : Image.asset(
                      'assets/images/image-placeholder.png',
                      fit: BoxFit.fill,
                    ),
            ),
            Padding(
              padding: const EdgeInsets.symmetric(
                horizontal: 8.0,
                vertical: 16.0,
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Text(
                    movie.name!,
                    style: const TextStyle(
                      fontSize: 20,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 8),
                  Row(
                    crossAxisAlignment: CrossAxisAlignment.center,
                    children: [
                      const Icon(
                        Icons.star_rate,
                        color: Colors.yellow,
                      ),
                      const SizedBox(width: 4),
                      Text(
                        movie.rating!,
                        style: const TextStyle(
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                      const Text("/10"),
                      Text(
                        ' - ${movie.numOfReviews} Reviews',
                        style: const TextStyle(
                          fontSize: 12,
                        ),
                      ),
                    ],
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  Text(
                    movie.description!,
                    textAlign: TextAlign.justify,
                  ),
                  const Divider(),
                  const SizedBox(height: 8),
                  const Text(
                    "Cast",
                    style: TextStyle(
                      fontSize: 18,
                      fontWeight: FontWeight.bold,
                    ),
                  ),
                  const SizedBox(height: 16),
                  CastListView(id: movie.id!),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
