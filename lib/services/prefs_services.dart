import 'dart:convert';

import 'package:okoul_movie/core/constants/prefs_constants.dart';
import 'package:okoul_movie/models/movie.dart';
import 'package:shared_preferences/shared_preferences.dart';

class PrefsServices {
  static late SharedPreferences _preferences;

  void initPrefs() async {
    _preferences = await SharedPreferences.getInstance();
  }

  static void addToFavorites(Movie movie) {
    var currentFavorites = _getPrefsFavorites();

    currentFavorites.add(json.encode(movie.toJson()));
    _preferences.setStringList(PrefsConstants.favoritesKey, currentFavorites);
  }

  static void removeFromFavorites(Movie movie) {
    var currentFavorites = _getPrefsFavorites();

    currentFavorites.remove(json.encode(movie.toJson()));
    _preferences.setStringList(PrefsConstants.favoritesKey, currentFavorites);
  }

  static List<String> _getPrefsFavorites() {
    return _preferences.getStringList(PrefsConstants.favoritesKey) ?? [];
  }

  static List<Movie> getFavorites() {
    var favorites =
        _getPrefsFavorites().map((item) => json.decode(item)).toList();
    favorites = favorites.map((item) => Movie.fromJson(item)).toList();

    return favorites as List<Movie>;
  }
}
