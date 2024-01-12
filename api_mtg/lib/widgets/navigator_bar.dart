import 'package:api_mtg/Model/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

enum NavScreens { home, social, colection, user }

class NavigatorBar extends StatefulWidget {
  const NavigatorBar({
    super.key,
    this.actualScreen = NavScreens.home,
  });

  //Variables por paramentro del widget, se acceden mediante widget.nombre
  final NavScreens actualScreen;

  @override
  State<NavigatorBar> createState() => _NavigatorBarra();
}

class _NavigatorBarra extends State<NavigatorBar> {
  //Parametros de la propia funcion

  NavScreens? pants;

  @override
  Widget build(BuildContext context) {
    pants = widget.actualScreen;
    final globalInfo = context.watch<GlobalInfo>();
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
              icon: Icon(Icons.home_outlined,
                  color: (widget.actualScreen == NavScreens.home)
                      ? Colors.blueAccent
                      : null),
            ),
            Text(
              (globalInfo.language == Idioma.spanish)
                  ? "Inicio"
                  : (globalInfo.language == Idioma.catalan)
                      ? "Inici"
                      : "Home",
              style: const TextStyle(color: Colors.pinkAccent),
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
              icon: Icon(Icons.chat_bubble_outline,
                  color: (widget.actualScreen == NavScreens.social)
                      ? Colors.blueAccent
                      : null),
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
              icon: Icon(Icons.content_copy_sharp,
                  color: (widget.actualScreen == NavScreens.colection)
                      ? Colors.blueAccent
                      : null),
            ),
            Text(
              (globalInfo.language == Idioma.spanish)
                  ? "Coleccion"
                  : (globalInfo.language == Idioma.catalan)
                      ? "Coleccio"
                      : "Collection",
              style: const TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),

        //Pantalla User
        Column(
          children: [
            IconButton(
              onPressed: () => {
                if (widget.actualScreen != NavScreens.user)
                  {Navigator.of(context).pushReplacementNamed("/home/user")}
              },
              icon: Icon(Icons.person_outlined,
                  color: (widget.actualScreen == NavScreens.user)
                      ? Colors.blueAccent
                      : null),
            ),
            Text(
              (globalInfo.language == Idioma.spanish)
                  ? "Perfil"
                  : (globalInfo.language == Idioma.catalan)
                      ? "Perfil"
                      : "Profile",
              style: const TextStyle(color: Colors.pinkAccent),
            )
          ],
        ),
      ],
    );
  }
}
