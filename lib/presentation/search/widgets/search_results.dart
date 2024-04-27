import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/search/widgets/main_card.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_title.dart';

class SearchResultsWidget extends StatelessWidget {
  const SearchResultsWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTilewidget(title: 'Movies & TV'),
          k20height,
          Expanded(
              child: GridView.count(
            crossAxisCount: 3,
            shrinkWrap: true,
            mainAxisSpacing: 10,
            crossAxisSpacing: 10,
            childAspectRatio: 1 / 1.35,
            children: List.generate(20, (index) => const MainCard()),
          ))
        ],
      ),
    );
  }
}
