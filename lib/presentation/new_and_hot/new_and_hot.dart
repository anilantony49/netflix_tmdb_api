import 'package:flutter/material.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/models/series.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/appbar.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/tab_view_one.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/tab_view_two.dart';
import 'package:netflix_app_clone/services/api_services.dart';

class ScreenNewAndHot extends StatefulWidget {
  const ScreenNewAndHot({super.key});

  @override
  State<ScreenNewAndHot> createState() => _ScreenNewAndHotState();
}

class _ScreenNewAndHotState extends State<ScreenNewAndHot> {
  late Future<List<Movie>> upComingMovies;
  late Future<List<Series>> popularSeries;

  @override
  void initState() {
    upComingMovies = Api().getAllUpcomingMovies();
    popularSeries = Api().getAllPopularSeries();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SafeArea(
      child: DefaultTabController(
        length: 2,
        child: Scaffold(
          appBar: PreferredSize(
              preferredSize: Size.fromHeight(size.height * 0.115),
              child: const NewAndHotAppBar()),
          body: TabBarView(children: [
            TabViewOne(
              upComingMovies: upComingMovies,
              size: size,
            ),
            TabViewTwo(
              popularSeries: popularSeries,
            )
          ]),
        ),
      ),
    );
  }
}
