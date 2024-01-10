import 'package:api_mtg/Model/card.dart';
import 'dart:convert';

import 'package:flutter/services.dart';

class Deck {
  String name;
  String numCards;
  List<MtgCard> cards;

  Deck(this.name, this.numCards, this.cards);

  Deck.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        numCards = json["numCards"],
        cards = (json["cards"] as List)
            .map((card) => MtgCard.fromJson(card))
            .cast<MtgCard>()
            .toList();

  Map<String, dynamic> toJson() => {
        "name": name,
        "numCards": numCards,
        "cards": List<dynamic>.from(cards.map((x) => x)),
      };
}

Future<List<Deck>> readDeckListFromJsonFile() async {
  final content = await rootBundle.loadString("assets/deck.json");
  final List deck = jsonDecode(content);
  return deck.map((deckJson) => Deck.fromJson(deckJson)).toList();
}
