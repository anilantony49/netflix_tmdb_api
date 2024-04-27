import 'package:flutter/material.dart';
import 'package:flutter/rendering.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/home/widget/home_banner.dart';
import 'package:netflix_app_clone/presentation/home/widget/home_screen_appbar.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_card_widget.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_title.dart';
import 'package:netflix_app_clone/presentation/home/widget/number_tile_card.dart';

ValueNotifier<bool> scrollNotifier = ValueNotifier(true);

class ScreenHome extends StatelessWidget {
  const ScreenHome({super.key});

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
                      ),
                      MainTitleCard(
                        size: size,
                        title: 'Trending Now',
                      ),
                      const NumberTitleCard(),
                      k10height,
                      MainTitleCard(
                        size: size,
                        title: 'Tense Dramas',
                      ),
                      MainTitleCard(
                        size: size,
                        title: 'South Indian Cinema',
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
  });

  final Size size;
  final String title;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        MainTitle(title: title),
        k5height,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
            scrollDirection: Axis.horizontal,
            children: List.generate(10, (index) => MainCardWidget(size: size)),
          ),
        )
      ],
    );
  }
}
