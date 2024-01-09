import 'package:flutter/foundation.dart';
import 'package:api_mtg/Model/card.dart';

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
  List<MtgCard> tspList = [];
  List<MtgCard> lrwList = [];
  List<MtgCard> alaList = [];
  List<MtgCard> nphList = [];
  List<MtgCard> displayedList = [];
  List<MtgCard> favoriteCards = [];
  
  GlobalInfo({
    required this.name,
    required this.username,
    required this.private,
    required this.darkMode,
    required this.language,
  });

  setDarkMode(bool newValue) {
    darkMode = newValue;
    notifyListeners(); //Update Real Time
  }

  void setName(String newName) {
    name = newName;
    notifyListeners();
  }

  void setUserName(String text) {
    username = text;
    notifyListeners();
  }

  void setLanguage(Idioma newIdioma) {
    language = newIdioma;
    notifyListeners();
  }
}
