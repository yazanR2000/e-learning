import 'package:flutter/material.dart';
import 'package:audioplayers/audioplayers.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';

class Audio extends StatefulWidget {

  String? myAudio;
  Function _changeState;
  int _index;
  int _activeIndex;
  Audio(this.myAudio,this._changeState,this._index,this._activeIndex);

  @override
  State<Audio> createState() => _AudioState();
}

class _AudioState extends State<Audio> {
  final audioPlayer = AudioPlayer();
  bool isPlaying = false;
  Duration duration = Duration.zero;
  Duration position = Duration.zero;

  void initState() {
    setAudio();
    audioPlayer.onPlayerStateChanged.listen((state) {
      setState(() {
        isPlaying = state == PlayerState.PLAYING;
      });
    });
    audioPlayer.onPlayerStateChanged.listen((NewDuration) {
      setState(() {
        duration = NewDuration as Duration;
      });
    });
    audioPlayer.onAudioPositionChanged.listen((newPosition) {
      setState(() {
        position = newPosition;
      });
    });
  }

  Future setAudio() async {
    audioPlayer.setReleaseMode(ReleaseMode.LOOP);

    final player = AudioCache(prefix: "assets/");
    final url = await player.load("${widget.myAudio}");
    audioPlayer.setUrl(url.path, isLocal: true);
  }

  void dispose() {
    audioPlayer.dispose();
    super.dispose();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        ListTile(
          trailing: IconButton(
            onPressed: () async {
              if (isPlaying) {
                await audioPlayer.pause();
                widget._changeState(widget._index);
              } else {
                await audioPlayer.resume();
                widget._changeState(widget._index);
              }
            },
            icon: FaIcon(
              widget._index == widget._activeIndex ? FontAwesomeIcons.pause : FontAwesomeIcons.play,
            ),
          ),
          // trailing: CircleAvatar(
          //   radius: 40,
          //   child: IconButton(
          //     icon: Icon(isPlaying ? Icons.pause : Icons.play_arrow),
          //     iconSize: 50,

          //   ),
          // ),
          leading: const Icon(Icons.audiotrack_sharp),
          title: const Text("listen to audio"),
          subtitle: const Text("try to keep listening as much you can"),
        ),
        const SizedBox(
          height: 20,
        ),
        const TextField(
          decoration: InputDecoration(
            border: OutlineInputBorder(),
            labelText: 'Enter yore explaine ',
            hintText: 'write as much you can',
          ),
        )
      ],
    );
  }
}
