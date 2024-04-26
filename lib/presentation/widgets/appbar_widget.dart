import 'package:flutter/material.dart';
import 'package:google_fonts/google_fonts.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class AppbarWidget extends StatelessWidget {
  final String title;
  const AppbarWidget({super.key, required this.title});

  @override
  Widget build(BuildContext context) {
    return SafeArea(
      child: Row(
        children: [
          k20width,
          Text(
            title,
            style: GoogleFonts.montserrat(
                fontSize: 30, fontWeight: FontWeight.bold),
          ),
          const Spacer(),
          const Icon(
            Icons.cast,
            color:kwhiteColor,
            size: 30,
          ),
          k20width,
          Container(
            width: 30,
            height: 30,
            color:kwhiteColor,
          ),
          k20width
        ],
      ),
    );
  }
}
