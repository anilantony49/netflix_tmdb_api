import 'dart:convert';

import 'package:netflix_app_clone/api/api_end_points.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:http/http.dart' as http;
import 'package:netflix_app_clone/models/series.dart';

class Api {
  static const _moviesList = ApiEndPoints.popularMovies;

  Future<List<Movie>> getAllMovies() async {
    try {
      final response = await http.get(Uri.parse(_moviesList));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        // print(decodedData);
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  static const _upComingMovies = ApiEndPoints.upComingMovies;
  Future<List<Movie>> getAllUpcomingMovies() async {
    try {
      final response = await http.get(Uri.parse(_upComingMovies));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Movie.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }

  static const _getAllPopularSeries = ApiEndPoints.popularSeries;
  Future<List<Series>> getAllPopularSeries() async {
    try {
      final response = await http.get(Uri.parse(_getAllPopularSeries));
      if (response.statusCode == 200) {
        final decodedData = json.decode(response.body)['results'] as List;
        return decodedData.map((movie) => Series.fromJson(movie)).toList();
      } else {
        throw Exception(
            'Failed to load data. Status code: ${response.statusCode}');
      }
    } catch (e) {
      throw Exception('Error occurred: $e');
    }
  }
}
