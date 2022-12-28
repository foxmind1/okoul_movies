class ApiConstants {
  static String apiKey = "f1c9ebaec4e1404c138125d927dae2cb";

  static String dailyTrending =
      "https://api.themoviedb.org/3/trending/movie/day?api_key=$apiKey";
  static String weeklyTrending =
      "https://api.themoviedb.org/3/trending/movie/week?api_key=$apiKey";

  static String upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey";
  static String nowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey";

  static String cast =
      "https://api.themoviedb.org/3/movie//credits?api_key=$apiKey";
}
