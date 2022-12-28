import 'package:flutter/material.dart';
import 'package:okoul_movie/features/home/enums/movie_list_type.dart';
import 'package:okoul_movie/features/movie_categories/views/movie_category_gridview.dart';

class MovieCategory extends StatelessWidget {
  final MovieListType movieListType;

  const MovieCategory({Key? key, required this.movieListType})
      : super(key: key);
  @override
  Widget build(BuildContext context) {
    String title;
    if (movieListType == MovieListType.trendingNow) {
      title = "Trending now";
    } else if (movieListType == MovieListType.playingNow) {
      title = "Playing now";
    } else {
      title = "Upcoming";
    }

    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: Padding(
        padding: const EdgeInsets.only(right: 16.0, top: 16.0, left: 16.0),
        child: MovieCategoryGridview(
          movieListType: movieListType,
        ),
      ),
    );
  }
}
