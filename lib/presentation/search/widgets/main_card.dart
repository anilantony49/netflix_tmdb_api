import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
  const MainCard({super.key});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image: const DecorationImage(
              image: NetworkImage(
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"),
              fit: BoxFit.cover,
            )));
  }
}
