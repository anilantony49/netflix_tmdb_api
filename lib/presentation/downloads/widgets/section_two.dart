import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/image_widget.dart';

class SectionTwo extends StatelessWidget {
  const SectionTwo({super.key});

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: Stack(
        alignment: Alignment.center,
        children: [
          CircleAvatar(
            radius: size.width * 0.30,
            backgroundColor: kgreyColor,
          ),
          DownloadsImageWidget(
              height: size.height * 0.19,
              width: size.width * 0.31,
              angle: 10,
              margin: const EdgeInsets.only(left: 140, bottom: 5),
              imageList:
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"),
          DownloadsImageWidget(
              height: size.height * 0.19,
              width: size.width * 0.31,
              angle: -10,
              margin: const EdgeInsets.only(right: 140, bottom: 5),
              imageList:
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"),
          DownloadsImageWidget(
              height: size.height * 0.22,
              width: size.width * 0.31,
              angle: 0,
              margin: const EdgeInsets.only(right: 0, top: 20),
              imageList:
                  "https://images.complex.com/complex/images/c_fill,dpr_auto,f_auto,q_auto,w_1400/fl_lossy,pg_1/wjnhpz3osrai5aningjl/titanic?fimg-client"),
        ],
      ),
    );
  }
}
