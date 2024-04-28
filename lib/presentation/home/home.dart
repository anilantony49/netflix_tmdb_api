import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/models/series.dart';
import 'package:netflix_app_clone/presentation/home/widget/home_banner.dart';
import 'package:netflix_app_clone/presentation/home/widget/home_screen_appbar.dart';
import 'package:netflix_app_clone/presentation/home/widget/listview_loading.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_card_widget.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_title.dart';
import 'package:netflix_app_clone/presentation/home/widget/number_tile_card.dart';
import 'package:netflix_app_clone/services/api_services.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatefulWidget {
  const ScreenHome({super.key});

  @override
  State<ScreenHome> createState() => _ScreenHomeState();
}

class _ScreenHomeState extends State<ScreenHome> {
  late Future<List<Movie>> popular;
  late Future<List<Movie>> trending;
  late Future<List<Movie>> pastYearMovies;
  late Future<List<Movie>> upComingMovies;
  late Future<List<Series>> topRatedSeries;
  late Future<List<Series>> airingTodaySeries;
  @override
  void initState() {
    popular = Api().getAllPopular();
    trending = Api().getAllTrending();
    topRatedSeries = Api().getAllTopRatedSeries();
    pastYearMovies = Api().getAllPastYearMovies();
    upComingMovies = Api().getAllUpcomingMovies();
    airingTodaySeries = Api().getAllSeriesAiringToday();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final Size size = MediaQuery.of(context).size;

    return Scaffold(
        body: SafeArea(
      child: ValueListenableBuilder(
          valueListenable: scrollNotifier,
          builder: (context, index, _) {
            return NotificationListener<UserScrollNotification>(
              onNotification: (notification) {
                final ScrollDirection direction = notification.direction;
                if (direction == ScrollDirection.reverse) {
                  scrollNotifier.value = false;
                } else if (direction == ScrollDirection.forward) {
                  scrollNotifier.value = true;
                }
                return true;
              },
              child: Stack(
                children: [
                  ListView(
                    children: [
                      const HomeBanner(),
                      MainTitleCard(
                        size: size,
                        title: 'Released in the past year',
                        movies: pastYearMovies,
                      ),
                      MainTitleCard(
                        size: size,
                        title: 'Trending Now',
                        movies: trending,
                      ),
                      NumberTitleCard(
                        size: size,
                        series: topRatedSeries,
                      ),
                      k10height,
                      MainTitleCard(
                        size: size,
                        title: 'Tense Dramas',
                        movies: pastYearMovies,
                      ),
                      MainTitleCard(
                        size: size,
                        title: 'South Indian Cinema',
                        movies: upComingMovies,
                      ),
                    ],
                  ),
                  scrollNotifier.value
                      ? HomeScreenAppbar(size: size)
                      : k10height
                ],
              ),
            );
          }),
    ));
  }
}

class MainTitleCard extends StatelessWidget {
  const MainTitleCard({
    super.key,
    required this.size,
    required this.title,
    required this.movies,
  });

  final Size size;
  final String title;
  final Future<List<dynamic>> movies;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        k5height,
        FutureBuilder(
          future: movies,
          builder: (context, snapshot) {
            if (snapshot.hasError) {
              return Center(
                child: Text(snapshot.error.toString()),
              );
            } else if (snapshot.hasData) {
              return LimitedBox(
                maxHeight: 200,
                child: ListView(
                  scrollDirection: Axis.horizontal,
                  children: List.generate(
                      snapshot.data!.length,
                      (index) => MainCardWidget(
                            size: size,
                            image:
                                imageBaseUrl + snapshot.data![index].posterPath,
                          )),
                ),
              );
            } else {
              return ListViewLoading(size: size);
            }
          },
        )
      ],
    );
  }
}
