import 'package:api_mtg/Model/global_provider.dart';
import 'package:api_mtg/widgets/card_grid.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:api_mtg/widgets/tab_bar.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';
import 'package:provider/provider.dart';
import 'package:api_mtg/Model/deck.dart';

class UserScreen extends StatelessWidget {
  const UserScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromRGBO(33, 30, 30, 0.965)
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
                Padding(
                  padding: const EdgeInsets.only(top: 8.0),
                  child: Text(
                    globalInfo.name,
                    style: const TextStyle(color: Colors.white),
                  ),
                ),
                Text(
                  globalInfo.username,
                  style: TextStyle(
                      color: (globalInfo.darkMode)
                          ? const Color.fromARGB(255, 158, 158, 158)
                          : const Color.fromARGB(255, 56, 56, 56),
                      fontSize: 12),
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
                      color: (globalInfo.darkMode)
                          ? const Color.fromARGB(255, 53, 53, 53)
                          : const Color.fromARGB(255, 156, 156, 156),
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
                  const NavigatorBar(
                    actualScreen: NavScreens.user,
                  ),
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
    final globalInfo = Provider.of<GlobalInfo>(context, listen: false);

    loadFavoriteList().then((loadedFavoriteList) {
      setState(() {
        globalInfo.favoriteCards = loadedFavoriteList;
      });
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return CardGrid(cardList: globalInfo.favoriteCards);
  }
}

class DecksView extends StatelessWidget {
  const DecksView({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    return FutureBuilder(
      future: readDeckListFromJsonFile(),
      builder: (context, snapshot) {
        if (snapshot.hasError) {
          return ErrorWidget(snapshot.error.toString());
        }
        if (!snapshot.hasData) {
          return const Center(
            child: CircularProgressIndicator(),
          );
        }
        final deckList = snapshot.data!;
        return DecksWidget(deckList: deckList);
      },
    );
  }
}

class DecksWidget extends StatefulWidget {
  const DecksWidget({
    super.key,
    required this.deckList,
  });

  final List<Deck> deckList;

  @override
  State<DecksWidget> createState() => _DecksWidgetState();
}

class _DecksWidgetState extends State<DecksWidget> {
  @override
  Widget build(BuildContext context) {
    return GridView.count(
      crossAxisCount: 2,
      padding: const EdgeInsets.all(10),
      crossAxisSpacing: 20,
      mainAxisSpacing: 10,
      children: [
        for (final deck in widget.deckList)
          GestureDetector(
            onTap: () {
              Navigator.of(context)
                  .pushNamed("/home/user/deck", arguments: deck);
            },
            child: DeckUnit(
              deckname: deck.name,
              decknum: deck.numCards,
            ),
          ),
      ],
    );
  }
}

class DeckUnit extends StatefulWidget {
  const DeckUnit({
    super.key,
    this.deckname = "Deck Name",
    required this.decknum,
  });

  final String deckname;
  final String decknum;

  @override
  State<DeckUnit> createState() => _DeckUnitState();
}

class _DeckUnitState extends State<DeckUnit> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return SizedBox(
        child: Column(
      children: [
        Expanded(
          flex: 29,
          child: Container(
            color: (globalInfo.darkMode)
                ? const Color.fromARGB(255, 53, 53, 53)
                : const Color.fromARGB(255, 156, 156, 156),
            child: Align(
              alignment: Alignment.bottomLeft,
              child: Padding(
                padding: const EdgeInsets.only(bottom: 4),
                child: Text(
                  widget.deckname,
                  style: TextStyle(
                      color:
                          (globalInfo.darkMode) ? Colors.white : Colors.black,
                      fontSize: 18),
                ),
              ),
            ),
          ),
        ),
        Expanded(
          flex: 55,
          child: Container(
            color: Colors.black,
            child: const Image(
              image: AssetImage("assets/icon_deck.jpg"),
              fit: BoxFit.fill,
            ),
          ),
        ),
        Expanded(
          flex: 15,
          child: Container(
            color: const Color.fromARGB(255, 53, 53, 53),
            child: Align(
              alignment: Alignment.topLeft,
              child: Text(
                "${widget.decknum}  cards",
                style: TextStyle(
                    color:
                        (globalInfo.darkMode) ? Colors.white70 : Colors.black87,
                    fontSize: 12),
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
    final globalInfo = context.watch<GlobalInfo>();
    return Container(
      width: 65,
      height: 53,
      decoration: BoxDecoration(
        color: (globalInfo.darkMode)
            ? const Color.fromARGB(255, 46, 46, 46)
            : const Color.fromARGB(255, 196, 196, 196),
        borderRadius: BorderRadius.circular(10),
      ),
      child: Stack(
        children: [
          Align(
            alignment: const Alignment(0, -0.5),
            child: Text(
              "$num",
              style: TextStyle(
                  color: (globalInfo.darkMode) ? Colors.white : Colors.black,
                  fontSize: 16),
            ),
          ),
          Align(
            alignment: const Alignment(0, 0.5),
            child: Text(
              text,
              style: TextStyle(
                  color: (globalInfo.darkMode) ? Colors.white : Colors.black,
                  fontSize: 11),
            ),
          ),
        ],
      ),
    );
  }
}
