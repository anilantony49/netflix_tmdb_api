import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class CustomButtonWidget extends StatelessWidget {
  const CustomButtonWidget(
      {super.key,
      required this.size,
      required this.iconSize,
      required this.buttonText,
      required this.icon});

  final Size size;
  final double iconSize;
  final String buttonText;
  final IconData icon;

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
      Icon(icon,color: kwhiteColor,),
      k5height,
        Text(
          buttonText,
          style: const TextStyle(
            fontSize: 13,
            fontWeight: FontWeight.w500,
          ),
        ),
      ],
    );
  }
}
