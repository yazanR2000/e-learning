import 'package:flutter/material.dart';


import '../widgets/reading.dart';
import '../widgets/lestining.dart';
import '../models/grammer.dart';
class EnglishCourse extends StatefulWidget {
  const EnglishCourse({super.key});

  @override
  State<EnglishCourse> createState() => _EnglishCourseState();
}

class _EnglishCourseState extends State<EnglishCourse> {
  @override
  Widget build(BuildContext context) {
    return DefaultTabController(
      length: 3,
      child: Scaffold(
        appBar: AppBar(
          title: const Text(
            "English course",
            //style: TextStyle(fontFamily: "Kalam-Bold", fontSize: 40),
          ),
          //backgroundColor: Color.fromARGB(255, 98, 163, 179),
          bottom: const TabBar(tabs: [
            Text(
              "Grammar",
              //style: TextStyle(fontFamily: "Kalam-Bold", fontSize: 20),
            ),
            Text(
              "Reading",
              //style: TextStyle(fontFamily: "Kalam-Bold", fontSize: 20),
            ),
            Text(
              "Listening",
              //style: TextStyle(fontFamily: "Kalam-Bold", fontSize: 20),
            ),
          ]),
        ),
        body: TabBarView(
          children: [
            const Grammer(),
            Reading(),
            Lestining(),
          ],
        ),
      ),
    );
  }
}
