import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class SectionOne extends StatelessWidget {
  const SectionOne({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Column(
      children: [
        Row(
          children: [
            Padding(
                padding: EdgeInsets.only(
                    top: size.height * 0.1, left: size.height * 0.03)),
            // kwidth,
            const Icon(
              Icons.settings,
              color: kwhiteColor,
            ),
            k20width,
            const Text(
              'Smarts Downloads',
              style: TextStyle(
                fontSize: 14,
                fontWeight: FontWeight.w500,
              ),
            )
          ],
        ),
        k20height,
        const Text(
          "We'll download a personalised selection of \nfilms and programmes for you, so there's \nalways something to watch on your \ndevice",
          textAlign: TextAlign.center,
          style: TextStyle(
            fontWeight: FontWeight.w100,
            color: Colors.white70,
            fontSize: 14,
          ),
        ),
      ],
    );
  }
}
