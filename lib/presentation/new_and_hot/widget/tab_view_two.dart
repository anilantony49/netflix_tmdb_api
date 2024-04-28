import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/series.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/everyone_watchec.dart';

class TabViewTwo extends StatelessWidget {
  final Future<List<Series>> popularSeries;
  const TabViewTwo({super.key, required this.popularSeries});

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: popularSeries,
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
                return EveryOnesWatched(
                  image: imageBaseUrl + snapshot.data![index].backdropPath,
                  title: snapshot.data![index].title,
                  overview: snapshot.data![index].overView,
                );
              });
        } else {
          return const Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
