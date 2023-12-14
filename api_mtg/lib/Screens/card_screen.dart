import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

class CardScreen extends StatelessWidget {
  const CardScreen({super.key});

  @override
  Widget build(BuildContext context) {
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

//TO_DO: hacer bonito
class __ScreenImplementationState extends State<_ScreenImplementation> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: const Color.fromARGB(255, 49, 49, 49),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceBetween,
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Align(
                  child: IconButton(
                    icon: const Icon(Icons.close, color: Colors.grey),
                    onPressed: () => Navigator.of(context).pop(),
                  ),
                ),
                const Align(
                  child: Icon(Icons.bookmark_add_outlined,
                      color: Colors.red), //TODO: functional
                )
              ],
            ),
            Text(
              widget.cardMtg.name,
              style: const TextStyle(
                fontSize: 30,
                fontWeight: FontWeight.bold,
                color: Colors.white,
              ),
            ),
            Image(image: NetworkImage(widget.cardMtg.cardImg)),
            Container(
              decoration: const BoxDecoration(
                  color: Color.fromARGB(255, 189, 187, 187)),
              child: Text(
                "Oracle:\n ${widget.cardMtg.rules}",
                style: const TextStyle(color: Colors.white),
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.spaceEvenly,
              children: [
                Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    const Text("Price: "),
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text("${widget.cardMtg.moneyEUR}€")),
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text("${widget.cardMtg.moneyUSD}\$")),
                    FittedBox(
                        fit: BoxFit.contain,
                        child: Text("${widget.cardMtg.moneyTIX}TIX")),
                  ],
                ),
                FittedBox(
                  fit: BoxFit.contain,
                  child: Text("Artist:\n ${widget.cardMtg.artist}"),
                ),
              ],
            )
          ],
        ),
      ),
    );
  }
}
