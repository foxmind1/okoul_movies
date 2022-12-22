import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:okoul_movie/models/movie.dart';

class FavoriteMovieProvider extends ChangeNotifier {
  final List<Movie> _favoriteMovies = [];

  UnmodifiableListView<Movie> get favoriteMovies =>
      UnmodifiableListView(_favoriteMovies);

  void toggleFavorite(Movie movie) {
    if (!isFavorite(movie)) {
      _add(movie);
    } else {
      _remove(movie);
    }
  }

  void _add(Movie movie) {
    _favoriteMovies.add(movie);
    debugPrint('Add called: $_favoriteMovies');
    notifyListeners();
  }

  void _remove(Movie movie) {
    _favoriteMovies.removeWhere((element) => element.id == movie.id);
    debugPrint('Remove called: $_favoriteMovies');
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favoriteMovies.any((element) => element.id == movie.id);
  }
}
