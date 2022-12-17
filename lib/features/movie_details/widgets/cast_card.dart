import 'package:flutter/material.dart';
import 'package:okoul_movie/models/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  //TODO: add names...
  const CastCard({Key? key, required this.cast}) : super(key: key);

  @override
  Widget build(BuildContext context) => cast.profilePath != ''
      ? Padding(
          padding: const EdgeInsets.only(right: 16.0),
          child: ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: Image.network(
                cast.profilePath!,
                fit: BoxFit.fitHeight,
                height: 200,
              )),
        )
      : const SizedBox.shrink();
}
