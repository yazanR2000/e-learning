import 'package:flutter/material.dart';
import '../models/youtube_video.dart';
import '../reading_text.dart';

class Reading extends StatelessWidget {
  Reading({super.key});
  String url = "https://www.youtube.com/watch?v=sWZ9LNXZSvA";

  @override
  Widget build(BuildContext context) {
    return ListView(
      padding: const EdgeInsets.all(10),
      children: [
        YouTubeVideo(url),
        const SizedBox(height: 15,),
        FutureBuilder(
          future: ReadingText.getReadingText(),
          builder: (context, snapshot) {
            if (snapshot.connectionState == ConnectionState.waiting) {
              return const Center(
                child: CircularProgressIndicator(),
              );
            }
            return Text(
              "${ReadingText.readingText}",
              style: Theme.of(context).textTheme.bodyText2!.copyWith(
                    color: const Color(0xffF0F5F9),
                  ),
            );
          },
        ),
      ],
    );
  }
}
