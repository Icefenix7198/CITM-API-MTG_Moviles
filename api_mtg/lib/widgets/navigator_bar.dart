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
      children: [
        //Botones para cambiar de pantalla
        //Pantalla X
        IconButton(
          onPressed: () =>
              {Navigator.of(context).pushReplacementNamed("/home")},
          icon: const Icon(Icons.abc),
        ),

        //Pantalla Y
        IconButton(
          onPressed: () =>
              {Navigator.of(context).pushReplacementNamed("/home")},
          icon: const Icon(Icons.abc),
        ),

        //Pantalla Z
        IconButton(
          onPressed: () =>
              {Navigator.of(context).pushReplacementNamed("/home")},
          icon: const Icon(Icons.abc),
        ),

        //Pantalla A
        IconButton(
          onPressed: () =>
              {Navigator.of(context).pushReplacementNamed("/home")},
          icon: const Icon(Icons.abc),
        ),
      ],
    );
  }
}
