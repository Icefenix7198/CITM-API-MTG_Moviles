import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';

List<MtgCard> tspList = [];
List<MtgCard> lrwList = [];
List<MtgCard> alaList = [];
List<MtgCard> nphList = [];
List<MtgCard> displayedList = [];

class ApiDataLoadApp extends StatefulWidget {
  const ApiDataLoadApp({super.key});

  @override
  State<ApiDataLoadApp> createState() => _ApiDataLoadAppState();
}

class _ApiDataLoadAppState extends State<ApiDataLoadApp> {
  @override
  void initState() {
    loadFavoriteList().then((loadedFavoriteList) {
      setState(() {
        favoriteCards = loadedFavoriteList; //TODO: poner en home carga api
      });
    });
    super.initState();
  }

  void checkFavourites(List<MtgCard> collectionList) {
    for (int i = 0; i < collectionList.length; i++) {
      for (int j = 0; j < favoriteCards.length; j++) {
        if (collectionList[i].name == favoriteCards[j].name) {
          collectionList[i].isFav = true;
        }
      }
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromRGBO(33, 30, 30, 0.965),
      body: FutureBuilder(
        future: Future.wait(
            [apiLoadTSP(), apiLoadLRW(), apiLoadALA(), apiLoadNPH()]),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<List<MtgCard>>> snapshot,
        ) {
          //Builder
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
          tspList = snapshot.data![0];
          lrwList = snapshot.data![1];
          alaList = snapshot.data![2];
          nphList = snapshot.data![3];
          displayedList = List.from(tspList);
          checkFavourites(tspList);
          checkFavourites(lrwList);
          checkFavourites(alaList);
          checkFavourites(nphList);
          return _CardFilter(cardListSearch: displayedList);
        },
      ),
    );
  }
}

class _CardFilter extends StatefulWidget {
  _CardFilter({
    required this.cardListSearch,
  });
  List<MtgCard> cardListSearch;
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
    listFiltered = List.from(displayedList);
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
    return Center(
      child: Column(
        children: [
          Row(
            children: [
              Expanded(
                flex: 10,
                child: Container(
                  padding: const EdgeInsets.all(20.0),
                  child: const Text(
                    "Discover",
                    style: TextStyle(
                      fontSize: 40,
                      fontWeight: FontWeight.bold,
                      color: Colors.white,
                    ),
                  ),
                ),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20),
            child: Container(
              decoration: BoxDecoration(
                borderRadius: const BorderRadius.all(Radius.circular(15)),
                border: Border.all(
                  color: Colors.white,
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
                      listFiltered = widget.cardListSearch
                          .where((cardMtg) =>
                              cardMtg.name.toLowerCase().contains(search) ||
                              cardMtg.type.toLowerCase().contains(search))
                          .toList();
                    });
                  },
                  cursorColor: Colors.white,
                  style: const TextStyle(color: Colors.white),
                  decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.search),
                    prefixIconColor: Colors.white,
                    hintText: "Search Cards",
                    hintStyle:
                        TextStyle(color: Color.fromARGB(255, 155, 153, 153)),
                  ),
                ),
              ),
            ),
          ),
          CarouselSlider.builder(
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
                        widget.cardListSearch = List.from(tspList);
                        break;
                      case 1:
                        widget.cardListSearch = List.from(lrwList);
                        break;
                      case 2:
                        widget.cardListSearch = List.from(alaList);
                        break;
                      case 3:
                        widget.cardListSearch = List.from(nphList);
                        break;
                    }
                    listFiltered = List.from(widget.cardListSearch);
                    controller.clear();
                  });
                },
                child: Padding(
                  padding: const EdgeInsets.all(20.0),
                  child: SizedBox(
                      width: 600,
                      child: Image.asset(images[index], fit: BoxFit.contain)),
                ),
              );
            },
          ),
          Expanded(
            flex: 70,
            child: CardGrid(
              cardList: listFiltered,
            ),
          ),
          const NavigatorBar(
            actualScreen: NavScreens.colection,
          )
        ],
      ),
    );
  }
}
