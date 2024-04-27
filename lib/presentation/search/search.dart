import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_idle.dart';
import 'package:netflix_app_clone/presentation/search/widgets/search_results.dart';

class ScreenSearch extends StatefulWidget {
  const ScreenSearch({super.key});

  @override
  State<ScreenSearch> createState() => _ScreenSearchState();
}

bool isTapped = false;

class _ScreenSearchState extends State<ScreenSearch> {
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
              onTap: (){
                setState(() {
                  isTapped=true;
                });
              },
            ),
            k20height,
            isTapped
                ? const Expanded(child: SearchResultsWidget())
                : const Expanded(child: SearchIdleWidget())
          ],
        ),
      )),
    );
  }
}
