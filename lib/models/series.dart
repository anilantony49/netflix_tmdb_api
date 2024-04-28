import 'package:netflix_app_clone/core/constants/strings.dart';

class Series {
  int id;
  String title;
  String overView;
  String releaseDate;
  String posterPath;
  String backdropPath;

  Series({
    required this.id,
    required this.title,
    required this.posterPath,
    required this.overView,
    required this.backdropPath,
    required this.releaseDate,
  });

  factory Series.fromJson(Map<String, dynamic> json) {
    return Series(
      id: json['id'],
      title: json['original_name'],
      posterPath: json['poster_path'],
      overView: json['overview'],
      backdropPath: json['backdrop_path'] ?? mainImage,
      releaseDate: json['first_air_date'],
    );
  }
}
