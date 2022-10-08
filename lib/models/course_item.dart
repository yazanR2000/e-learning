import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import '../api/base_url.dart';
import '../api/course.dart';
import '../api/exam.dart';

class CourseItem extends StatelessWidget {
  final Color _color;
  final String _title;
  final String _course;
  CourseItem(this._color, this._title, this._course);

  String _subtitle() {
    if (_title.startsWith('L')) {
      return "Lessons to imporeve your skills in this course";
    } else if (_title.startsWith('F')) {
      return "Exam to test your skills";
    }
    return "Resoursces for both lessons and exams";
  }

  void _whereToGo(BuildContext context) {
    if (_title.startsWith("L")) {
      if (_course == "English") {
        Navigator.of(context).pushNamed('/english');
      } else {
        Navigator.of(context).pushNamed('/course_tutorial');
      }
    } else if (_title.startsWith("F")) {
      BaseUrl.setBase = "https://e-learning-9c70e-default-rtdb.firebaseio.com";
      final Exam exam = Exams.exams[_course]!;
      Navigator.of(context).pushNamed('/selected_item_exam', arguments: {
        'exam': exam,
        'from' : 'Course',
      });
    } else {
      // go to resources
    }
  }

  @override
  Widget build(BuildContext context) {
    return InkWell(
      onTap: () => _whereToGo(context),
      child: Container(
        height: 200,
        padding: const EdgeInsets.all(20),
        decoration: BoxDecoration(
          borderRadius: BorderRadius.circular(20),
          gradient: LinearGradient(
            colors: [
              _color,
              _color.withOpacity(0.6),
            ],
          ),
        ),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.end,
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            _title.startsWith('R')
                ? Container()
                : Container(
                    decoration: BoxDecoration(
                      shape: BoxShape.circle,
                      color: Colors.grey.shade300,
                    ),
                    child: IconButton(
                      onPressed: () {},
                      icon: const FaIcon(
                        FontAwesomeIcons.play,
                        color: Colors.white,
                      ),
                    ),
                  ),
            ListTile(
              title: Text(
                _title,
                style: Theme.of(context)
                    .textTheme
                    .bodyText1!
                    .copyWith(color: const Color(0xff1E2022)),
              ),
              subtitle: Text(
                _subtitle(),
                style: Theme.of(context).textTheme.bodyText2,
              ),
            ),
          ],
        ),
      ),
    );
  }
}
