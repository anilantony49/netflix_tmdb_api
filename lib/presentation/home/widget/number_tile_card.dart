import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_title.dart';
import 'package:netflix_app_clone/presentation/home/widget/number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
  }) : super(key: key);
  // final List<String> postersList;

  @override
  Widget build(BuildContext context) {
    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Padding(
          padding: EdgeInsets.symmetric(vertical: 10),
          child: MainTitle(title: 'Top 10 Tv Shows in India Today'),
        ),
        // kheight,
        LimitedBox(
          maxHeight: 200,
          child: ListView(
              scrollDirection: Axis.horizontal,
              children: List.generate(
                  10,
                  (index) => NumberCard(
                        index: index,
                        imageUrl: mainImage,
                      ))),
        )
      ],
    );
  }
}
