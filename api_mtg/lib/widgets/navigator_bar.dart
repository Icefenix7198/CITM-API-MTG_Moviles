import 'package:flutter/material.dart';

enum NavScreens { home, social, colection, extra }

class NavigatorBarra extends StatefulWidget {
  const NavigatorBarra({
    super.key,
    this.actualScreen = NavScreens.home,
  });

  //Variables por paramentro del widget, se acceden mediante widget.nombre
  final NavScreens actualScreen;

  @override
  State<NavigatorBarra> createState() => _NavigatorBarra();
}

class _NavigatorBarra extends State<NavigatorBarra> {
  //Parametros de la propia funcion

  // ignore: non_constant_identifier_names
  void ActualizarEstado() {
    setState(() {});
  }

  NavScreens? pants;

  @override
  Widget build(BuildContext context) {
    pants = widget.actualScreen;
    if (pants == 0) {}
    return Row(
      crossAxisAlignment: CrossAxisAlignment.center,
      mainAxisAlignment: MainAxisAlignment.spaceEvenly,
      children: [
        //Botones para cambiar de pantalla
        //Pantalla home

        Column(
          children: [
            IconButton(
              onPressed: () => {
                if (widget.actualScreen != NavScreens.home)
                  {Navigator.of(context).pushReplacementNamed("/home")}
              },
              icon: const Icon(Icons.home_outlined),
            ),
            const Text(
              "Home",
              style: TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),

        //Pantalla Social
        Column(
          children: [
            IconButton(
              onPressed: () => {
                if (widget.actualScreen != NavScreens.social)
                  {Navigator.of(context).pushReplacementNamed("/home/social")}
              },
              icon: const Icon(Icons.chat_bubble_outline),
            ),
            const Text(
              "Social",
              style: TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),

        //Pantalla coleccion
        Column(
          children: [
            IconButton(
              onPressed: () => {
                if (widget.actualScreen != NavScreens.colection)
                  {Navigator.of(context).pushReplacementNamed("/home/api")}
              },
              icon: const Icon(
                Icons.content_copy_sharp,
              ),
            ),
            const Text(
              "API",
              style: TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),

        //Pantalla A
        Column(
          children: [
            IconButton(
              onPressed: () => {
                if (widget.actualScreen != NavScreens.extra)
                  {Navigator.of(context).pushReplacementNamed("/home")}
              },
              icon: const Icon(Icons.abc),
            ),
            const Text(
              "Placeholder",
              style: TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),
      ],
    );
  }
}
