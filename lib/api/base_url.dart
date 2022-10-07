class BaseUrl {
  static String? _baseUrl;
  static String? get baseUrl => _baseUrl;
  static set setBase(String? value){
    _baseUrl = value;
  }
}