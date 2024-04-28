import 'package:netflix_app_clone/core/constants/strings.dart';

class Movie {
  int id;
  String title;
  String overView;
  DateTime releaseDate;
  String posterPath;
  String backdropPath;

  Movie(
      {required this.id,
      required this.title,
      required this.overView,
      required this.releaseDate,
      required this.posterPath,
      required this.backdropPath});

  factory Movie.fromJson(Map<String, dynamic> json) {
    return Movie(
      id: json['id'],
      title: json['title'],
      posterPath: json['poster_path'],
      overView: json['overview'],
      backdropPath: json['backdrop_path'] ?? mainImage,
      releaseDate: DateTime.tryParse(json['release_date'])!,
    );
  }
}
