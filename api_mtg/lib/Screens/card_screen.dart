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
    return const Scaffold(
      backgroundColor: Color.fromARGB(255, 49, 49, 49),
      body: SingleChildScrollView(
        child: Column(
          children: [
            _CardAppBar(),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: _CardTitle(),
            ),
            Padding(
              padding: EdgeInsets.all(20.0),
              child: _CardImage(),
            ),
            Padding(
              padding: EdgeInsets.only(left: 15, right: 15),
              child: _CardOracle(),
            ),
            Padding(
              padding: EdgeInsets.all(10.0),
              child: _CardLowerInfo(),
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

class _CardImage extends StatelessWidget {
  const _CardImage();

  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();

    return Image(
      image: NetworkImage(cardMtg.imageUris.cardImg),
    );
  }
}

class _CardTitle extends StatelessWidget {
  const _CardTitle();

  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();

    return Text(
      cardMtg.name,
      style: const TextStyle(
        fontSize: 28,
        fontWeight: FontWeight.bold,
        color: Colors.white,
      ),
    );
  }
}

class _CardOracle extends StatelessWidget {
  const _CardOracle();

  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();

    return Container(
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
    );
  }
}

class _CardLowerInfo extends StatelessWidget {
  const _CardLowerInfo();

  @override
  Widget build(BuildContext context) {
    return const Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        Padding(
          padding: EdgeInsets.only(left: 15, bottom: 15),
          child: _CardPrice(),
        ),
        Padding(
          padding: EdgeInsets.only(right: 15.0),
          child: _CardArtist(),
        ),
      ],
    );
  }
}

class _CardArtist extends StatelessWidget {
  const _CardArtist();

  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();

    return Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: [
        const Text(
          "Artist:",
          style: TextStyle(
            color: Colors.white,
            fontWeight: FontWeight.bold,
            fontSize: 17,
          ),
        ),
        Text(
          "   ${cardMtg.artist}",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}

class _CardPrice extends StatelessWidget {
  const _CardPrice();

  @override
  Widget build(BuildContext context) {
    final MtgCard cardMtg = context.read<MtgCard>();

    return Column(
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
        Text(
          "   ${cardMtg.prices.eur} €\n   ${cardMtg.prices.usd} \$\n   ${cardMtg.prices.tix} TIX",
          style: const TextStyle(
            color: Colors.white,
          ),
        ),
      ],
    );
  }
}
