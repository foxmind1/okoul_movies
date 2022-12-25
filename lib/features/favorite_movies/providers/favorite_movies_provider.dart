import 'dart:collection';

import 'package:flutter/material.dart';
import 'package:okoul_movie/models/movie.dart';
import 'package:okoul_movie/services/prefs_services.dart';

class FavoriteMovieProvider extends ChangeNotifier {
  final List<Movie> _favoriteMovies = PrefsServices.getFavorites();

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
    PrefsServices.addToFavorites(movie);
    notifyListeners();
  }

  void _remove(Movie movie) {
    _favoriteMovies.removeWhere((element) => element.id == movie.id);
    PrefsServices.removeFromFavorites(movie);
    notifyListeners();
  }

  bool isFavorite(Movie movie) {
    return _favoriteMovies.any((element) => element.id == movie.id);
  }
}
