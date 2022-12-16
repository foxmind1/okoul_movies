import 'package:flutter/material.dart';
import 'package:okoul_movie/features/home/enums/movie_list_type.dart';
import 'package:okoul_movie/features/home/widgets/movie_card.dart';
import 'package:okoul_movie/models/movie.dart';
import 'package:okoul_movie/services/api_services.dart';

class MovieListView extends StatelessWidget {
  final MovieListType movieListType;

  const MovieListView({Key? key, required this.movieListType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Movie>> future;
    if (movieListType == MovieListType.trendingNow) {
      future = ApiServives.getDailyTrending();
    } else if (movieListType == MovieListType.playingNow) {
      future = ApiServives.getPlayingNow();
    } else {
      future = ApiServives.getUpcoming();
    }
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: FutureBuilder(
        future: future,
        builder: (BuildContext context, AsyncSnapshot snapshot) {
          return Row(
            children: [
              ...snapshot.data
                  .map(
                    (movie) => MovieCard(
                      movie: movie,
                    ),
                  )
                  .toList()
            ],
          );
        },
      ),
    );
  }
}
