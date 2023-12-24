import 'package:api_mtg/Model/card.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/personal_deck.dart';
import 'package:flutter/material.dart';

class UserScreenDeck extends StatefulWidget {
  const UserScreenDeck({super.key});

  @override
  State<UserScreenDeck> createState() => _UserScreenDeckState();
}

class _UserScreenDeckState extends State<UserScreenDeck> {
  List<int> cartsToChoose = [0, 1, 2, 3, 4, 5];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 30, 30, 0.965),
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<MtgCard>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  CircularProgressIndicator(
                    color: Colors.white,
                  ),
                  Padding(
                    padding: EdgeInsets.all(16),
                    child: Text(
                      "Loading API",
                      style: TextStyle(
                        color: Colors.white,
                      ),
                    ),
                  )
                ],
              ),
            );
          }
          final userList = snapshot.data!;
          // ignore: non_constant_identifier_names
          List<int> CountedMana = counterCart(cartsToChoose, userList);
          return Column(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  color: const Color.fromRGBO(33, 30, 30, 0.965),
                  child: Stack(
                    children: [
                      Align(
                        alignment: Alignment.centerLeft,
                        child: IconButton(
                          icon: const Icon(
                            Icons.arrow_back,
                            color: Colors.grey,
                            size: 40,
                          ),
                          onPressed: () => Navigator.of(context).pop(),
                        ),
                      ),
                      const Align(
                        alignment: Alignment.center,
                        child: FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "My Deck",
                            style: TextStyle(color: Colors.white, fontSize: 35),
                          ),
                        ),
                      ),

                      /*Align(
                        alignment: Alignment.topRight,
                        child: Container(
                          padding: const EdgeInsets.all(12),
                          child: const Icon(
                            Icons.edit,
                            color: Colors.white,
                            size: 40,
                          ),
                        ),
                      ),*/
                    ],
                  ),
                ),
              ),
              Expanded(
                flex: 45,
                child: Container(
                  color: const Color.fromRGBO(33, 30, 30, 0.965),
                  child: Stack(
                    children: [
                      Center(
                        child: Column(
                          children: [
                            Expanded(
                              flex: 70,
                              child: SizedBox(
                                child: Row(
                                  mainAxisAlignment: MainAxisAlignment.center,
                                  children: [
                                    const Spacer(),
                                    Expanded(
                                      flex: 3,
                                      child: Column(
                                        mainAxisAlignment:
                                            MainAxisAlignment.center,
                                        children: [
                                          Expanded(
                                            flex: 80,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceEvenly,
                                              children: [
                                                for (int i = 0; i < 6; i++)
                                                  Expanded(
                                                    child: Container(
                                                      padding:
                                                          const EdgeInsets.all(
                                                              4),
                                                      child: Column(
                                                        children: [
                                                          Expanded(
                                                              flex: CountedMana[
                                                                          i] ==
                                                                      0
                                                                  ? 99
                                                                  : 6 -
                                                                      CountedMana[
                                                                          i],
                                                              child: Container(
                                                                child: Center(
                                                                  child: Text(
                                                                    "${CountedMana[i]}",
                                                                    style: TextStyle(
                                                                        color: Colors
                                                                            .white),
                                                                  ),
                                                                ),
                                                              )),
                                                          Expanded(
                                                            flex: CountedMana[
                                                                        i] ==
                                                                    0
                                                                ? 1
                                                                : CountedMana[
                                                                    i],
                                                            child: Container(
                                                              decoration:
                                                                  BoxDecoration(
                                                                border:
                                                                    Border.all(
                                                                  color: const Color(
                                                                      0xFFF05A22),
                                                                  style:
                                                                      BorderStyle
                                                                          .solid,
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
                                          Expanded(
                                            flex: 20,
                                            child: Row(
                                              mainAxisAlignment:
                                                  MainAxisAlignment.spaceAround,
                                              children: [
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(6),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "1-",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "2",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "3",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "4",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(8),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "5",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                                Container(
                                                  padding:
                                                      const EdgeInsets.all(0),
                                                  child: Stack(
                                                    children: [
                                                      Container(
                                                        padding:
                                                            EdgeInsets.all(4),
                                                        decoration:
                                                            const BoxDecoration(
                                                                shape: BoxShape
                                                                    .circle,
                                                                color: Colors
                                                                    .white),
                                                        child: Text(
                                                          "6+",
                                                          style: TextStyle(
                                                              color: Colors
                                                                  .purple),
                                                        ),
                                                      ),
                                                    ],
                                                  ),
                                                ),
                                              ],
                                            ),
                                          ),
                                        ],
                                      ),
                                    ),
                                    const Spacer(),
                                  ],
                                ),
                              ),
                            ),
                            const Align(
                              alignment: Alignment.center,
                              child: FittedBox(
                                fit: BoxFit.contain,
                                child: Text(
                                  "Mana Cost",
                                  style: TextStyle(
                                      color: const Color(0xFFF05A22),
                                      fontSize: 20),
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
                  padding: EdgeInsets.all(16),
                  color: const Color.fromARGB(246, 53, 51, 51),
                  child: Container(
                    color: const Color.fromARGB(255, 33, 29, 29),
                    child: PersonalDeck(
                        ListCards: userList, CardsSelected: cartsToChoose),
                  ),
                ),
              ),
            ],
          );
        },
      ),
    );
  }
}

List<int> counterCart(
    List<int> choosedCarts,
    // ignore: non_constant_identifier_names
    List<MtgCard> CardList) {
  final List<int> CountedList = [];

  String str = CardList[choosedCarts[0]].manaCost;
  String aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

  str = CardList[choosedCarts[1]].manaCost;
  aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

  str = CardList[choosedCarts[2]].manaCost;
  aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

  str = CardList[choosedCarts[3]].manaCost;
  aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

  str = CardList[choosedCarts[4]].manaCost;
  aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

  str = CardList[choosedCarts[5]].manaCost;
  aStr = str.replaceAll(new RegExp(r'[^0-9]'), '');
  CountedList.add(int.parse(aStr));

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
