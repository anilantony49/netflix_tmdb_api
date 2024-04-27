import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/sizes.dart';

class NewAndHotAppBar extends StatelessWidget {
  const NewAndHotAppBar({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.only(left: 10, right: 10),
      child: Column(
        children: [
          Row(
            children: [
              const Text(
                'New & Hot',
                style: TextStyle(
                  fontSize: 26,
                  fontWeight: FontWeight.w700,
                  letterSpacing: 0.5,
                ),
              ),
              const Spacer(),
              k20width,
              const Icon(
                Icons.cast,
                color: kwhiteColor,
                size: 30,
              ),
                k20width,
              SizedBox(
                  width: 25,
                  child: Container(
                    width: 30,
                    height: 30,
                    color: kwhiteColor,
                  ))
            ],
          ),
          k15height,
          TabBar(
            tabAlignment: TabAlignment.start,
            isScrollable: true,
            labelColor: Colors.black,
            unselectedLabelColor: Colors.white,
            indicator: BoxDecoration(
              color: kwhiteColor,
              borderRadius: BorderRadius.circular(50),
            ),
            dividerHeight: 0,
            indicatorPadding: const EdgeInsets.only(left: -15, right: -15),
            tabs: [
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: const Text(
                  "🍿 Coming Soon",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      // fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
              Container(
                padding: const EdgeInsets.only(top: 5, bottom: 5),
                child: const Text(
                  "👀 Everyone's watching",
                  maxLines: 1,
                  style: TextStyle(
                      overflow: TextOverflow.ellipsis,
                      // fontSize: 14,
                      fontWeight: FontWeight.w600),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
