import 'package:http/http.dart' as http;
import 'dart:convert';
import './question.dart';
const String baseUrl = "https://ltuc-exams-default-rtdb.firebaseio.com";
class Exam{
  final String subject;
  Exam(this.subject);
  final List<Question> _questions = [];
  List<Question> get questions => _questions;

  bool didIFetchQuestions = false;

  bool checkAnswers = false;

  Future getQuestions() async{
    if(didIFetchQuestions){
      return;
    }
    try{
      _questions.clear();
      final response = await http.get(Uri.parse("$baseUrl/$subject/Questions.json"));
      final data = json.decode(response.body) as List<dynamic>;
      for(int i = 0;i<data.length;i++){
        if(data[i] == null){
          continue;
        }
        _questions.add(Question(i.toString(),data[i], subject));
      }
      _questions.shuffle();
      didIFetchQuestions = true;
    }catch(err){
      throw "err";
    }
  }

}