import 'package:flutter/material.dart';
import '../api/course.dart';
import '../models/youtube_video.dart';

class Tutorials extends StatefulWidget {
  final List<Tutorial> _subjects;
  Tutorials(this._subjects);

  @override
  State<Tutorials> createState() => _TutorialsState();
}

class _TutorialsState extends State<Tutorials> {
  int _expandedIndex = -1;
  @override
  Widget build(BuildContext context) {
    return ListView.separated(
      separatorBuilder: (context, index) => const Divider(),
      itemCount: widget._subjects.length,
      itemBuilder: (context, index) {
        return Column(
          children: [
            ListTile(
              onTap: () {
                setState(() {
                  _expandedIndex = _expandedIndex == index ? -1 : index;
                });
              },
              title: Text(
                widget._subjects[index].tutorial,
                style: Theme.of(context).textTheme.bodyText1,
              ),
              trailing: _expandedIndex == index
                  ? const Icon(
                      Icons.arrow_drop_up,
                      color: Color(0xffF0F5F9),
                    )
                  : const Icon(
                      Icons.arrow_drop_down,
                      color: Color(0xffF0F5F9),
                    ),
            ),
            if (_expandedIndex == index)
              Container(
                margin: const EdgeInsets.all(10),
                padding: const EdgeInsets.all(15),
                decoration: BoxDecoration(
                  color: const Color(0xffF0F5F9),
                  borderRadius: BorderRadius.circular(20),
                ),
                child: FutureBuilder(
                  future: widget._subjects[index].getDetails(),
                  builder: (context, snapshot) {
                    if (snapshot.connectionState == ConnectionState.waiting) {
                      return const Center(
                        child: CircularProgressIndicator(),
                      );
                    }
                    final Map<String, dynamic> details =
                        widget._subjects[index].details;
                    details['description'] = details['description']
                        .toString()
                        .replaceAll("\\n", "\n\n");
                    return Column(
                      children: [
                        Container(
                          // ignore: sort_child_properties_last
                          child: Scrollbar(
                            child: SingleChildScrollView(
                              child: Column(
                                children: [
                                  Text(
                                    details['description'],
                                    style: Theme.of(context).textTheme.bodyText2,
                                  ),
                                ],
                              ),
                            ),
                          ),
                          constraints: const BoxConstraints(maxHeight: 300),
                        ),
                        const SizedBox(
                          height: 20,
                        ),
                        YouTubeVideo(details['yUrl']),
                      ],
                    );
                  },
                ),
              ),
          ],
        );
      },
    );
  }
}
