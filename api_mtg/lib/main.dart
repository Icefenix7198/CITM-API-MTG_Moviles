import 'package:api_mtg/Screens/home.dart';
import 'package:api_mtg/Screens/cover.dart';
import 'package:api_mtg/Screens/card_searcher.dart';
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
        "/": (context) => const PortadaScreen(),
        "/home": (context) => const HomeScreen(),
        "/home/api": (_) => const ApiDataLoadApp(),
      },
    );
  }
}
