import 'package:flutter/material.dart';

import '../api/exam_answers.dart';
import '../api/question.dart';

class QuestionChoices extends StatefulWidget {
  final Question _question;
  final int _qNum;
  final bool _checkAnswers;
  QuestionChoices(this._question, this._qNum, this._checkAnswers);

  @override
  State<QuestionChoices> createState() => _QuestionChoicesState();
}

class _QuestionChoicesState extends State<QuestionChoices> {
  late Future _choices;
  int? length;
  final ExamAnswers _examAnswers = ExamAnswers.getInstance();

  bool? _isReadingQuestion = false;
  @override
  void initState() {
    super.initState();
    if (widget._qNum == 7) {
      _isReadingQuestion = true;
      widget._question.question = widget._question.question.replaceAll('\\n', '\n\n');
    }
    _choices = widget._question.getChoices();
    length = _examAnswers.asnwers[widget._qNum].choiceNum;
  }

  Widget _trueFalseAnswer(int index, List<Map<String, dynamic>> choices) {
    if (index == length && !choices[index]['answer']) {
      return const Icon(Icons.close, color: Colors.red);
    } else if (choices[index]['answer']) {
      return const Icon(Icons.done_outline_sharp, color: Colors.green);
    }
    return const CircleAvatar(radius: 10, backgroundColor: Color(0xff1E2022));
  }

  @override
  Widget build(BuildContext context) {
    return Expanded(
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          if (_isReadingQuestion!)
            Expanded(
              child: Scrollbar(
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      Text(
                        widget._question.question,
                        style: Theme.of(context).textTheme.bodyText1,
                      ),
                    ],
                  ),
                ),
              ),
            ),
          if (!_isReadingQuestion!)
            Text(
              widget._question.question,
              style: Theme.of(context).textTheme.bodyText1,
            ),
          if (!_isReadingQuestion!)
            const SizedBox(
              height: 15,
            ),
          if (!_isReadingQuestion!)
            Expanded(
              child: FutureBuilder(
                future: _choices,
                builder: (_, snapshot) {
                  if (snapshot.connectionState == ConnectionState.waiting) {
                    return const Center(
                      child: CircularProgressIndicator(),
                    );
                  }
                  final List<Map<String, dynamic>> choices =
                      widget._question.choices;
                  return Center(
                    child: SingleChildScrollView(
                      child: Column(
                        mainAxisAlignment: MainAxisAlignment.end,
                        children: List.generate(
                          choices.length,
                          (index) => Container(
                            margin: const EdgeInsets.only(bottom: 10),
                            decoration: BoxDecoration(
                              borderRadius: BorderRadius.circular(20),
                              border: Border.all(
                                color: const Color(0xffF0F5F9),
                                width: 1,
                              ),
                            ),
                            child: ListTile(
                              onTap: widget._checkAnswers
                                  ? null
                                  : () {
                                      setState(() {
                                        length = index;
                                        _examAnswers.updateAnswer(
                                            length!, widget._qNum);
                                      });
                                    },
                              title: Text(choices[index]['title']),
                              textColor: const Color(0xffF0F5F9),
                              trailing: widget._checkAnswers
                                  ? _trueFalseAnswer(index, choices)
                                  : Radio(
                                      fillColor: MaterialStateColor.resolveWith(
                                          (states) => const Color(0xffF0F5F9)),
                                      groupValue: length,
                                      value: index,
                                      onChanged: (int? val) {
                                        setState(() {
                                          length = val!;
                                          _examAnswers.updateAnswer(
                                              length!, widget._qNum);
                                        });
                                      },
                                    ),
                            ),
                          ),
                        ),
                      ),
                    ),
                  );
                },
              ),
            ),
        ],
      ),
    );
  }
}
