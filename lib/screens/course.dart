
import 'package:flutter/material.dart';
import '../api/course.dart' as c;
import '../models/course_item.dart';
import '../models/course_information.dart';
class Course extends StatelessWidget {
  final c.Course _course = c.Course.getInstance();
  final List<Color> _colors = const [
    Color(0xffF4F9F9),
    Color(0xffCCF2F4),
    Color(0xffA4EBF3),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(_course.course!),
      ),
      body: SingleChildScrollView(
        padding: const EdgeInsets.all(25),
        child: Column(
          children: [
            CourseItem(_colors[0], "Lessons", _course.course!),
            const SizedBox(
              height: 20,
            ),
            CourseItem(_colors[1], "Final Exam", _course.course!),
            const SizedBox(
              height: 20,
            ),
            FutureBuilder(
              future: _course.getInformation(),
              builder: (context, snapshot) {
                if (snapshot.connectionState == ConnectionState.waiting) {
                  return const Center(
                    child: CircularProgressIndicator(),
                  );
                }
                return CourseInformation(_course.courseInformation);
              },
            ),
          ],
        ),
      ),
    );
  }
}
