import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';
import 'package:provider/provider.dart';

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
  List<MtgCard> displayedList = [];

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
          displayedList = tspList;
          checkFavourites(tspList);
          checkFavourites(lrwList);
          checkFavourites(alaList);
          checkFavourites(nphList);
          return Provider.value(
            value: displayedList,
            child: const _CardFilter(),
          );
        },
      ),
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

  @override
  void initState() {
    List<MtgCard> cardList = context.read<List<MtgCard>>();
    listFiltered = List.from(cardList);
    super.initState();
  }

  @override
  void dispose() {
    controller.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    List<MtgCard> cardList = context.read<List<MtgCard>>();
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
          Row(
            children: [
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cardList = List.from(tspList);
                    listFiltered = List.from(cardList);
                    controller.clear();
                  });
                },
                child: const Text('ESPIRAL'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cardList = List.from(lrwList);
                    listFiltered = List.from(cardList);
                    controller.clear();
                  });
                },
                child: const Text('LORW'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cardList = List.from(alaList);
                    listFiltered = List.from(cardList);
                    controller.clear();
                  });
                },
                child: const Text('ALARA'),
              ),
              ElevatedButton(
                onPressed: () {
                  setState(() {
                    cardList = List.from(nphList);
                    listFiltered = List.from(cardList);
                    controller.clear();
                  });
                },
                child: const Text('PHY'),
              ),
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 20),
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
                      listFiltered = cardList
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

          //CollectionCarousel(listCards: cardList, listFilter: listFiltered, controller: controller),
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

class CollectionCarousel extends StatefulWidget {
  CollectionCarousel(
      {super.key,
      required this.listCards,
      required this.listFilter,
      required this.controller});

  List<MtgCard> listCards;
  List<MtgCard> listFilter;
  TextEditingController controller;

  @override
  State<StatefulWidget> createState() {
    return _CollectionCarouselState();
  }
}

class _CollectionCarouselState extends State<CollectionCarousel> {
  final List<String> images = [
    "assets/tsp.png",
    "assets/lrw.png",
    "assets/ala.png",
    "assets/nph.png",
  ];

  @override
  void initState() {
    WidgetsBinding.instance.addPostFrameCallback((_) {
      for (var imageUrl in images) {
        precacheImage(AssetImage(imageUrl), context);
      }
    });
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
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
                  widget.listCards = List.from(tspList);
                  break;
                case 1:
                  widget.listCards = List.from(lrwList);
                  break;
                case 2:
                  widget.listCards = List.from(alaList);
                  break;
                case 3:
                  widget.listCards = List.from(nphList);
                  break;
              }
              widget.listFilter = List.from(widget.listCards);
              widget.controller.clear();
            });
          },
          child: SizedBox(
              width: 600,
              child: Image.asset(images[index], fit: BoxFit.contain)),
        );
      },
    );
  }
}
