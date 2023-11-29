import 'package:api_mtg/widgets/Statefull.dart';
import 'package:api_mtg/widgets/Stateless.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        //Toda la app que se muestre sera este body
        body: const Column(
          children: [
            StatefulPlantilla(title: "Texto"),
            StatelessPlantilla(title: "Text2"),
          ],
        ),
      ),
    );
  }
}
