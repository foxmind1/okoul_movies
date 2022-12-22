import 'package:flutter/material.dart';

class GenresDropdown extends StatefulWidget {
  const GenresDropdown({Key? key}) : super(key: key);

  @override
  State<GenresDropdown> createState() => _GenresDropdownState();
}

var genres = [
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

String dropdownValue = 'All';

class _GenresDropdownState extends State<GenresDropdown> {
  @override
  Widget build(BuildContext context) {
    return DropdownButton(
      isExpanded: true,
      items: genres
          .map(
            (genre) => DropdownMenuItem(
              value: genre,
              child: Text(genre),
            ),
          )
          .toList(),
      value: dropdownValue,
      onChanged: (value) {
        setState(() {
          dropdownValue = value!;
        });
      },
    );
  }
}
