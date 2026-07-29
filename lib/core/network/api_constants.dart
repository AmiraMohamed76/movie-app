class ApiConstants {

  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '2e7fea16d2f1e209feef71dfc8d20ad9';

  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl//movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";

}