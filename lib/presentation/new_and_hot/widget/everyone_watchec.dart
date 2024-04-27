import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/action_widget.dart';

class EveryOnesWatched extends StatelessWidget {
  const EveryOnesWatched({
    super.key,
    required this.image,
    required this.title,
    required this.overview,
  });

  final String image;
  final String title;
  final String overview;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Padding(
      padding: const EdgeInsets.only(left: 5, right: 5),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          k10height,
          // Image.asset(seriesLogo),
          Text(
            title,
            style: const TextStyle(fontWeight: FontWeight.w600, fontSize: 18),
          ),
          k10height,
          Text(
            overview,
            style: TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 14,
              color: Colors.grey.shade600,
            ),
          ),
          k10height,
          _newAndHotMainImage(size, image),
          const Padding(
            padding: EdgeInsets.only(right: 15),
            child: Row(
              children: [
                Spacer(),
                ActionWidget(
                  icon: Icons.share,
                  iconSize: 0.05,
                  text: 'Share',
                  textSize: 13,
                  height: 0.01,
                  textColor: kwhiteColor,
                ),
                k20width,
                ActionWidget(
                  icon: Icons.add,
                  iconSize: 0.05,
                  text: 'My List',
                  textSize: 13,
                  height: 0.01,
                  textColor: kwhiteColor,
                ),
                k20width,
                ActionWidget(
                  icon: Icons.play_arrow,
                  iconSize: 0.05,
                  text: 'Play',
                  textSize: 13,
                  height: 0.01,
                  textColor: kwhiteColor,
                )
              ],
            ),
          ),
          // k10height
        ],
      ),
    );
  }

  SizedBox _newAndHotMainImage(Size size, String image) {
    return SizedBox(
      width: double.infinity,
      height: 200,
      child: Stack(
        children: [
          CachedNetworkImage(
              imageUrl: image,
              imageBuilder: (context, imageProvider) => ClipRRect(
                    borderRadius: BorderRadius.circular(5),
                    child: Image(
                      image: imageProvider,
                      fit: BoxFit.cover,
                      width: size.width,
                      height: size.height,
                    ),
                  ),
              placeholder: (context, url) =>
                  const Center(child: CircularProgressIndicator())),
        ],
      ),
    );
  }
}
