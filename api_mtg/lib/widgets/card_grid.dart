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
        cardColor = const Color.fromARGB(255, 77, 8, 89);
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
    return LayoutBuilder(
      builder: ,
      itemCount: cardList.length,
      gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: 5,
      ),
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: cardColor(cardList[index]),
            ),
            child: Column(
              children: [
                Image(image: NetworkImage(cardList[index].cropImg)),
                Row(
                  mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                  children: [
                    FittedBox(
                        fit: BoxFit.contain, child: Text(cardList[index].name)),
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text(cardList[index].manaCost)),
                  ],
                ),
                FittedBox(
                    fit: BoxFit.contain, child: Text(cardList[index].type)),
              ],
            ),
          ),
        );
      },
    );
  }
}
