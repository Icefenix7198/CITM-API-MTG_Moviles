import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:carousel_slider/carousel_slider.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';

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
          final tspList = snapshot.data![0];
          final lrwList = snapshot.data![1];
          final alaList = snapshot.data![2];
          final nphList = snapshot.data![3];
          checkFavourites(tspList);
          checkFavourites(lrwList);
          checkFavourites(alaList);
          checkFavourites(nphList);
          return _CardFilter(cardList: tspList);
        },
      ),
    );
  }
}

class _CardFilter extends StatefulWidget {
  const _CardFilter({
    required this.cardList,
  });
  final List<MtgCard> cardList;

  @override
  State<_CardFilter> createState() => _CardFilterState();
}

class _CardFilterState extends State<_CardFilter> {
  final controller = TextEditingController();
  late List<MtgCard> oneListFiltered;

  @override
  void initState() {
    oneListFiltered = List.from(widget.cardList);
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
                      oneListFiltered = widget.cardList
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
          const CollectionCarousel(),
          Expanded(
            flex: 70,
            child: CardGrid(
              cardList: oneListFiltered,
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
  const CollectionCarousel({super.key});

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
        return SizedBox(
            width: 600,
            child: Image.asset(images[index], fit: BoxFit.contain));
      },
    );
  }
}
