import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/button_widgets.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/section_one.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/section_two.dart';
import 'package:netflix_app_clone/presentation/widgets/appbar_widget.dart';

class ScreenDownloads extends StatelessWidget {
  const ScreenDownloads({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      appBar: PreferredSize(
        preferredSize: Size.fromHeight(size.height * 0.4),
        child: const AppbarWidget(
          title: 'Downloads',
        ),
      ),
      body: ListView(
        children: const [
          SectionOne(),
          k20height,
          SectionTwo(),
          k50height,
          CustomizeButton(
            buttonColor: kblueColor,
            buttonText: 'Set Up',
            buttonTextColor: kwhiteColor,
            padding: EdgeInsets.only(left: 40, right: 40),
          ),
          k20height,
          CustomizeButton(
            buttonColor: kwhiteColor,
            buttonText: 'See What You Can Download',
            buttonTextColor: kblackColor,
            padding: EdgeInsets.only(left: 60, right: 60),
          )
        ],
      ),
    );
  }
}
