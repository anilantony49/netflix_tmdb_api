import 'dart:convert';

import 'package:netflix_app_clone/api/api_end_points.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:http/http.dart'as http;

class Api {
  static const _moviesList = ApiEndPoints.popularMovies;

Future< List<Movie>>getAllMovies()async{
  final response = await http.get(Uri.parse(_moviesList));
  if(response.statusCode==200){
    final decodedData = json.decode(response.body)['results'] as List;
    print(decodedData);
    return decodedData.map((movie) => Movie.fromJson(movie)).toList();
  }else{
    throw Exception(
       'Failed to load data. Status code: ${response.statusCode}'
    );
  }
  }
}
