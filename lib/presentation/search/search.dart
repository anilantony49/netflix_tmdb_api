import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/debounce/debounce.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_results.dart';
import 'package:netflix_app_clone/services/api_services.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

late Future<List<Movie>> popularSearches;
final _debouncer = Debouncer(milliseconds: 1 * 1000);

class _ScreenSearchState extends State<ScreenSearch> {
  @override
  void initState() {
    popularSearches = Api().getAllMovies();
    super.initState();
  }

  bool isTapped = false;
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: SafeArea(
          child: Padding(
        padding: const EdgeInsets.all(10.0),
        child: Column(
          children: [
            CupertinoSearchTextField(
              backgroundColor: Colors.grey.withOpacity(.25),
              prefixIcon: const Icon(
                CupertinoIcons.search,
                color: Colors.grey,
              ),
              suffixIcon: const Icon(CupertinoIcons.xmark_circle_fill,
                  color: Colors.grey),
              style: const TextStyle(color: Colors.white),
              onChanged: (value) {
                _debouncer.run(() {
                  setState(() {
                    popularSearches = Api().getAllMoviesList(value);
                    // seriesList = getAllSeriesList(value);
                    // isTapped = true;
                  });
                });
              },
              onTap: () {
                setState(() {
                  isTapped = true;
                });
              },
            ),
            k20height,
            isTapped
                ? Expanded(
                    child: SearchReasult(
                    movieList: popularSearches,
                  ))
                : Expanded(
                    child: SearchIdleWidget(
                    popularSearches: popularSearches,
                  ))
          ],
        ),
      )),
    );
  }
}
