import 'package:flutter/material.dart';

class MainCard extends StatelessWidget {
    final String imageUrl;

  const MainCard({super.key, required this.imageUrl});

  @override
  Widget build(BuildContext context) {
    return Container(
        decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(7),
            image:  DecorationImage(
              image: NetworkImage(
                 imageUrl),
              fit: BoxFit.cover,
            )));
  }
}
