import 'package:api_mtg/widgets/Card_grid.dart';
import 'package:api_mtg/widgets/api_load.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
//import 'package:api_mtg/widgets/card_list.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/card.dart';

class ApiDataLoadApp extends StatelessWidget {
  const ApiDataLoadApp({super.key});

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
          final userList = snapshot.data!;
          return Center(
            child: Column(
              children: [
                Row(
                  children: [
                    Expanded(
                      flex: 10,
                      child: Container(
                        padding: const EdgeInsets.all(10.0),
                        color: Colors.orange,
                        child: const Text(
                          "Collection",
                          style: TextStyle(
                            fontSize: 50,
                          ),
                        ),
                      ),
                    ),
                  ],
                ),
                Expanded(
                  flex: 70,
                  child: Container(
                    child: CardGrid(
                      cardList: userList,
                    ),
                  ),
                ),
                const NavigatorBarra(
                  actualScreen: NavScreens.colection,
                )
              ],
            ),
          );
        },
      ),
    );
  }
}
