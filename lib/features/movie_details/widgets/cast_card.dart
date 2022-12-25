import 'package:flutter/material.dart';
import 'package:okoul_movie/models/cast.dart';

class CastCard extends StatelessWidget {
  final Cast cast;
  const CastCard({Key? key, required this.cast}) : super(key: key);
  @override
  Widget build(BuildContext context) => Padding(
        padding: const EdgeInsets.only(right: 16.0),
        child: Column(
          children: [
            ClipRRect(
              borderRadius: BorderRadius.circular(20),
              child: cast.profilePath != null
                  ? FadeInImage(
                      image: NetworkImage(cast.profilePath!),
                      placeholder: const AssetImage(
                          'assets/images/image-placeholder.png'),
                      fit: BoxFit.fitHeight,
                      height: 200,
                    )
                  : Image.asset(
                      'assets/images/image-placeholder.png',
                      fit: BoxFit.fill,
                    ),
            ),
            const SizedBox(height: 8),
            Text(cast.name!),
            Text(
              cast.character!.length > 24
                  ? '${cast.character!.substring(0, 24)}..'
                  : cast.character!,
              style: const TextStyle(
                color: Colors.grey,
                fontSize: 10,
              ),
            ),
          ],
        ),
      );
}
