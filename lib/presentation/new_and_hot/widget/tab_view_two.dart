import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/everyone_watchec.dart';

class TabViewTwo extends StatelessWidget {
  const TabViewTwo({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
        itemBuilder: (context, index) {
          return const EveryOnesWatched(
              image:
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client",
              title: 'fd',
              overview: 'sd');
        });
  }
}
