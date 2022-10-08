import 'package:e_learning/widgets/list__tile_course.dart';
import 'package:flutter/material.dart';
import '../api/course.dart';
import '../widgets/tutorials.dart';
class Grammer extends StatefulWidget {
  const Grammer({super.key});

  @override
  State<Grammer> createState() => _GrammerState();
}

class _GrammerState extends State<Grammer> {
  expandedFunction(x, index) {
    setState(() {
      // _expandedIndex = x;
      _expandedIndex = _expandedIndex == index ? -1 : index;
    });
  }

  int _expandedIndex = -1;

  List title = [
    "Present Simple",
    "Past Simple",
    "Future Simple",
    "Present Continuous",
    "Past Continuous",
    "Future Continuous",
    "Present Perfect",
    "Past Perfect"
  ];
  final Course _course = Course.getInstance();
  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: _course.getTutorial(),
      builder: (ctx, snapshot) {
        if (snapshot.connectionState == ConnectionState.waiting) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        return Tutorials(_course.tutorials);
      },
    );
  }
}
