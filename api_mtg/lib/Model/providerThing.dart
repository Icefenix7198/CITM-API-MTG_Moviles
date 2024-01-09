import 'package:flutter/foundation.dart';

enum Idioma {
  spanish,
  catalan,
  english,
}

class GlobalInfo extends ChangeNotifier {
  String name;
  String username;
  bool private;
  bool darkMode;
  Idioma language;

  GlobalInfo({
    required this.name,
    required this.username,
    required this.private,
    required this.darkMode,
    required this.language,
  });

  void setDarkMode(bool newValue) {
    darkMode = newValue;
    notifyListeners();
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setUserName(String text) {
    username = text;
    notifyListeners();
  }
}
