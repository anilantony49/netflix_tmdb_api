import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/presentation/home/widget/custom_botton.dart';


class HomeBanner extends StatelessWidget {
  const HomeBanner({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Stack(
      children: [
        _bannerBackground(size),
        Positioned(
          bottom: 10,
          left: 0,
          right: 0,
          child: Column(
            children: [
              const Text(
                'Drama • Crime • Action & Adventure',
                style: TextStyle(
                  fontWeight: FontWeight.w500,
                  fontSize: 15,
                ),
              ),
             k10height,
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CustomButtonWidget(
                    size: size,
                    iconSize: 0.04,
                    icon: Icons.add,
                    buttonText: 'My List',
                  ),
                  _playButton(),
                  CustomButtonWidget(
                    size: size,
                    iconSize: 0.05,
                    icon: Icons.info,
                    buttonText: 'Info',
                  ),
                ],
              )
            ],
          ),
        )
      ],
    );
  }

  Container _bannerBackground(Size size) {
    return Container(
      height: size.height * 0.65,
      decoration: BoxDecoration(
        image: DecorationImage(
          image: Image.network(mainImage).image,
          fit: BoxFit.cover,
        ),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: mainImage,
            imageBuilder: (context, imageProvider) => Image(
              image: imageProvider,
              fit: BoxFit.cover,
              width: size.width,
            ),
            placeholder: (context, url) => const Center(child: CircularProgressIndicator())
          ),
          Container(
            decoration: const BoxDecoration(
              gradient: LinearGradient(
                begin: Alignment.bottomCenter,
                end: Alignment.topCenter,
                colors: [
                  Color(0xFF000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0x00000000),
                  Color(0x00000000),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }

  SizedBox _playButton() {
    return SizedBox(
      height: 35,
      child: TextButton.icon(
        onPressed: () {},
        icon: const Icon(
          Icons.play_arrow_rounded,
          color: Colors.black,
          size: 30,
        ),
        label: const Text(
          'Play',
          style: TextStyle(color: Colors.black, fontSize: 15),
        ),
        style: TextButton.styleFrom(
          padding: const EdgeInsets.only(left: 8, right: 15),
          backgroundColor: kwhiteColor,
          shape: RoundedRectangleBorder(
            borderRadius: BorderRadius.circular(2),
          ),
        ),
      ),
    );
  }
}
