import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class TopSearchItemTitle extends StatelessWidget {
  const TopSearchItemTitle({super.key});

  @override
  Widget build(BuildContext context) {
    final screenWidth = MediaQuery.of(context).size.width;

    return Row(
      children: [
        Container(
          width: screenWidth * 0.37,
          height: 90,
          decoration: BoxDecoration(
              borderRadius: BorderRadius.circular(7),
              image: const DecorationImage(
                  fit: BoxFit.cover,
                  image: NetworkImage(
                      "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"))),
        ),
        k20width,
        const Expanded(
            child: Text(
          'title',
          style: TextStyle(fontSize: 18, fontWeight: FontWeight.bold),
        )),
        const Icon(
          Icons.play_circle,
          color: Colors.grey,
          size: 35,
        )
      ],
    );
  }
}
