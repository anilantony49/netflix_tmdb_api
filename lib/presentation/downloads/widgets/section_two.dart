import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/models/movie.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/downloas_loading.dart';
import 'package:netflix_app_clone/presentation/downloads/widgets/image_widget.dart';
import 'package:netflix_app_clone/services/api_services.dart';

class SectionTwo extends StatefulWidget {
  const SectionTwo({super.key});

  @override
  State<SectionTwo> createState() => _SectionTwoState();
}

class _SectionTwoState extends State<SectionTwo> {
  late Future<List<Movie>> trending;
  @override
  void initState() {
    trending = Api().getAllMovies();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return SizedBox(
      child: FutureBuilder(
        future: trending,
        builder: (context, snapshot) {
          if (snapshot.hasError) {
            return Center(
              child: Text(snapshot.error.toString()),
            );
          } else if (snapshot.hasData) {
            return Stack(
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
                    imageList: imageBaseUrl + snapshot.data![1].posterPath),
                DownloadsImageWidget(
                    height: size.height * 0.19,
                    width: size.width * 0.31,
                    angle: -10,
                    margin: const EdgeInsets.only(right: 140, bottom: 5),
                    imageList: imageBaseUrl + snapshot.data![2].posterPath),
                DownloadsImageWidget(
                    height: size.height * 0.22,
                    width: size.width * 0.31,
                    angle: 0,
                    margin: const EdgeInsets.only(right: 0, top: 20),
                    imageList: imageBaseUrl + snapshot.data![3].posterPath),
              ],
            );
          } else {
            return DownloadsLoadingWidget(size: size);
          }
        },
      ),
    );
  }
}
