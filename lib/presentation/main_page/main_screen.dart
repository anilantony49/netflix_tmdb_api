import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/downloads/downloads.dart';
import 'package:netflix_app_clone/presentation/fast_laugh/fast_laugh.dart';
import 'package:netflix_app_clone/presentation/home/home.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/new_and_hot.dart';
import 'package:netflix_app_clone/presentation/search/search.dart';
import 'package:netflix_app_clone/presentation/widgets/bottom_navigation.dart';

class MainScreen extends StatelessWidget {
  MainScreen({super.key});

  final _pages = [
    const ScreenHome(),
    const ScreenNewAndHot(),
    const ScreenFastLaugh(),
    const ScreenSearch(),
    const ScreenDownloads()
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: ValueListenableBuilder(
        builder: (BuildContext context, int index, Widget? _) {
          return _pages[index];
        },
        valueListenable: indexChangeNotifier,
      ),
      // backgroundColor: backGroundColor,
      bottomNavigationBar: const BottomNavigationWidget(),
    );
  }
}
