import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';


class TopSearchItemTitle extends StatelessWidget {
  final String title;
  final String imageUrl;
  const TopSearchItemTitle(
      {super.key, required this.title, required this.imageUrl});

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
              image:  DecorationImage(
                  fit: BoxFit.cover, image: NetworkImage(imageUrl))),
        ),
        k20width,
         Expanded(
            child: Text(
         title,
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
