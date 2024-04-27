import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_title.dart';
import 'package:netflix_app_clone/presentation/search/widgets/top_search_title.dart';

class SearchIdleWidget extends StatelessWidget {
  const SearchIdleWidget({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const SearchTilewidget(title: 'Top Searches'),
          k20height,
          Expanded(
            child: ListView.separated(
                shrinkWrap: true,
                itemBuilder: (context, index) {
                  return const TopSearchItemTitle();
                },
                separatorBuilder: (context, index) => k25height,
                itemCount: 10),
          )
        ],
      ),
    );
  }
}
