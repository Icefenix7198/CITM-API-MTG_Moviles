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
        favoriteCards = loadedFavoriteList;
      });
    });
    super.initState();
  }

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
          final oneList = snapshot.data!;
          for (int i = 0; i < oneList.length; i++) {
            for (int j = 0; j < favoriteCards.length; j++) {
              if (oneList[i].name == favoriteCards[j].name) {
                oneList[i].isFav = true;
              }
            }
          }
          return _CardFilter(cardList: oneList);
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
            padding: const EdgeInsets.only(left: 20, right: 20, bottom: 15),
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
          const Padding(
            padding: EdgeInsets.all(8.0),
            child: PrefetchImageDemo(),
          ),
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

class PrefetchImageDemo extends StatefulWidget {
  const PrefetchImageDemo({super.key});

  @override
  State<StatefulWidget> createState() {
    return _PrefetchImageDemoState();
  }
}

class _PrefetchImageDemoState extends State<PrefetchImageDemo> {
  final List<String> images = [
    "assets/one.jpg",
    "assets/mom.jpg",
    "assets/woe.png",
    "assets/lci.jpg",
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
        autoPlay: false,
        aspectRatio: 2.0,
        enlargeCenterPage: true,
      ),
      itemBuilder: (context, index, realIdx) {
        return Center(
            child: Image.asset(images[index], fit: BoxFit.cover, width: 1000));
      },
    );
  }
}
