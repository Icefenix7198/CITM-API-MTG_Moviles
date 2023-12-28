import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

const double cardWidth = 200;
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
        double numberCards = constraints.maxWidth / (cardWidth + cardPadding);
        return _gridBuilder(numberCards.round());
      },
    );
  }

  Color _cardColor(MtgCard card) {
    Color cardColor = Colors.yellow;
    switch (card.colors[0]) {
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
        mainAxisSpacing: 20.0,
        crossAxisSpacing: 20.0,
        childAspectRatio: 1,
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
          child: Container(
            decoration: BoxDecoration(
              borderRadius: const BorderRadius.all(Radius.circular(10)),
              color: _cardColor(widget.cardList[index]),
            ),
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 5.0),
                    child: Image(
                        image: NetworkImage(widget.cardList[index].imageUris.cropImg)),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.cardList[index].name,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(left: 5.0),
                    child: Text(
                      widget.cardList[index].type,
                      overflow: TextOverflow.ellipsis,
                      style: const TextStyle(
                        color: Colors.black,
                        fontSize: 12,
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        );
      },
    );
  }
}
