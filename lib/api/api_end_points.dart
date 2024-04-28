import 'package:netflix_app_clone/api/api_key.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';

class ApiEndPoints {
  static const popularMovies =
      "$kBaseUrl/movie/popular?api_key=${ApiKey.apiKey}";
  static const trendingMovies =
      "$kBaseUrl/trending/movie/day?api_key=${ApiKey.apiKey}";
  static const pastYearMovies =
      "$kBaseUrl/discover/movie?api_key=${ApiKey.apiKey}";
  static const upComingMovies =
      "$kBaseUrl/movie/upcoming?api_key=${ApiKey.apiKey}";
  static const topRatedSeries =
      '$kBaseUrl/tv/top_rated?api_key=${ApiKey.apiKey}';
  static const popularSeries = '$kBaseUrl/tv/popular?api_key=${ApiKey.apiKey}';
  static const airingTodaySeries =
      '$kBaseUrl/tv/airing_today?api_key=${ApiKey.apiKey}';
}
