import 'package:flutter/material.dart';
import 'package:okoul_movie/features/home/enums/movie_list_type.dart';
import 'package:okoul_movie/features/movie_categories/views/movie_category.dart';

class CategoryViewMoreButton extends StatelessWidget {
  final String text;
  const CategoryViewMoreButton({Key? key, required this.text})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    MovieListType listType;
    if (text.contains("Trending")) {
      listType = MovieListType.trendingNow;
    } else if (text.contains('Playing')) {
      listType = MovieListType.playingNow;
    } else {
      listType = MovieListType.upcoming;
    }

    return GestureDetector(
      onTap: () {
        Navigator.of(context).push(
          MaterialPageRoute(
            builder: (context) => MovieCategory(movieListType: listType),
          ),
        );
      },
      child: Row(
        children: [
          Text(
            text,
            style: const TextStyle(fontSize: 26),
          ),
          const SizedBox(width: 2),
          const Icon(Icons.navigate_next),
        ],
      ),
    );
  }
}
