import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/appbar.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/tab_view_one.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/tab_view_two.dart';

class ScreenNewAndHot extends StatelessWidget {
  const ScreenNewAndHot({super.key});

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
          body: const TabBarView(children: [TabViewOne(), TabViewTwo()]),
        ),
      ),
    );
  }
}
