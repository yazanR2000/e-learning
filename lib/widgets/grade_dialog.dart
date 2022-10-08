import 'package:flutter/material.dart';

import '../api/exam_answers.dart';

class GradeDialog extends StatelessWidget {
  final Function _checkAnswers;
  GradeDialog(this._checkAnswers);
  final ExamAnswers _examAnswers = ExamAnswers.getInstance();
  String _evaluateLevel(int grade) {
    String level = "And Your level is : ";
    if (grade <= 5) {
      level += "Weak";
    } else if (grade <= 10) {
      level += "Good";
    } else {
      level += "Intermediate";
    }
    return level;
  }

  @override
  Widget build(BuildContext context) {
    return AlertDialog(
      shape: RoundedRectangleBorder(
        borderRadius: BorderRadius.circular(20),
      ),
      //backgroundColor: const Color(0xffF0F5F9),
      content: Container(
        height: 200,
        child: Column(
          children: [
            Expanded(
              child: Image.asset(
                'images/Congratulations.gif',
                fit: BoxFit.fill,
              ),
            ),
            const Text(
              "Your grade is",
            ),
            Text(
              "${_examAnswers.grade}/${_examAnswers.asnwers.length}",
              
            ),
            Text(
              _evaluateLevel(_examAnswers.grade),
            ),
          ],
        ),
      ),
      actions: [
        ElevatedButton(
          onPressed: () {
            Navigator.of(context).pop();
            _checkAnswers();
          },
          child: const Text("Check anwers"),
        ),
      ],
    );
  }
}
