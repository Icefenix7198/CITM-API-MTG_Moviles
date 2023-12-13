// ignore: file_names
import 'package:flutter/material.dart';

class StatelessPlantilla extends StatelessWidget {
  const StatelessPlantilla({super.key, required this.title});

  //Variables por paramentro del widget, se acceden mediante widget.nombre
  final String title;

  @override
  Placeholder build(BuildContext context) {
    return const Placeholder(); //Aqui dentro va toda la funcion
  }
}
