// ignore: file_names
import 'package:api_mtg/Model/providerThing.dart';
import 'package:api_mtg/widgets/navigator_bar.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class HomeScreen extends StatelessWidget {
  const HomeScreen({
    super.key,
  });

  @override
  Widget build(BuildContext context) {
    final globalInfo = context.watch<GlobalInfo>();

    return Scaffold(
      backgroundColor: (globalInfo.darkMode)
          ? const Color.fromARGB(255, 49, 49, 49)
          : const Color.fromARGB(255, 223, 223, 223),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.spaceEvenly,
          children: [
            Row(
              children: [
                Expanded(
                  child: Container(
                    padding: const EdgeInsets.all(10),
                    decoration: const BoxDecoration(
                      color: Color.fromARGB(255, 201, 83, 81),
                    ),
                    child: const Align(
                      alignment: Alignment.centerLeft,
                      child: Text(
                        "Home",
                        style: TextStyle(fontSize: 50, color: Colors.white),
                      ),
                    ),
                  ),
                ),
              ],
            ),

            //Lista cartas?

            const ListImages(),

            const Spacer(),
            const NavigatorBar(
              actualScreen: NavScreens.home,
            ),
          ],
        ),
      ),
    );
  }
}

class ListImages extends StatelessWidget {
  const ListImages({
    super.key,
  });

  //Variables por paramentro del widget, se acceden mediante widget.nombre

  @override
  Placeholder build(BuildContext context) {
    return const Placeholder(); //Aqui dentro va toda la funcion
  }
}
