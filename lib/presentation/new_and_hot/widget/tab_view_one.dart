import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/comming_soon.dart';

class TabViewOne extends StatelessWidget {
  const TabViewOne({super.key});

  @override
  Widget build(BuildContext context) {
    return ListView.builder(
        shrinkWrap: true,
      itemBuilder: (context, index) {
        return ComingSoonCard(
            image:
                "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client",
            overview: "ww",
            title: 'dd',
            date: DateTime.now());
      },
    );
  }
}
