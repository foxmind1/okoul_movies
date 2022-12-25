import 'package:flutter/material.dart';

class GenreProvider extends ChangeNotifier {
  String currentGenre = '0';

  void setGenre(String newGenreId) {
    if (newGenreId == currentGenre) return;

    currentGenre = newGenreId;
    notifyListeners();
  }
}
