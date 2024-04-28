import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_title.dart';
import 'package:netflix_app_clone/presentation/search/widgets/top_search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key, required this.popularSearches});
  final Future<List<Movie>> popularSearches;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTilewidget(title: 'Top Searches'),
          k20height,
          FutureBuilder(
            future: popularSearches,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                  child: ListView.separated(
                    shrinkWrap: true,
                    itemBuilder: (context, index) {
                      return TopSearchItemTitle(
                        title: snapshot.data![index].title,
                        imageUrl:
                            imageBaseUrl + snapshot.data![index].posterPath,
                      );
                    },
                    separatorBuilder: (context, index) => k25height,
                    itemCount: snapshot.data!.length,
                  ),
                );
              } else {
                return const Center(child: CircularProgressIndicator());
              }
            },
          )
        ],
      ),
    );
  }
}
