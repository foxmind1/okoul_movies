import 'package:flutter/material.dart';
import 'package:okoul_movie/features/home/enums/movie_list_type.dart';
import 'package:okoul_movie/features/home/widgets/movie_card.dart';
import 'package:okoul_movie/features/movie_categories/providers/genre_provider.dart';
import 'package:okoul_movie/models/movie.dart';
import 'package:okoul_movie/services/api_services.dart';
import 'package:provider/provider.dart';

class MovieListView extends StatelessWidget {
  final MovieListType movieListType;

  const MovieListView({Key? key, required this.movieListType})
      : super(key: key);

  @override
  Widget build(BuildContext context) {
    Future<List<Movie>> future;
    var genreId = Provider.of<GenreProvider>(context).currentGenre;
    if (movieListType == MovieListType.trendingNow) {
      future = ApiServives.getDailyTrending();
    } else if (movieListType == MovieListType.playingNow) {
      future = ApiServives.getPlayingNow(genreId);
    } else {
      future = ApiServives.getUpcoming(genreId);
    }
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: future,
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            }
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
      ),
    );
  }
}
