import 'package:flutter/material.dart';
import 'package:okoul_movie/features/movie_categories/providers/genre_provider.dart';
import 'package:provider/provider.dart';

class GenresChoiceChips extends StatefulWidget {
  const GenresChoiceChips({Key? key}) : super(key: key);

  @override
  State<GenresChoiceChips> createState() => _GenresChoiceChipsState();
}

var _genres = [
  "All",
  "Action",
  "Adventure",
  "Animation",
  "Comedy",
  "Crime",
  "Documentary",
  "Drama",
  "Family",
  "Fantasy",
  "History",
  "Horror",
  "Music",
  "Mystery",
  "Romance",
  "Science Fiction",
  "Thriller",
  "War",
  "Western"
];

List _genreId = [
  0,
  28,
  12,
  16,
  35,
  80,
  99,
  18,
  10751,
  14,
  36,
  27,
  10402,
  9648,
  10749,
  878,
  53,
  10752,
  37,
];

var selectedIndex = 0;

class _GenresChoiceChipsState extends State<GenresChoiceChips> {
  @override
  Widget build(BuildContext context) {
    return SingleChildScrollView(
      scrollDirection: Axis.horizontal,
      child: Row(
        children: [
          ..._genres.map(
            (genre) {
              return Padding(
                padding: const EdgeInsets.only(right: 8),
                child: ChoiceChip(
                  label: Text(genre),
                  selected: _genres.indexOf(genre) == selectedIndex,
                  onSelected: (selected) {
                    setState(
                      () {
                        selectedIndex = _genres.indexOf(genre);
                      },
                    );
                    context
                        .read<GenreProvider>()
                        .setGenre(_genreId[selectedIndex].toString());
                  },
                ),
              );
            },
          ).toList(),
        ],
      ),
    );
  }
}
