import 'package:flutter/material.dart';
import '../api/exam.dart';
import '../api/course.dart';
import '../api/base_url.dart';

class LevelExamDialog extends StatelessWidget {
  final BuildContext _ctx;
  final Exam _exam;
  LevelExamDialog(this._ctx, this._exam);

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      title: const Text("Level exam"),
      content: const Text("Do you want to take this exam ?"),
      actions: [
        TextButton(
          onPressed: () {
            BaseUrl.setBase = "https://ltuc-exams-default-rtdb.firebaseio.com";
            Navigator.of(_ctx).pop();
            Navigator.of(context).pushNamed('/selected_item_exam', arguments: {
              'exam': _exam,
              'from' : 'level',
            });
          },
          child: const Text("Yes"),
        ),
        TextButton(
          onPressed: () {
            Course course = Course.getInstance();
            course.course = _exam.subject;
            Navigator.of(_ctx).pop();
            Navigator.of(context).pushNamed('/course');
          },
          child: const Text("No go to course"),
        ),
      ],
    );
  }
}
