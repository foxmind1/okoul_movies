class ApiConstants {
  static String apiKey = "f1c9ebaec4e1404c138125d927dae2cb";

  static String dailyTrending =
      "https://api.themoviedb.org/3/trending/all/day?api_key=$apiKey";
  static String weeklyTrending =
      "https://api.themoviedb.org/3/trending/all/week?api_key=$apiKey";

//TODO: Pagination & add genre

  static String upcoming =
      "https://api.themoviedb.org/3/movie/upcoming?api_key=$apiKey&page=1";
  static String nowPlaying =
      "https://api.themoviedb.org/3/movie/now_playing?api_key=$apiKey&page=1";

  static String byCategory =
      "https://api.themoviedb.org/3/discover/movie?api_key=$apiKey&page=1&with_genres=";
}
