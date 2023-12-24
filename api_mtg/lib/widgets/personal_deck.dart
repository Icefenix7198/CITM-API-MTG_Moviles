import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

// ignore: must_be_immutable
class PersonalDeck extends StatelessWidget {
  PersonalDeck(
      {super.key, required this.ListCards, required this.CardsSelected});

  List<MtgCard> ListCards;
  List<int> CardsSelected;

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[0]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[0]].cardImg),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[1]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[1]].cardImg),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[2]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[2]].cardImg),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[3]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[3]].cardImg),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[4]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[4]].cardImg),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      // Pass card reference
                      Navigator.of(context).pushNamed(
                        "/home/api/card",
                        arguments: ListCards[CardsSelected[5]],
                      );
                    },
                    child: Container(
                      padding: EdgeInsets.all(4),
                      child: Image(
                        image:
                            NetworkImage(ListCards[CardsSelected[5]].cardImg),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
        ],
      ),
    );
  }
}
