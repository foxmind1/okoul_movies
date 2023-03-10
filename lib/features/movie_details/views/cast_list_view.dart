import 'package:flutter/material.dart';
import 'package:okoul_movie/features/movie_details/widgets/cast_card.dart';
import 'package:okoul_movie/services/api_services.dart';

class CastListView extends StatelessWidget {
  final String id;

  const CastListView({Key? key, required this.id}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Center(
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: FutureBuilder(
          future: ApiServives.getCast(id),
          builder: (BuildContext context, AsyncSnapshot snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const CircularProgressIndicator();
            } else {
              if (snapshot.data.isEmpty) {
                return const Text("No cast data");
              }
              return Row(
                children: [
                  ...snapshot.data
                      .map(
                        (cast) => CastCard(
                          cast: cast,
                        ),
                      )
                      .toList()
                ],
              );
            }
          },
        ),
      ),
    );
  }
}
