import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {
  late List<MtgCard> favoriteCards;

  void addCard(MtgCard favCard) {
    setState(() {
      favoriteCards.add(favCard);
    });
    saveFavortieList(favoriteCards);
  }

  void deleteCard(MtgCard favCard) {
    setState(() {
      favoriteCards.remove(favCard);
    });
    saveFavortieList(favoriteCards);
  }

  @override
  Widget build(BuildContext context) {
    /*loadFavoriteList().then((loadedFavoriteList) {
      setState(() {
        favoriteCards = loadedFavoriteList;
      });
    });*/
    final cardSelected = ModalRoute.of(context)!.settings.arguments as MtgCard;
    return _ScreenImplementation(cardMtg: cardSelected);
  }
}

class _ScreenImplementation extends StatefulWidget {
  const _ScreenImplementation({required this.cardMtg});

  final MtgCard cardMtg;

  @override
  State<_ScreenImplementation> createState() => __ScreenImplementationState();
}

class __ScreenImplementationState extends State<_ScreenImplementation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _Header(),
            Padding(
              padding: const EdgeInsets.only(bottom: 15.0),
              child: Text(
                widget.cardMtg.name,
                style: const TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 475,
              width: 475,
              child: FittedBox(
                child: Image(
                  image: NetworkImage(widget.cardMtg.cardImg),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.all(20.0),
              child: Container(
                decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 100, 96, 96),
                  borderRadius: BorderRadius.all(Radius.circular(5)),
                ),
                child: Padding(
                  padding: const EdgeInsets.all(8.0),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Oracle text: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      Text(
                        widget.cardMtg.rules,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                Padding(
                  padding: const EdgeInsets.only(left: 30, bottom: 20),
                  child: Column(
                    crossAxisAlignment: CrossAxisAlignment.start,
                    children: [
                      const Text(
                        "Price: ",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                      FittedBox(
                        fit: BoxFit.contain,
                        child: Text(
                          "${widget.cardMtg.moneyEUR} €",
                          style: const TextStyle(
                            color: Colors.white,
                          ),
                        ),
                      ),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "${widget.cardMtg.moneyUSD} \$",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                      FittedBox(
                          fit: BoxFit.contain,
                          child: Text(
                            "${widget.cardMtg.moneyTIX} TIX",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          )),
                    ],
                  ),
                ),
                Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        "Artist:",
                        style: TextStyle(
                          color: Colors.white,
                          fontWeight: FontWeight.bold,
                          fontSize: 17,
                        ),
                      ),
                    ),
                    FittedBox(
                      fit: BoxFit.contain,
                      child: Text(
                        widget.cardMtg.artist,
                        style: const TextStyle(
                          color: Colors.white,
                        ),
                      ),
                    ),
                  ],
                ),
              ],
            ),
          ],
        ),
      ),
    );
  }
}

class _Header extends StatelessWidget {
  const _Header();

  @override
  Widget build(BuildContext context) {
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 35,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        const Icon(
          Icons.bookmark_add_outlined,
          color: Colors.red,
          size:35,
        ), //TODO: functional
      ],
    );
  }
}
