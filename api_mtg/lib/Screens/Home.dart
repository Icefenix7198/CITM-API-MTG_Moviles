import 'package:api_mtg/Model/providerThing.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/card_grid_home.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromRGBO(33, 30, 30, 0.965)
          : const Color.fromARGB(246, 227, 207, 207),
      body: (globalInfo.tspList.isEmpty)
          ? FutureBuilder(
              future: Future.wait(
                  [apiLoadTSP(), apiLoadLRW(), apiLoadALA(), apiLoadNPH()]),
              builder: (
                BuildContext context,
                AsyncSnapshot<List<List<MtgCard>>> snapshot,
              ) {
                //Builder
                if (!snapshot.hasData) {
                  return Center(
                    child: Column(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        const CircularProgressIndicator(
                          color: Colors.white,
                        ),
                        Padding(
                          padding: const EdgeInsets.all(16),
                          child: Text(
                            "Loading API",
                            style: TextStyle(
                              color: (globalInfo.darkMode)
                                  ? Colors.white
                                  : Colors.black,
                            ),
                          ),
                        )
                      ],
                    ),
                  );
                }
                if (globalInfo.tspList.isEmpty)
                  globalInfo.tspList = snapshot.data![0];

                return _CardList(cardListSearch: globalInfo.tspList);
              },
            )
          : _CardList(cardListSearch: globalInfo.tspList),
    );
  }
}

// ignore: must_be_immutable
class _CardList extends StatefulWidget {
  _CardList({
    required this.cardListSearch,
  });
  List<MtgCard> cardListSearch;
  @override
  State<_CardList> createState() => _CardListState();
}

class _CardListState extends State<_CardList> {
  final controller = TextEditingController();
  late List<MtgCard> listFiltered;
  @override
  void initState() {
    listFiltered = [];
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Center(
      child: Column(
        children: [
          const _Header(),
          Expanded(
            flex: 70,
            child: CardGridHome(
              cardList:
                  listFiltered.isEmpty ? widget.cardListSearch : listFiltered,
            ),
          ),
          const NavigatorBar(
            actualScreen: NavScreens.home,
          )
        ],
      ),
    );
  }
}

//Parte de arriba
class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Row(
      children: [
        Expanded(
          child: Container(
            padding: const EdgeInsets.all(10),
            decoration: const BoxDecoration(
              color: Color.fromARGB(255, 201, 83, 81),
            ),
            child: const Align(
              alignment: Alignment.centerLeft,
              child: Text(
                "Home",
                style: TextStyle(fontSize: 50, color: Colors.white),
              ),
            ),
          ),
        ),
      ],
    );
  }
}
