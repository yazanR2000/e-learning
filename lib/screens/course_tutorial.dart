import 'package:flutter/material.dart';
import '../api/course.dart' as c;
import '../widgets/tutorials.dart';
class CourseTutorial extends StatefulWidget {
  CourseTutorial({super.key});

  @override
  State<CourseTutorial> createState() => _CourseTutorialState();
}

class _CourseTutorialState extends State<CourseTutorial> {
  final c.Course _tutorials = c.Course.getInstance();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text("${_tutorials.course!} Lessons"),
      ),
      body: FutureBuilder(
        future: _tutorials.getTutorial(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Tutorials(_tutorials.tutorials);
        },
      ),
    );
  }
}
