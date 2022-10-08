import 'package:http/http.dart' as http;
import 'dart:convert';
import './base_url.dart';

class Question {
  final String _qId,_subject;
  String question;
  Question(this._qId,this.question,this._subject);

  final List<Map<String,dynamic>> _choices = [];
  List<Map<String,dynamic>> get choices => _choices;

  bool didIFetchChoices = false;
  
  Future getChoices() async {
    String? baseUrl = BaseUrl.baseUrl;
    if(didIFetchChoices || (_qId == '8' && _subject =="English")){
      return;
    }
    _choices.clear();
    try{
      final response = await http.get(Uri.parse("$baseUrl/$_subject/Choices/$_qId.json"));
      final data = json.decode(response.body) as Map<String,dynamic>;
      data.forEach((key, value) {
        _choices.add({
          "title" : key,
          "answer" : value
        });
      });
      //_choices.shuffle();
      didIFetchChoices = true;
    }catch(err){
      throw "err";
    }
  }
}