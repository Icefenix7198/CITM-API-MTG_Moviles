import 'package:api_mtg/Model/card.dart';
import 'package:api_mtg/Model/deck.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonalDeck extends StatelessWidget {
  PersonalDeck(
      {super.key,
      required this.ListCards,
      required this.CardsSelected,
      required this.deck});

  List<MtgCard> ListCards;
  List<int> CardsSelected;
  Deck deck;
  int i = 0;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: GridView.count(
        crossAxisCount: 3,
        padding: const EdgeInsets.all(8),
        crossAxisSpacing: 10,
        mainAxisSpacing: 5,
        children: [
          for (i = 0; i < int.parse(deck.numCards); i++)
            GestureDetector(
              onTap: () {
                // Pass card reference
                Navigator.of(context).pushNamed(
                  "/home/api/card",
                  arguments: ListCards[i - 1],
                );
              },
              child:
              Container(
                padding: EdgeInsets.all(4),
                child: Image(
                  image: NetworkImage(
                      ListCards[i].imageUris.cardImg),
                ),
              ),
            ),
        ],
      ),
    );
  }
}
