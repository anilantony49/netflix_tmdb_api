import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class HomeScreenAppbar extends StatelessWidget {
  const HomeScreenAppbar({
    super.key,
    required this.size,
  });

  final Size size;

  @override
  Widget build(BuildContext context) {
    return AnimatedContainer(
      curve: Curves.easeInOut,
      duration: const Duration(seconds: 1),
      height: size.height * 0.12,
      decoration: const BoxDecoration(
        gradient: LinearGradient(
          begin: Alignment.topCenter,
          end: Alignment.bottomCenter,
          colors: [
            Color(0xFF000000),
            Color(0x00000000),
          ],
        ),
      ),
      child: Column(
        children: [
          Padding(
            padding: const EdgeInsets.only(left: 15, right: 10, top: 10),
            child: Row(
              children: [
                // Image.asset(logo),
                const Spacer(),
                const SizedBox(
                    width: 25,
                    child: Icon(
                      Icons.cast,
                      color: kwhiteColor,
                      size: 30,
                    )),
                k20width,
                SizedBox(
                    width: 25,
                    child: Container(
                      height: 30,
                      width: 30,
                      color: kwhiteColor,
                    ))
              ],
            ),
          ),
          k15height,
          const Row(
            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
            children: [
              Text('Series',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              Text('Films',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  )),
              Text('Categories',
                  style: TextStyle(
                    fontSize: 14,
                    fontWeight: FontWeight.w400,
                  ))
            ],
          )
        ],
      ),
    );
  }
}
