import 'package:http/http.dart' as http;
import 'dart:convert';
import './exam.dart';

const String baseUrl = "https://e-learning-9c70e-default-rtdb.firebaseio.com";

class Course {
  static final Course _tutorialsInstance = Course();
  Tutorials() {}
  static Course getInstance() => _tutorialsInstance;
  String? _course;
  String? get course => _course;
  set course(String? value) {
    _didIFetchInformation = false;
    _didIFetchTutorial = false;
    _course = value;
  }
  Map<String,dynamic> _courseInformation = {};
  Map<String,dynamic> get courseInformation => _courseInformation;

  final List<Tutorial> _tutorials = [];
  List<Tutorial> get tutorials => _tutorials;
  
  bool _didIFetchTutorial = false;
  Future getTutorial() async {
    if(_didIFetchTutorial){
      return;
    }
    try {
      _tutorials.clear();
      final response = await http.get(
        Uri.parse("$baseUrl/Tutorials/$_course.json"),
      );
      final data = json.decode(response.body) as List<dynamic>;
      //print(data);
      data.forEach((element) {
        if (element != null) {
          _tutorials.add(Tutorial(_course!, element));
        }
      });
      _didIFetchTutorial = true;
    } catch (err) {
      throw "err";
    }
  }

  bool _didIFetchInformation = false;
  Future getInformation() async {
    if(_didIFetchInformation){
      return;
    }
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/$_course/Information.json"),
      );
      final data = json.decode(response.body) as Map<String,dynamic>;
      _courseInformation = data;
      print(_courseInformation);
      _didIFetchInformation = true;
    } catch (err) {
      throw "err";
    }
  }
}

class Tutorial {
  final String _subject, tutorial;
  Tutorial(this._subject, this.tutorial);

  Map<String, dynamic> _details = {};
  Map<String, dynamic> get details => _details;

  bool didIFetchDetails = false;

  Future getDetails() async {
    if (didIFetchDetails) {
      return;
    }
    try {
      final response = await http.get(
        Uri.parse("$baseUrl/$_subject/Tutorial/$tutorial.json"),
      );
      final data = json.decode(response.body) as Map<String, dynamic>;
      _details = data;
      didIFetchDetails = true;
    } catch (err) {
      throw "err";
    }
  }
  
}

class Exams {
  static final Map<String, Exam> _exams = {
    'Flutter': Exam("Flutter"),
    'English': Exam("English"),
    'C++': Exam("C++")
  };
  static Map<String, Exam> get exams => _exams;
}
