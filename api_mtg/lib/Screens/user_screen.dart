import 'package:api_mtg/Model/providerThing.dart';
import 'package:api_mtg/main.dart';
import 'package:api_mtg/widgets/TabBarCards.dart';
import 'package:api_mtg/widgets/card_grid.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';
import 'package:provider/provider.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: Column(
        children: [
          Expanded(
            flex: 50,
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
                Text(
                  globalInfo.name,
                  style: const TextStyle(color: Colors.white),
                ),
                Text(
                  globalInfo.username,
                  style: const TextStyle(
                      color: Color.fromARGB(255, 158, 158, 158), fontSize: 12),
                ),
                const Padding(
                  padding: EdgeInsets.only(top: 10),
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
            flex: 50,
            child: DefaultTabController(
              length: 2,
              child: Column(
                children: [
                  const Padding(
                    padding: EdgeInsets.only(bottom: 7),
                    child: SizedBox(
                      height: 25,
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
                      child: const TabBarView(
                        children: <Widget>[
                          Cards(),
                          DecksView(),
                          /*GridView.count(
                            crossAxisCount: 2,
                            children: const [
                             
                            ],
                          )*/
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

class DecksView extends StatefulWidget {
  const DecksView({
    super.key,
  });

  @override
  State<DecksView> createState() => _DecksViewState();
}

class _DecksViewState extends State<DecksView> {
  @override
  Widget build(BuildContext context) {
    return Decks();
  }
}

class Decks extends StatefulWidget {
  Decks({
    super.key,
  });

  @override
  State<Decks> createState() => _DecksState();
}

class _DecksState extends State<Decks> {
  var num = 0;
  bool showText = false;
  final textController = TextEditingController();

  @override
  void dispose() {
    textController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        Container(
          height: 40,
          color: Colors.cyan,
          child: Row(
            mainAxisSize: MainAxisSize.max,
            children: [
              SizedBox(
                width: 100,
                height: 20,
                child: showText
                    ? TextField(
                        controller: textController,
                      )
                    : null,
              ),
              GestureDetector(
                onTap: () {
                  setState(() {
                    showText = true;
                    num = num + 1;
                  });
                },
                child: const Icon(CupertinoIcons.plus),
              ),
            ],
          ),
        ),
        Expanded(
          child: GridView.count(
            crossAxisCount: 2,
            padding: const EdgeInsets.all(10),
            crossAxisSpacing: 20,
            mainAxisSpacing: 10,
            children: [
              for (int i = 0; i < num; i++)
                GestureDetector(
                  onTap: () {
                    Navigator.of(context).pushNamed("/home/user/deck");
                  },
                  child: DeckUnit(deckname: textController.text),
                ),
            ],
          ),
        ),
      ],
    );
  }
}

class DeckUnit extends StatelessWidget {
  const DeckUnit({
    super.key,
    this.deckname = "Deck Name",
  });

  final String deckname;

  @override
  Widget build(BuildContext context) {
    return SizedBox(
        child: Column(
      children: [
        Expanded(
          flex: 29,
          child: Container(
            color: const Color.fromARGB(255, 53, 53, 53),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: EdgeInsets.only(bottom: 4),
                child: Text(
                  deckname,
                  style: TextStyle(color: Colors.white, fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 55,
          child: Container(color: Colors.blue),
        ),
        Expanded(
          flex: 15,
          child: Container(
            color: const Color.fromARGB(255, 53, 53, 53),
            child: const Align(
              alignment: Alignment.topLeft,
              child: Text(
                "num cards",
                style: TextStyle(color: Colors.white70, fontSize: 12),
              ),
            ),
          ),
        ),
      ],
    ));
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
              style: const TextStyle(color: Colors.white, fontSize: 16),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Text(
              text,
              style: const TextStyle(color: Colors.white, fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
