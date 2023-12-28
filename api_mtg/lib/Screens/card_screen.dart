import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class CardScreen extends StatefulWidget {
  const CardScreen({super.key});

  @override
  State<CardScreen> createState() => _CardScreenState();
}

class _CardScreenState extends State<CardScreen> {


  @override
  Widget build(BuildContext context) {
    final cardSelected = ModalRoute.of(context)!.settings.arguments as MtgCard;
    return Provider.value(
      value: cardSelected,
      child: const _ScreenImplementation(),
    );
  }
}

class _ScreenImplementation extends StatefulWidget {
  const _ScreenImplementation();

  @override
  State<_ScreenImplementation> createState() => __ScreenImplementationState();
}

class __ScreenImplementationState extends State<_ScreenImplementation> {
  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const _CardAppBar(),
            Padding(
              padding: const EdgeInsets.only(left: 15, right: 15, bottom: 15.0),
              child: Text(
                cardMtg.name,
                style: const TextStyle(
                  fontSize: 28,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
            SizedBox(
              height: 400,
              width: 400,
              child: FittedBox(
                child: Image(
                  image: NetworkImage(cardMtg.imageUris.cardImg),
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
                        cardMtg.rules,
                        style: const TextStyle(color: Colors.white),
                      ),
                    ],
                  ),
                ),
              ),
            ),
            Padding(
              padding: const EdgeInsets.only(right: 8.0, left: 8.0),
              child: Row(
                mainAxisAlignment: MainAxisAlignment.spaceBetween,
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Padding(
                    padding: const EdgeInsets.only(left: 15, bottom: 15),
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
                            "   ${cardMtg.prices.eur} €\n   ${cardMtg.prices.usd} \$\n   ${cardMtg.prices.tix} TIX",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                  Padding(
                    padding: const EdgeInsets.only(right: 15.0),
                    child: Column(
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
                            "   ${cardMtg.artist}",
                            style: const TextStyle(
                              color: Colors.white,
                            ),
                          ),
                        ),
                      ],
                    ),
                  ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}

class _CardAppBar extends StatefulWidget {
  const _CardAppBar();

  @override
  State<_CardAppBar> createState() => _CardAppBarState();
}

class _CardAppBarState extends State<_CardAppBar> {
  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();
    return Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [
        IconButton(
          icon: const Icon(
            Icons.close,
            color: Colors.grey,
            size: 40,
          ),
          onPressed: () => Navigator.of(context).pop(),
        ),
        IconButton(
          onPressed: () {
            setState(() {
              if (cardMtg.isFav) {
                cardMtg.isFav = false;
                deleteCard(cardMtg);
              } else {
                cardMtg.isFav = true;
                addCard(cardMtg);
              }
            });
          },
          icon: Icon(
            cardMtg.isFav ? Icons.bookmark_add : Icons.bookmark_add_outlined,
            color: const Color.fromARGB(255, 187, 41, 30),
            size: 40,
          ),
        ),
      ],
    );
  }
}
