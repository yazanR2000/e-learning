import 'package:flutter/material.dart';
import '../api/course.dart' as c;
import '../widgets/tutorials.dart';
class Course extends StatefulWidget {
  Course({super.key});

  @override
  State<Course> createState() => _CourseState();
}

class _CourseState extends State<Course> {
  final c.Course _tutorials = c.Course.getInstance();
  
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_tutorials.course!),
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
