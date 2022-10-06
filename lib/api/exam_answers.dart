import './answer.dart';


class ExamAnswers {
  static final ExamAnswers _examAnswers = ExamAnswers();
  ExamAnswers(){}
  static ExamAnswers getInstance() => _examAnswers;

  final List<Answer> _asnwers = [];
  List<Answer> get asnwers => _asnwers;

  int grade = 0;

  void evaluateGrade(){
    for(int i = 0;i<_asnwers.length;i++){
      int choiceNum = _asnwers[i].choiceNum;
      if(choiceNum < 0){
        continue;
      }
      int index = _asnwers[i].question.choices.indexWhere((element) => element['answer'] == true);
      if(index == choiceNum){
        grade++;
      }
    }
  }

  void clearAswers(){
    grade = 0;
    _asnwers.clear();
  }

  void addAnswer(Answer ans){
    _asnwers.add(ans);
  }
  void deleteAnswer(){
    _asnwers.removeLast();
  }
  void updateAnswer(int choiceNum,int index){
    _asnwers[index].choiceNum = choiceNum;
  }
}