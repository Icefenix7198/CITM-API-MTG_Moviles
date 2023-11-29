import 'package:api_mtg/Screens/Home.dart';
import 'package:api_mtg/Screens/Portada.dart';
import 'package:api_mtg/Screens/WIP_API.dart';
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
      routes: {
        "/": (context) => PortadaScreen(),
        "/home": (context) => HomeScreen(),
        "/home/api": (_) => ApiDataLoadApp(),
      },
    );
  }
}
