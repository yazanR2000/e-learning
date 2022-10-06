import 'package:flutter/material.dart';
import 'package:youtube_player_flutter/youtube_player_flutter.dart';

class YouTubeVideo extends StatefulWidget {
  final String _url;
  YouTubeVideo(this._url);

  @override
  State<YouTubeVideo> createState() => _YouTubeVideoState();
}

class _YouTubeVideoState extends State<YouTubeVideo> {
  late YoutubePlayerController _playerController;
  @override
  void initState() {
    final videoId = YoutubePlayer.convertUrlToId(widget._url);
    _playerController = YoutubePlayerController(
      initialVideoId: videoId!,
      flags: const YoutubePlayerFlags(autoPlay: false),
    );
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      height: 200,
      decoration: BoxDecoration(
        borderRadius: BorderRadius.circular(10),
      ),
      child: ClipRRect(
        borderRadius: BorderRadius.circular(10),
        child: YoutubePlayer(
          controller: _playerController,
          showVideoProgressIndicator: true,
        ),
      ),
    );
  }
}
