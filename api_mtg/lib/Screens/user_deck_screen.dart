import 'package:api_mtg/Model/card.dart';
import 'package:api_mtg/Model/deck.dart';
import 'package:api_mtg/Model/global_provider.dart';
import 'package:api_mtg/widgets/personal_deck.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UserScreenDeck extends StatefulWidget {
  const UserScreenDeck({super.key});

  @override
  State<UserScreenDeck> createState() => _UserScreenDeckState();
}

class _UserScreenDeckState extends State<UserScreenDeck> {
  List<int> cartsToChoose = [0, 1, 2, 0, 1, 2];

  @override
  Widget build(BuildContext context) {
    final deck = ModalRoute.of(context)!.settings.arguments as Deck;
    final globalInfo = context.watch<GlobalInfo>();
    List<int> countedMana = counterCart(cartsToChoose, deck.cards, deck);
    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: Column(
        children: [
          UpperBox(deck: deck),
          Expanded(
            flex: 45,
            child: Container(
              color: const Color.fromRGBO(33, 30, 30, 0.965),
              child: Stack(
                children: [
                  Center(
                    child: Column(
                      children: [
                        ManaCostCards(countedMana: countedMana),
                        const Align(
                          alignment: Alignment.center,
                          child: FittedBox(
                            fit: BoxFit.contain,
                            child: Text(
                              "Mana Cost",
                              style: TextStyle(
                                  color: Color(0xFFF05A22), fontSize: 20),
                            ),
                          ),
                        ),
                        const Spacer(
                          flex: 5,
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ),
          Expanded(
            flex: 55,
            child: Container(
              padding: const EdgeInsets.all(16),
              color: const Color.fromARGB(246, 53, 51, 51),
              child: Container(
                color: const Color.fromARGB(255, 33, 29, 29),
                child: PersonalDeck(
                  ListCards: deck.cards,
                  CardsSelected: cartsToChoose,
                  deck: deck,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class UpperBox extends StatelessWidget {
  const UpperBox({
    super.key,
    required this.deck,
  });

  final Deck deck;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 10,
      child: Container(
        color: const Color.fromRGBO(33, 30, 30, 0.965),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children: [
            Expanded(
              flex: 10,
              child: FittedBox(
                fit: BoxFit.contain,
                child: IconButton(
                  icon: const Icon(
                    Icons.arrow_back,
                    color: Colors.grey,
                    size: 40,
                  ),
                  onPressed: () => Navigator.of(context).pop(),
                ),
              ),
            ),
            Expanded(
              flex: 30,
              child: FittedBox(
                fit: BoxFit.contain,
                child: Text(
                  deck.name,
                  style: const TextStyle(color: Colors.white, fontSize: 35),
                ),
              ),
            ),
            const Spacer(
              flex: 10,
            ),
          ],
        ),
      ),
    );
  }
}

class ManaCostCards extends StatelessWidget {
  const ManaCostCards({
    super.key,
    required this.countedMana,
  });

  final List<int> countedMana;

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 70,
      child: SizedBox(
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            const Spacer(),
            Expanded(
              flex: 3,
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Expanded(
                    flex: 80,
                    child: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                      children: [
                        for (int i = 0; i < 6; i++)
                          Expanded(
                            child: Container(
                              padding: const EdgeInsets.all(4),
                              child: Column(
                                children: [
                                  Expanded(
                                    flex: countedMana[i] == 0
                                        ? 99
                                        : 6 - countedMana[i],
                                    child: Center(
                                      child: Text(
                                        "${countedMana[i]}",
                                        style: const TextStyle(
                                            color: Colors.white),
                                      ),
                                    ),
                                  ),
                                  Expanded(
                                    flex: countedMana[i] == 0
                                        ? 1
                                        : countedMana[i],
                                    child: Container(
                                      decoration: BoxDecoration(
                                        border: Border.all(
                                          color: const Color(0xFFF05A22),
                                          style: BorderStyle.solid,
                                          width: 1.0,
                                        ),
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                          ),
                      ],
                    ),
                  ),
                  const CirclesOfMana(),
                ],
              ),
            ),
            const Spacer(),
          ],
        ),
      ),
    );
  }
}

class CirclesOfMana extends StatelessWidget {
  const CirclesOfMana({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return Expanded(
      flex: 20,
      child: Row(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        children: [
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(6),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "1-",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "2",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "3",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "4",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(8),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "5",
                      style: TextStyle(color: Colors.purple),
                    ),
                  ),
                ),
              ],
            ),
          ),
          Container(
            padding: const EdgeInsets.all(0),
            child: Stack(
              children: [
                Container(
                  padding: const EdgeInsets.all(4),
                  decoration: const BoxDecoration(
                      shape: BoxShape.circle, color: Colors.white),
                  child: const FittedBox(
                    fit: BoxFit.contain,
                    child: Text(
                      "6+",
                      style: TextStyle(color: Colors.purple),
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

List<int> counterCart(
    List<int> choosedCarts,
    // ignore: non_constant_identifier_names
    List<MtgCard> CardList,
    Deck deck) {
  // ignore: non_constant_identifier_names
  final List<int> CountedList = [];

  for (int i = 0; i < 6; i++) {
    if (i <= int.parse(deck.numCards)) {
      String str = CardList[choosedCarts[i]].manaCost;
      String aStr = str.replaceAll(RegExp(r'[^0-9]'), '');
      CountedList.add(int.parse(aStr));
    } else {
      CountedList.add(0);
    }
  }

  int c_1 = 0, c_2 = 0, c_3 = 0, c_4 = 0, c_5 = 0, c_6 = 0;

  for (int i = 0; i < CountedList.length; i++) {
    switch (CountedList[i]) {
      case 1:
        c_1++;
        break;
      case 2:
        c_2++;
        break;
      case 3:
        c_3++;
        break;
      case 4:
        c_4++;
        break;
      case 5:
        c_5++;
        break;
      case 6:
        c_6++;
        break;
    }
  }

  CountedList[0] = c_1;
  CountedList[1] = c_2;
  CountedList[2] = c_3;
  CountedList[3] = c_4;
  CountedList[4] = c_5;
  CountedList[5] = c_6;

  return CountedList;
}
