import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/presentation/home/widget/listview_loading.dart';
import 'package:netflix_app_clone/presentation/home/widget/main_title.dart';
import 'package:netflix_app_clone/presentation/home/widget/number_card.dart';

class NumberTitleCard extends StatelessWidget {
  const NumberTitleCard({
    Key? key,
    required this.size,
    required this.series,
  }) : super(key: key);
  final Size size;
  final Future<List<dynamic>> series;

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
        FutureBuilder(
          future: series,
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
                        (index) => NumberCard(
                              index: index,
                              imageUrl: imageBaseUrl +
                                  snapshot.data![index].posterPath,
                            ))),
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
