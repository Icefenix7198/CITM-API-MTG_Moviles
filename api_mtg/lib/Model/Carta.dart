import 'dart:ffi';

class Carta {
  String name;
  String type;
  String artist;
  Int convManaCost;
  List<String> colors;
  String rules;
  String avatarUrl;
  List<Double> prices;
  Double moneyAux;

  Carta.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["type_line"],
        convManaCost = json["cmc"],
        colors = json["colors"],
        artist = json["artist"],
        rules = json["oracle_text"],
        avatarUrl = json["picture"]["large"],
        moneyAux = json["dinero"]["USD"],
        prices.add(moneyAux);
}
