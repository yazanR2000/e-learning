import 'package:http/http.dart' as http;
import './exam.dart';
import 'dart:convert';
// API Class is a Singelton Class
const String baseUrl = "https://ltuc-exams-default-rtdb.firebaseio.com";
class API{
  static final API _api = API();
  API(){}
  static API getInstance() => _api;
  
  final List<Exam> _exams = [];
  List<Exam> get exams => _exams;
  Future getExams() async {
    _exams.clear();
    try{
      final response = await http.get(Uri.parse("$baseUrl/Exams.json"));
      final data = json.decode(response.body) as List<dynamic>;
      data.forEach((element) {
        if(element != null){
          _exams.add(Exam(element));
        }
      });
      //print(_exams);
    }catch(err){
      throw "err";
    }
  }
}