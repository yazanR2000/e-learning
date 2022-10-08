import 'package:http/http.dart' as http;
import 'dart:convert';
class ReadingText {
  static String? _readingText;

  static String? get readingText => _readingText;

  static Future getReadingText() async {
    if(_readingText != null){
      return;
    }
    try {
      final response = await http.get(
        Uri.parse(
            "https://e-learning-9c70e-default-rtdb.firebaseio.com/English/Reading.json"),
      );
      final data = json.decode(response.body) as Map<String,dynamic>;
      _readingText = data['text'].toString().replaceAll('\\n', "\n\n");
    } catch (err) {
      throw "err";
    }
  }
}
