import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

class CardGrid extends StatefulWidget {
  const CardGrid({
    super.key,
    required this.cardList,
  });

  final List<MtgCard> cardList;

  @override
  State<CardGrid> createState() => _CardGridState();
}

class _CardGridState extends State<CardGrid> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        if (constraints.maxWidth > 600) {
          return _gridBuilder(3);
        } else {
          return _gridBuilder(2);
        }
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
      padding: const EdgeInsets.all(20),
      itemBuilder: (context, index) {
        return Card(
          child: Container(
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
        );
      },
    );
  }
}
