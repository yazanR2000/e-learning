import 'package:http/http.dart' as http;
import 'dart:convert';

const String baseUrl = "https://e-learning-9c70e-default-rtdb.firebaseio.com";

class Course {
  static final Course _tutorialsInstance = Course();
  Tutorials() {}
  static Course getInstance() => _tutorialsInstance;
  String? _course;
  String? get course => _course;
  set course(String? value) {
    _course = value;
  }

  final List<Tutorial> _tutorials = [];
  List<Tutorial> get tutorials => _tutorials;

  Future getTutorial() async {
    try {
      _tutorials.clear();
      final response = await http.get(
        Uri.parse("$baseUrl/Tutorials/$_course.json"),
      );
      final data = json.decode(response.body) as List<dynamic>;
      print(data);
      data.forEach((element) {
        if (element != null) {
          _tutorials.add(Tutorial(_course!, element));
        }
      });
    } catch (err) {
      throw "err";
    }
  }
}

class Tutorial {
  final String _subject, tutorial;
  Tutorial(this._subject, this.tutorial);

  Map<String,dynamic> _details = {};
  Map<String,dynamic> get details => _details;

  bool didIFetchDetails = false;

  Future getDetails() async {
    if(didIFetchDetails){
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
