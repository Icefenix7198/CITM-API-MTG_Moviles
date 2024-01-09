import 'package:api_mtg/Model/card.dart';

class Decks{
  String name; 
  String numCards; 
  List<MtgCard> cards; 

  Decks(this.name, this.numCards, this.cards);

  Decks.fromJson(Map<String, dynamic> json)
  : name = json["name"], 
  numCards = json["numCards"],
  cards = List<MtgCard>.from(json["cards"].map((x) => x));
  
  Map<String, dynamic> toJson() => {
    "name": name, 
    "numCards" : numCards, 
    "cards" : List<dynamic>.from(cards.map((x) => x)),
  };
}

