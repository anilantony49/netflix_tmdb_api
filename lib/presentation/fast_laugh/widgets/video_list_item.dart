import 'package:flutter/material.dart';
import 'package:netflix_app_clone/presentation/fast_laugh/widgets/video_action_widgets.dart';

class VideoListItem extends StatefulWidget {
  final int index;
  const VideoListItem({super.key, required this.index});

  @override
  State<VideoListItem> createState() => _VideoListItemState();
}

class _VideoListItemState extends State<VideoListItem> {
  bool isLiked = false;
  @override
  Widget build(BuildContext context) {
    return Stack(
      children: [
        Container(
          color: Colors.accents[widget.index],
        ),
        Align(
          alignment: Alignment.bottomCenter,
          child: Padding(
            padding: const EdgeInsets.symmetric(horizontal: 10, vertical: 10),
            child: Row(
                crossAxisAlignment: CrossAxisAlignment.end,
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                children: [
                  IconButton(
                      onPressed: () {}, icon: const Icon(Icons.volume_mute)),
                  Column(
                    mainAxisAlignment: MainAxisAlignment.end,
                    children: [
                      const Padding(
                        padding: EdgeInsets.symmetric(vertical: 20),
                        child: CircleAvatar(),
                      ),
                      GestureDetector(
                        onTap: () {
                          setState(() {
                            isLiked = !isLiked; // Toggle the like state
                          });
                        },
                        child: VideoActionWidget(
                            icon: isLiked
                                ? Icons.favorite_outline
                                : Icons.thumb_up,
                            title: isLiked ? 'Liked' : 'Like'),
                      ),
                      VideoActionWidget(icon: Icons.add, title: 'My List'),
                      VideoActionWidget(icon: Icons.share, title: 'Share'),
                      VideoActionWidget(icon: Icons.play_arrow, title: 'play')
                    ],
                  )
                ]),
          ),
        ),
      ],
    );
  }
}
