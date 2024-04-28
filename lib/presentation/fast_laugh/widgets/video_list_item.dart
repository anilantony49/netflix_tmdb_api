import 'package:flutter/material.dart';
import 'package:netflix_app_clone/core/constants/colors.dart';
import 'package:netflix_app_clone/core/constants/strings.dart';
import 'package:netflix_app_clone/presentation/fast_laugh/widgets/video_action_widgets.dart';
import 'package:video_player/video_player.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  VideoPlayerController? playerController;
  bool isVolumeOn = true;
  bool isLiked = false;

  @override
  void initState() {
    super.initState();
    setState(() {
      playerController =
          VideoPlayerController.networkUrl(Uri.parse(videoList[widget.index]));
    });
    playerController!.initialize();
    playerController!.play();
  }

  @override
  void dispose() {
    super.dispose();
    playerController!.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        SizedBox.expand(
          child: SizedBox(
            width: playerController!.value.size.width,
            height: playerController!.value.size.height,
            child: VideoPlayer(playerController!),
          ),
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  CircleAvatar(
                    radius: 22,
                    backgroundColor: Colors.black,
                    child: InkWell(
                        onTap: () {
                          setState(() {
                            isVolumeOn == false
                                ? playerController!.setVolume(4)
                                : playerController!.setVolume(0);
                            isVolumeOn = !isVolumeOn;
                          });
                        },
                        child: isVolumeOn
                            ? const Icon(
                                Icons.volume_up_sharp,
                                color: kwhiteColor,
                                size: 20,
                              )
                            : const Icon(
                                Icons.volume_mute,
                                color: kwhiteColor,
                                size: 20,
                              )),
                  ),
                  // IconButton(
                  //     onPressed: () {}, icon: const Icon(Icons.volume_mute)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 20),
                        child: CircleAvatar(
                            // backgroundColor: Colors.black,
                            radius: 30,
                            backgroundImage: Image.network(
                              imageList[widget.index],
                              fit: BoxFit.cover,
                            ).image),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked;
                          });
                        },
                        child: VideoActionWidget(
                            icon: isLiked
                                ? Icons.favorite_outline
                                : Icons.thumb_up,
                            title: isLiked ? 'Liked' : 'Like'),
                      ),
                      const VideoActionWidget(
                          icon: Icons.add, title: 'My List'),
                      const VideoActionWidget(
                          icon: Icons.share, title: 'Share'),
                      const VideoActionWidget(
                          icon: Icons.play_arrow, title: 'play')
                    ],
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
