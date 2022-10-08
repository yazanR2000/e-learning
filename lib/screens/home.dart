import 'package:e_learning/screens/start.dart';
import 'package:flutter/material.dart';
import '../api/api.dart';
import '../widgets/exams.dart';

class Home extends StatelessWidget {
  Home({super.key});

  final API _api = API.getInstance();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        actions: [
          IconButton(
            icon: const Icon(Icons.logout),
            onPressed: () => Navigator.pushReplacement(
              context,
              MaterialPageRoute(
                builder: (context) => const Start(),
              ),
            ),
          ),
        ],
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
