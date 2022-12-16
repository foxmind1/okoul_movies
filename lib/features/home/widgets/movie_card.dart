import 'package:flutter/material.dart';
import 'package:okoul_movie/models/movie.dart';

class MovieCard extends StatelessWidget {
  final Movie movie;

  const MovieCard({Key? key, required this.movie}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(right: 16.0),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(20),
        child: Image.network(
          movie.posterLink!,
          fit: BoxFit.fitHeight,
          height: 250,
        ),
      ),
    );
  }
}
