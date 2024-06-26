import 'package:cached_network_image/cached_network_image.dart';
import 'package:flutter/material.dart';
import 'package:intl/intl.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';
import 'package:netflix_app_clone/presentation/new_and_hot/widget/action_widget.dart';

class ComingSoonCard extends StatelessWidget {
  const ComingSoonCard({
    super.key,
    required this.image,
    required this.overview,
    required this.title,
    required this.date,
  });

  final String image;
  final String title;
  final String overview;
  final DateTime date;

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return SizedBox(
      child: Row(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          _newAndHotSideDate(size, date),
          SizedBox(
            width: size.width - 50,
            child: Column(
              children: [
                _newAndHotMainImage(size, image),
                _cardDetails(size, title, overview, date),
              ],
            ),
          ),
        ],
      ),
    );
  }

  Widget _cardDetails(Size size, String title, String overview, DateTime date) {
    return Padding(
      padding: const EdgeInsets.only(right: 30),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          const Row(
            children: [
              Spacer(),
              ActionWidget(
                icon: Icons.notifications_none_rounded,
                iconSize: 0.06,
                text: 'Remind Me',
                height: 0.006,
                textSize: 13,
                textColor: kwhiteColor,
              ),
              k20width,
              ActionWidget(
                icon: Icons.info,
                iconSize: 0.055,
                text: 'Info',
                height: 0.007,
                textSize: 13,
                textColor: kwhiteColor,
              ),
            ],
          ),
          Text(
            'Releasing on ${DateFormat('EEEE').format(date)} ',
            style: const TextStyle(
              fontWeight: FontWeight.w100,
              fontSize: 16,
            ),
          ),
          k10height,
          // Image.asset(filmLogo),
          Text(
            title,
            style: const TextStyle(
                fontWeight: FontWeight.w600, fontSize: 18, height: 1),
          ),
          k10height,
          Text(
            overview,
            style: TextStyle(
                fontWeight: FontWeight.w100,
                fontSize: 14,
                color: Colors.grey.shade600),
          ),
          k10height
        ],
      ),
    );
  }

  Widget _newAndHotMainImage(Size size, String image) {
    return Container(
      width: double.infinity,
      height: size.height * 0.255,
      decoration: BoxDecoration(
        color: Colors.grey,
        borderRadius: BorderRadius.circular(14),
      ),
      child: Stack(
        children: [
          CachedNetworkImage(
            imageUrl: image,
            imageBuilder: (context, imageProvider) => ClipRRect(
              borderRadius: BorderRadius.circular(14),
              child: Image(
                image: imageProvider,
                fit: BoxFit.cover,
                width: size.width,
                height: size.height,
              ),
            ),
            placeholder: (context, url) =>
                const Center(child: CircularProgressIndicator()),
          ),
          // Positioned(
          //   top: 10,
          //   left: 10,
          //   child: Image.asset(
          //     logo,
          //     width: 16,
          //   ),
          // ),
        ],
      ),
    );
  }

  Widget _newAndHotSideDate(Size size, DateTime date) {
    return SizedBox(
      width: 50,
      // height: size.height * 0.6,
      child: Column(
        children: [
          Text(
            DateFormat('MMM').format(date).toUpperCase(),
            style: TextStyle(
                fontSize: 15,
                fontWeight: FontWeight.w100,
                color: Colors.grey.shade600),
          ),
          Text(
            DateFormat('dd').format(date),
            style: const TextStyle(
              fontSize: 30,
              fontWeight: FontWeight.w500,
              height: 1,
            ),
          )
        ],
      ),
    );
  }
}
