import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:okoul_movie/core/constants/api_constants.dart';
import 'package:okoul_movie/models/cast.dart';
import 'package:okoul_movie/models/movie.dart';

class ApiServives {
  static Future<List<Movie>> getDailyTrending() async {
    final response = await http.get(
      Uri.parse(ApiConstants.dailyTrending),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  static Future<List<Movie>> getPlayingNow(String genre) async {
    genre = genre == '0' ? '' : '&with_genres=$genre';
    final response = await http.get(
      Uri.parse("${ApiConstants.nowPlaying}$genre"),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  static Future<List<Movie>> getUpcoming(String genre) async {
    genre = genre == '0' ? '' : '&with_genres=$genre';
    final response = await http.get(
      Uri.parse("${ApiConstants.upcoming}$genre"),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  static Future<List<Cast>> getCast(id) async {
    var url =
        '${ApiConstants.cast.substring(0, 35)}$id${ApiConstants.cast.substring(35)}';

    final response = await http.get(
      Uri.parse(url),
    );

    return (jsonDecode(response.body)['cast'] as List)
        .map((cast) => Cast.fromJson(cast))
        .toList();
  }
}
