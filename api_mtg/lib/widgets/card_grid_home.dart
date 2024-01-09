import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

const double cardWidth = 200;
const double cardPadding = 20;

class CardGridHome extends StatefulWidget {
  const CardGridHome({
    super.key,
    required this.cardList,
  });

  final List<MtgCard> cardList;

  @override
  State<CardGridHome> createState() => _CardGridHomeState();
}

//TODO: hacer bonito
class _CardGridHomeState extends State<CardGridHome> {
  @override
  Widget build(BuildContext context) {
    return LayoutBuilder(
      builder: (BuildContext context, BoxConstraints constraints) {
        double numberCards = constraints.maxWidth / (cardWidth + cardPadding);
        return _gridBuilder(numberCards.round());
      },
    );
  }

  GridView _gridBuilder(int axisCount) {
    return GridView.builder(
      itemCount: widget.cardList.length,
      gridDelegate: SliverGridDelegateWithFixedCrossAxisCount(
        crossAxisCount: axisCount,
        mainAxisSpacing: cardPadding,
        crossAxisSpacing: cardPadding,
        childAspectRatio: 0.65,
      ),
      //padding: const EdgeInsets.all(cardPadding),
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
            child: SingleChildScrollView(
              child: Column(
                children: [
                  Padding(
                    padding: const EdgeInsets.only(bottom: 2.0),
                    child: Image(
                        image: NetworkImage(
                            widget.cardList[index].imageUris.cardImg)),
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
