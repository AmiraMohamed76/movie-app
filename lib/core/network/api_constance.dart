import 'env_config.dart';

class ApiConstance {
  static const baseUrl = 'https://api.themoviedb.org/3';

  /// Movie
  static final String nowPlayingMoviesPath =
      "$baseUrl/movie/now_playing?api_key=${EnvConfig.apiKey}";

  static final String popularMoviesPath =
      "$baseUrl/movie/popular?api_key=${EnvConfig.apiKey}";

  static final String topRatedMoviesPath =
      "$baseUrl/movie/top_rated?api_key=${EnvConfig.apiKey}";

  static String movieDetailsPath(int movieId) =>
      "$baseUrl/movie/$movieId?api_key=${EnvConfig.apiKey}";

  static String movieRecommendationsPath(int movieId) =>
      "$baseUrl/movie/$movieId/recommendations?api_key=${EnvConfig.apiKey}";

  /// Tv
  static final String onAirSeriesPath =
      "$baseUrl/tv/on_the_air?api_key=${EnvConfig.apiKey}";
  static final String popularSeriesPath =
      "$baseUrl/tv/popular?api_key=${EnvConfig.apiKey}";
  static final String topRatedSeriesPath =
      "$baseUrl/tv/top_rated?api_key=${EnvConfig.apiKey}";

  static String seriesDetailsPath(int seriesId) =>
      "$baseUrl/tv/$seriesId?api_key=${EnvConfig.apiKey}";

  static String seriesRecommendationsPath(int seriesId) =>
      "$baseUrl/tv/$seriesId/recommendations?api_key=${EnvConfig.apiKey}";

  static String seriesSeasonEpisodes(int seriesId, int seasonNumber) =>
      "$baseUrl/tv/$seriesId/season/$seasonNumber?api_key=${EnvConfig.apiKey}";

  /// Image
  static const baseImageUrl = 'https://image.tmdb.org/t/p/w500';

  static String imageUrl(String imagePath) => "$baseImageUrl$imagePath";
}
