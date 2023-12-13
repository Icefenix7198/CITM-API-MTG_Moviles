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
      appBar: AppBar(title: Text(widget.cardMtg.name)),
      body: Padding(
        padding: const EdgeInsets.all(16.0),
        child: Container(
          decoration: const BoxDecoration(
              borderRadius: BorderRadius.all(Radius.circular(10)),
              color: Colors.white),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Image(image: NetworkImage(widget.cardMtg.cardImg)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  FittedBox(
                      fit: BoxFit.contain, child: Text(widget.cardMtg.artist)),
                  FittedBox(
                      fit: BoxFit.contain,
                      child: Text(widget.cardMtg.manaCost)),
                ],
              ),
              FittedBox(fit: BoxFit.contain, child: Text(widget.cardMtg.type)),
              Row(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
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
              )
            ],
          ),
        ),
      ),
    );
  }
}
