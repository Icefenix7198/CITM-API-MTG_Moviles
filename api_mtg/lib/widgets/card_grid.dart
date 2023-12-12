import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatelessWidget {
  const CardGrid({
    super.key,
    required this.cardList,
  
  });

  final List<MtgCard> cardList;
  

  Color cardColor(MtgCard card) {
    Color cardColor = Colors.yellow;
    switch (card.colors) {
      case "W":
        cardColor = Colors.white;
        break;
      case "U":
        cardColor = Colors.blue;
        break;
      case "B":
        cardColor = Colors.black;
        break;
      case "R":
        cardColor = Colors.red;
        break;
      case "G":
        cardColor = Colors.green;
        break;
    }

    return cardColor;
  }

  @override
  Widget build(BuildContext context) {
    return GridView.builder(
      itemCount: cardList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
        // crossAxisSpacing: 20,
        // mainAxisSpacing: 20,
      ),
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            color: cardColor(cardList[index]),
            child: Center(
              child: Text("${cardList[index].name} ${cardList[index].artist}"),
            ),
          ),
        );
      },
    );
  }
}
