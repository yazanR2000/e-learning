import 'package:flutter/material.dart';
import '../api/api.dart';
import '../api/exam.dart';

import '../widgets/exams.dart';
// import '../widgets/api_documentation.dart';
// import '../widgets/my_accounts.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    final List<Exam> exams = _api.exams;
    return Scaffold(
      appBar: AppBar(
        title: const Text("Ltuc subjects"),
      ),
      body: FutureBuilder(
        future: _api.getExams(),
        builder: (context, snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          return Exams();
        },
      ),
    );
  }
}
