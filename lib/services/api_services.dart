import 'dart:convert';

import 'package:http/http.dart' as http;
import 'package:okoul_movie/core/constants/api_constants.dart';
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

  static Future<List<Movie>> getWeeklyTrending() async {
    final response = await http.get(
      Uri.parse(ApiConstants.weeklyTrending),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  static Future<List<Movie>> getPlayingNow() async {
    final response = await http.get(
      Uri.parse(ApiConstants.nowPlaying),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }

  static Future<List<Movie>> getUpcoming() async {
    final response = await http.get(
      Uri.parse(ApiConstants.upcoming),
    );

    return (jsonDecode(response.body)['results'] as List)
        .map((movie) => Movie.fromJson(movie))
        .toList();
  }
}
