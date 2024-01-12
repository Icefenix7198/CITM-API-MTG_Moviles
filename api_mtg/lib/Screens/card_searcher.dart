import 'package:api_mtg/Model/global_provider.dart';
import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';
import 'package:provider/provider.dart';

class ApiDataLoadApp extends StatefulWidget {
  const ApiDataLoadApp({super.key});

  @override
  State<ApiDataLoadApp> createState() => _ApiDataLoadAppState();
}

class _ApiDataLoadAppState extends State<ApiDataLoadApp> {
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

  void checkFavourites(List<MtgCard> favList, List<MtgCard> collectionList) {
    for (int i = 0; i < collectionList.length; i++) {
      for (int j = 0; j < favList.length; j++) {
        if (collectionList[i].name == favList[j].name) {
          collectionList[i].isFav = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromRGBO(33, 30, 30, 0.965)
          : const Color.fromARGB(246, 227, 207, 207),
      body: (globalInfo.displayedList.isEmpty)
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
                globalInfo.tspList = snapshot.data![0];
                globalInfo.lrwList = snapshot.data![1];
                globalInfo.alaList = snapshot.data![2];
                globalInfo.nphList = snapshot.data![3];
                globalInfo.displayedList = List.from(globalInfo.tspList);
                checkFavourites(
                    globalInfo.favoriteCards,
                    globalInfo
                        .tspList); //Check all the favourite cards when loading APIs, that information is not retrieved from the API
                checkFavourites(globalInfo.favoriteCards, globalInfo.lrwList);
                checkFavourites(globalInfo.favoriteCards, globalInfo.alaList);
                checkFavourites(globalInfo.favoriteCards, globalInfo.nphList);
                return const _CardFilter();
              },
            )
          : const _CardFilter(),
    );
  }
}

class _CardFilter extends StatefulWidget {
  const _CardFilter();
  @override
  State<_CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<_CardFilter> {
  final controller = TextEditingController();
  late List<MtgCard> listFiltered;
  final List<String> images = [
    "assets/tsp.png",
    "assets/lrw.png",
    "assets/ala.png",
    "assets/nph.png",
  ];
  @override
  void initState() {
    listFiltered = [];
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(AssetImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
        final globalInfo = context.watch<GlobalInfo>();

    return Center(
      child: Column(
        children: [
          const _Header(),
          searcher(),
          carousel(),
          Expanded(
            flex: 70,
            child: CardGrid(
              cardList:
                  listFiltered.isEmpty ? globalInfo.displayedList : listFiltered,
            ),
          ),
          const NavigatorBar(
            actualScreen: NavScreens.colection,
          )
        ],
      ),
    );
  }

  Padding searcher() {
    final globalInfo = context.watch<GlobalInfo>();
    return Padding(
      padding: const EdgeInsets.only(left: 20, right: 20),
      child: Container(
        decoration: BoxDecoration(
          borderRadius: const BorderRadius.all(Radius.circular(15)),
          border: Border.all(
            color: (globalInfo.darkMode) ? Colors.white : Colors.black,
            width: 2,
          ),
        ),
        padding: const EdgeInsets.only(bottom: 10, left: 10, right: 10),
        child: Align(
          alignment: Alignment.center,
          child: TextField(
            controller: controller,
            onChanged: (_) {
              setState(() {
                final search = controller.text.toLowerCase();
                listFiltered = globalInfo.displayedList
                    .where((cardMtg) =>
                        cardMtg.name.toLowerCase().contains(search) ||
                        cardMtg.type.toLowerCase().contains(search))
                    .toList();
              });
            },
            cursorColor: (globalInfo.darkMode) ? Colors.white : Colors.black,
            style: TextStyle(
              color: (globalInfo.darkMode) ? Colors.white : Colors.black,
            ),
            decoration: InputDecoration(
              prefixIcon: Icon(
                Icons.search,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
              prefixIconColor:
                  (globalInfo.darkMode) ? Colors.white : Colors.black,
              hintText: "Search Cards",
              hintStyle: TextStyle(
                color: (globalInfo.darkMode)
                    ? const Color.fromARGB(255, 155, 153, 153)
                    : const Color.fromARGB(255, 75, 74, 74),
              ),
            ),
          ),
        ),
      ),
    );
  }

  CarouselSlider carousel() {
    final globalInfo = context.watch<GlobalInfo>();
    return CarouselSlider.builder(
      itemCount: images.length,
      options: CarouselOptions(
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIdx) {
        return GestureDetector(
          onTap: () {
            setState(() {
              switch (index) {
                case 0:
                  globalInfo.displayedList = List.from(globalInfo.tspList);
                  break;
                case 1:
                  globalInfo.displayedList = List.from(globalInfo.lrwList);
                  break;
                case 2:
                  globalInfo.displayedList = List.from(globalInfo.alaList);
                  break;
                case 3:
                  globalInfo.displayedList = List.from(globalInfo.nphList);
                  break;
              }
              listFiltered = List.from(globalInfo.displayedList);
              controller.clear();
            });
          },
          child: Padding(
            padding: const EdgeInsets.all(20.0),
            child: Container(
                width: 600,
                decoration: BoxDecoration(
                  border: Border.all(
                    width: 7.5,
                    color: (globalInfo.darkMode)
                        ? const Color.fromARGB(255, 97, 94, 94)
                        : const Color.fromARGB(255, 169, 164, 164),
                  ),
                  borderRadius: const BorderRadius.all(Radius.circular(10.0)),
                ),
                child: Image.asset(images[index], fit: BoxFit.fill)),
          ),
        );
      },
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();
    return Row(
      children: [
        Expanded(
          flex: 10,
          child: Container(
            padding: const EdgeInsets.all(20.0),
            child: Text(
              "Discover",
              style: TextStyle(
                fontSize: 40,
                fontWeight: FontWeight.bold,
                color: (globalInfo.darkMode) ? Colors.white : Colors.black,
              ),
            ),
          ),
        ),
      ],
    );
  }
}
