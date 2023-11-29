import 'package:flutter/material.dart';

class StatefulPlantilla extends StatefulWidget {
  const StatefulPlantilla({super.key, required this.title});

  //Variables por paramentro del widget, se acceden mediante widget.nombre
  final String title;

  @override
  State<StatefulPlantilla> createState() => _StatefulPlantilla();
}

class _StatefulPlantilla extends State<StatefulPlantilla> {
  
  //Parametros de la propia funcion
  int counter = 0;

  // ignore: non_constant_identifier_names
  void ActualizarEstado() {
    setState(() {
      
    });
  }

  @override
  Widget build(BuildContext context) {
    
    return Container(
       // This trailing comma makes auto-formatting nicer for build methods.
    );
  }
}