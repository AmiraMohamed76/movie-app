class ApiConstance {

  static const baseUrl = 'https://api.themoviedb.org/3';
  static const apiKey = '2e7fea16d2f1e209feef71dfc8d20ad9';

  /// Movie
  static const String nowPlayingMoviesPath = "$baseUrl/movie/now_playing?api_key=$apiKey";
  static const String popularMoviesPath = "$baseUrl/movie/popular?api_key=$apiKey";
  static const String topRatedMoviesPath = "$baseUrl/movie/top_rated?api_key=$apiKey";
  static  String movieDetailsPath(int movieId) => "$baseUrl/movie/$movieId?api_key=$apiKey";
  static  String movieRecommendationsPath(int movieId) => "$baseUrl/movie/$movieId/recommendations?api_key=$apiKey";

  /// Tv
  static const String onAirSeriesPath = "$baseUrl/tv/on_the_air?api_key=$apiKey";
  static const String popularSeriesPath = "$baseUrl/tv/popular?api_key=$apiKey";
  static const String topRatedSeriesPath = "$baseUrl/tv/top_rated?api_key=$apiKey";
  static  String seriesDetailsPath(int seriesId) => "$baseUrl/tv/$seriesId?api_key=$apiKey";
  static  String seriesRecommendationsPath(int seriesId) => "$baseUrl/tv/$seriesId/recommendations?api_key=$apiKey";


  /// Image
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';
  static String imageUrl(String imagePath) => "$baseImageUrl$imagePath";

}