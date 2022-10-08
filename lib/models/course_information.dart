import 'package:flutter/material.dart';
import '../widgets/what_you_will_learn.dart';

class CourseInformation extends StatelessWidget {
  final Map<String, dynamic> _courseInformation;
  CourseInformation(this._courseInformation);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(20),
            color: const Color(0xffF0F5F9),
          ),
          padding: const EdgeInsets.all(20),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                "What You Will Learn",
                style: Theme.of(context).textTheme.bodyText2!.copyWith(
                      fontWeight: FontWeight.bold,
                    ),
              ),
              const SizedBox(
                height: 10,
              ),
              WhatYouWillLearn(_courseInformation["What-you'll-learn"]),
            ],
          ),
        ),
        const SizedBox(
          height: 10,
        ),
        ListTile(
          dense: true,
          title: const Text("Curriculum"),
          subtitle: Text(_courseInformation['Curriculum']['Curriculum']),
        ),
      ],
    );
  }
}
