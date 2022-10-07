import 'package:e_learning/screens/start.dart';
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
        leading: IconButton(
          icon: Icon(Icons.power_settings_new),
          onPressed: () => Navigator.pushReplacement(
              context, MaterialPageRoute(builder: (context) => Start())),
        ),
        title: const Text("Ltuc courses"),
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
