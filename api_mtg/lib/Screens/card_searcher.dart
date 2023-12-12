import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
//import 'package:api_mtg/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';

class ApiDataLoadApp extends StatelessWidget {
  const ApiDataLoadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<MtgCard>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final userList = snapshot.data!;
          return CardGrid(cardList: userList,);
        },
      ),
    );
  }
}
