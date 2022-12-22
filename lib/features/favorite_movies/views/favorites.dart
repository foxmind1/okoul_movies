import 'package:flutter/material.dart';
import 'package:okoul_movie/features/favorite_movies/providers/favorite_movies_provider.dart';
import 'package:okoul_movie/features/home/widgets/movie_card.dart';
import 'package:provider/provider.dart';

class FavoritesPage extends StatelessWidget {
  const FavoritesPage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const Text(
              "Favorites",
              style: TextStyle(fontSize: 40),
            ),
            const SizedBox(height: 16),
            Consumer<FavoriteMovieProvider>(
              builder: (context, controller, _) {
                if (controller.favoriteMovies.isNotEmpty) {
                  return Expanded(
                    child: GridView.builder(
                      gridDelegate:
                          const SliverGridDelegateWithFixedCrossAxisCount(
                        crossAxisCount: 2,
                        mainAxisSpacing: 16,
                        childAspectRatio: 3 / 4,
                      ),
                      itemCount: controller.favoriteMovies.length,
                      itemBuilder: (context, index) {
                        return MovieCard(
                          movie: controller.favoriteMovies[index],
                        );
                      },
                    ),
                  );
                } else {
                  return const Expanded(
                    child: Center(
                      child: Text(
                        "Add a movie to your favorites to show up here",
                      ),
                    ),
                  );
                }
              },
            ),
          ],
        ),
      ),
    );
  }
}
