import 'package:http/http.dart' as http;
import 'dart:convert';
import './question.dart';
import './base_url.dart';

class Exam {
  final String subject;
  Exam(this.subject);
  final List<Question> _questions = [];
  List<Question> get questions => _questions;

  bool didIFetchQuestions = false;

  bool checkAnswers = false;

  Future getQuestions() async {
    String? baseUrl = BaseUrl.baseUrl;
    if (didIFetchQuestions) {
      return;
    }
    try {
      String? url = baseUrl;
      if (url!.contains("e-learning")) {
        url += "/$subject/Qustions.json";
      } else {
        url += "/$subject/Questions.json";
      }
      _questions.clear();
      final response = await http.get(Uri.parse(url));
      final data = json.decode(response.body) as List<dynamic>;
      for (int i = 0; i < data.length; i++) {
        if (data[i] == null) {
          continue;
        }
        _questions.add(Question(i.toString(), data[i], subject));
      }
      if (subject != "English") {
        _questions.shuffle();
      }
      didIFetchQuestions = true;
    } catch (err) {
      throw "err";
    }
  }
}
