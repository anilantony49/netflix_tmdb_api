import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/presentation/search/widgets/main_card.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_title.dart';

class SearchResultsWidget extends StatelessWidget {
  final Future<List<Movie>> movieList;

  const SearchResultsWidget({super.key, required this.movieList});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTilewidget(title: 'Movies & TV'),
          k20height,
          FutureBuilder(
            future: movieList,
            builder: (context, snapshot) {
              if (snapshot.hasError) {
                return Center(
                  child: Text(snapshot.error.toString()),
                );
              } else if (snapshot.hasData) {
                return Expanded(
                    child: GridView.count(
                  crossAxisCount: 3,
                  shrinkWrap: true,
                  mainAxisSpacing: 10,
                  crossAxisSpacing: 10,
                  childAspectRatio: 1 / 1.35,
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => MainCard(
                            imageUrl:
                                imageBaseUrl + snapshot.data![index].posterPath,
                          )),
                ));
              }else {
                    return const Center(child: CircularProgressIndicator());
                  }
            },
          )
        ],
      ),
    );
  }
}
