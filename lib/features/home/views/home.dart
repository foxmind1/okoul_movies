import 'package:flutter/material.dart';
import 'package:okoul_movie/features/favorite_movies/views/favorites.dart';
import 'package:okoul_movie/features/home/enums/movie_list_type.dart';
import 'package:okoul_movie/features/home/views/movie_list_view.dart';
import 'package:okoul_movie/features/home/widgets/category_view_more_button.dart';
import 'package:okoul_movie/features/movie_categories/widgets/genres_choice_chip.dart';

class HomePage extends StatelessWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Padding(
          padding: const EdgeInsets.only(left: 16.0, bottom: 16.0),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Padding(
                padding: const EdgeInsets.only(right: 16.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    const Text("Movies", style: TextStyle(fontSize: 40)),
                    Row(
                      children: [
                        const Icon(Icons.search),
                        const SizedBox(width: 16),
                        IconButton(
                          icon: const Icon(Icons.favorite),
                          onPressed: () => Navigator.of(context).push(
                            MaterialPageRoute(
                              builder: (context) => const FavoritesPage(),
                            ),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
              ),
              const SizedBox(height: 16),
              const GenresChoiceChips(),
              const SizedBox(height: 16),
              const CategoryViewMoreButton(text: "Trending now"),
              const SizedBox(height: 16),
              const MovieListView(movieListType: MovieListType.trendingNow),
              const SizedBox(height: 16),
              const CategoryViewMoreButton(text: "Playing now"),
              const SizedBox(height: 16),
              const MovieListView(movieListType: MovieListType.playingNow),
              const SizedBox(height: 16),
              const CategoryViewMoreButton(text: "Upcoming"),
              const SizedBox(height: 16),
              const MovieListView(movieListType: MovieListType.upcoming),
            ],
          ),
        ),
      ),
    );
  }
}
