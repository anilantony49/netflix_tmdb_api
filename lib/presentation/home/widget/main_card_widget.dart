import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class MainCardWidget extends StatelessWidget {
  const MainCardWidget({
    super.key,
    required this.size,
  });
  final Size size;

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.symmetric(horizontal: 10),
      child: Container(
        // height: size.height * 1,
        width: size.width * 0.3,
        decoration: BoxDecoration(
            borderRadius: k20radius,
            image: const DecorationImage(
                image: NetworkImage(
                    "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"))),
      ),
    );
  }
}
