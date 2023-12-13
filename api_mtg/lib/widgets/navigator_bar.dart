import 'package:flutter/material.dart';

class NavigatorBarra extends StatefulWidget {
  const NavigatorBarra({super.key, required this.title});

  //Variables por paramentro del widget, se acceden mediante widget.nombre
  final String title;

  @override
  State<NavigatorBarra> createState() => _NavigatorBarra();
}

class _NavigatorBarra extends State<NavigatorBarra> {
  //Parametros de la propia funcion
  int counter = 0;

  // ignore: non_constant_identifier_names
  void ActualizarEstado() {
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Botones para cambiar de pantalla
        //Pantalla home
        Column(
          children: [
            IconButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/home")},
              icon: const Icon(Icons.home),
            ),
            const Text("Home")
          ],
        ),

        //Pantalla Social
        Column(
          children: [
            IconButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/home/social")},
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            const Text("Social")
          ],
        ),

        //Pantalla Z
        Column(
          children: [
            IconButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/home/api")},
              icon: const Icon(Icons.games),
            ),
            const Text("API")
          ],
        ),

        //Pantalla A
        Column(
          children: [
            IconButton(
              onPressed: () =>
                  {Navigator.of(context).pushReplacementNamed("/home")},
              icon: const Icon(Icons.abc),
            ),
            const Text("Placeholder")
          ],
        ),
      ],
    );
  }
}
