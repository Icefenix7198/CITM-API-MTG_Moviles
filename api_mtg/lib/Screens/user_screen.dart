import 'package:api_mtg/widgets/TabBarCards.dart';
import 'package:api_mtg/widgets/card_grid.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 30, 30, 0.965),
      body: Column(
        children: [
          Expanded(
            flex: 42,
            child: Column(
              children: [
                Align(
                  alignment: Alignment.topRight,
                  child: Padding(
                    padding: const EdgeInsets.all(7.0),
                    child: IconButton(
                      onPressed: () => {
                        {Navigator.of(context).pushNamed("/home/settings")}
                      },
                      icon: const Icon(Icons.settings,
                          color: Colors.white, size: 25),
                    ),
                  ),
                ),
                const Stack(
                  children: [
                    Center(
                      child: SizedBox(
                        height: 100,
                        width: 300,
                        child: Image(
                          image: AssetImage("assets/emry.jpg"),
                          fit: BoxFit.fitWidth,
                        ),
                      ),
                    ),
                    Center(
                      child: SizedBox(
                        height: 100,
                        child: Align(
                          alignment: Alignment.bottomCenter,
                          child: Icon(
                            Icons.account_circle,
                            color: Colors.white60,
                            size: 65,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                const Text(
                  "Name",
                  style: TextStyle(color: Colors.white),
                ),
                const Text(
                  "username",
                  style: TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158), fontSize: 12),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 12),
                  child: Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: EdgeInsets.only(right: 20),
                        child: BoxInfo(
                          num: 10,
                          text: "followers",
                        ),
                      ),
                      BoxInfo(
                        num: 10,
                        text: "following",
                      ),
                    ],
                  ),
                ),
              ],
            ),
          ),
          Expanded(
            flex: 58,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: SizedBox(
                      height: 35,
                      width: 150,
                      child: TabBarCards(
                        tabs: [
                          Tab(text: "Cards"),
                          Tab(text: "Decks"),
                        ],
                      ),
                    ),
                  ),
                  Expanded(
                    child: Container(
                      color: const Color.fromARGB(255, 53, 53, 53),
                      child: TabBarView(
                        children: <Widget>[
                          const Cards(),
                          GridView.count(
                            crossAxisCount: 2,
                            children: const [
                              Decks(),
                            ],
                          )
                        ],
                      ),
                    ),
                  ),
                  const NavigatorBar(),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}

class Cards extends StatefulWidget {
  const Cards({
    super.key,
  });

  @override
  State<Cards> createState() => _CardsState();
}

class _CardsState extends State<Cards> {
  @override
  void initState() {
    loadFavoriteList().then((loadedFavoriteList) {
      setState(() {
        favoriteCards = loadedFavoriteList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return CardGrid(cardList: favoriteCards);
  }
}

class Decks extends StatefulWidget {
  const Decks({
    super.key,
  });

  @override
  State<Decks> createState() => _DecksState();
}

class _DecksState extends State<Decks> {
  @override
  Widget build(BuildContext context) {
    return Container(
      color: Colors.red,
      child: GestureDetector(
        onTap: () {
          Navigator.of(context).pushNamed("/home/user/deck");
        },
      ),
    );
  }
}

class BoxInfo extends StatelessWidget {
  const BoxInfo({
    super.key,
    required this.num,
    required this.text,
  });
  final int num;
  final String text;

  @override
  Widget build(BuildContext context) {
    return Container(
      width: 65,
      height: 53,
      decoration: BoxDecoration(
        color: const Color.fromARGB(255, 46, 46, 46),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: Text(
              "$num",
              style: const TextStyle(color: Colors.white, fontSize: 18),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 12),
            ),
          ),
        ],
      ),
    );
  }
}
