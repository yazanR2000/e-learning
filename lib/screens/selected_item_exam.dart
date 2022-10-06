import 'package:flutter/material.dart';

import '../api/exam.dart';

import '../api/exam_answers.dart';

import '../models/exam_questions.dart';

class SelectedItemExam extends StatefulWidget {
  SelectedItemExam({super.key});

  @override
  State<SelectedItemExam> createState() => _SelectedItemExamState();
}

class _SelectedItemExamState extends State<SelectedItemExam> {
  final ExamAnswers _examAnswers = ExamAnswers.getInstance();

  @override
  Widget build(BuildContext context) {
    final Exam exam = ModalRoute.of(context)!.settings.arguments as Exam;
    return Scaffold(
      appBar: AppBar(
        title: Text("${exam.subject} Quiz"),
      ),
      body: ExamQuestions(exam),
    );
  }  
}
