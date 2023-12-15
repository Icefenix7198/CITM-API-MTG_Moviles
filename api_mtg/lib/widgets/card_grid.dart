import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

const double cardWidth = 200;
const double cardHeight = 200;
const double cardPadding = 20;

class CardGrid extends StatefulWidget {
  const CardGrid({
    super.key,
    required this.cardList,
  });

  final List<MtgCard> cardList;

  @override
  State<CardGrid> createState() => _CardGridState();
}

//TO_DO: hacer bonito
class _CardGridState extends State<CardGrid> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double numberCards = constraints.maxWidth / (cardWidth+cardPadding);
          return _gridBuilder(numberCards.round());
      },
    );
  }

  Color _cardColor(MtgCard card) {
    Color cardColor = Colors.yellow;
    switch (card.colors) {
      case "W":
        cardColor = Colors.white;
        break;
      case "U":
        cardColor = Colors.blue;
        break;
      case "B":
        cardColor = const Color.fromARGB(255, 103, 5, 121);
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

  GridView _gridBuilder(int axisCount) {
    return GridView.builder(
      itemCount: widget.cardList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
      ),
      padding: const EdgeInsets.all(cardPadding),
      itemBuilder: (context, index) {
        return GestureDetector(
          onTap: () {
            // Pass card reference
            Navigator.of(context).pushNamed(
              "/home/api/card",
              arguments: widget.cardList[index],
            );
          },
          child: Card(
            child: Container(
              width: cardWidth,
              height: cardHeight, 
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(10)),
                color: _cardColor(widget.cardList[index]),
              ),
              child: Column(
                children: [
                  Image(image: NetworkImage(widget.cardList[index].cropImg)),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                    children: [
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(widget.cardList[index].name)),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(widget.cardList[index].manaCost)),
                    ],
                  ),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(widget.cardList[index].type)),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
