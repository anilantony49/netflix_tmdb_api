import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/comming_soon.dart';

class TabViewOne extends StatelessWidget {
  const TabViewOne(
      {super.key, required this.upComingMovies, required this.size});
  final Future<List<Movie>> upComingMovies;
  final Size size;

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: upComingMovies,
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return Center(
            child: Text(snapshot.error.toString()),
          );
        } else if (snapshot.hasData) {
          return ListView.builder(
            shrinkWrap: true,
            itemCount: snapshot.data!.length,
            itemBuilder: (context, index) {
              return ComingSoonCard(
                image: imageBaseUrl + snapshot.data![index].backdropPath,
                title: snapshot.data![index].title,
                overview: snapshot.data![index].overView,
                date: snapshot.data![index].releaseDate,
              );
            },
          );
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
