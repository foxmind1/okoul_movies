import 'package:flutter/material.dart';
import 'package:okoul_movie/features/movie_details/views/movie_details.dart';
import 'package:okoul_movie/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: GestureDetector(
        child: ClipRRect(
          borderRadius: BorderRadius.circular(20),
          child: movie.posterLink != null
              ? FadeInImage(
                  image: NetworkImage(movie.posterLink!),
                  placeholder:
                      const AssetImage('assets/images/image-placeholder.png'),
                  fit: BoxFit.fitHeight,
                  height: 225,
                )
              : Image.asset(
                  'assets/images/image-placeholder.png',
                  fit: BoxFit.fitHeight,
                  height: 225,
                ),
        ),
        onTap: () {
          Navigator.of(context).push(
            MaterialPageRoute(
              builder: (context) => MovieDetailsPage(movie: movie),
            ),
          );
        },
      ),
    );
  }
}
