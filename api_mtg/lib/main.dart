import 'package:api_mtg/Screens/card_screen.dart';
import 'package:api_mtg/Screens/settings_screen.dart';
import 'package:api_mtg/Screens/social_screen.dart';
import 'package:api_mtg/Screens/user_deck_screen.dart';
import 'package:api_mtg/Screens/user_screen.dart';
import 'package:api_mtg/Screens/home.dart';
import 'package:api_mtg/Screens/cover.dart';
import 'package:api_mtg/Screens/card_searcher.dart';
import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  Map<String, dynamic> settings = {
    "name": "Name",
    "username": "Username",
    "private": false,
    "darkMode": true,
  };
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      routes: {
        "/": (context) => const PortadaScreen(),
        "/home": (context) => const HomeScreen(),
        "/home/api": (_) => const ApiDataLoadApp(),
        "/home/social": (context) => const SocialScreen(),
        "/home/api/card": (context) => const CardScreen(),
        "/home/user": (context) => const UserScreen(),
        "/home/user/deck": (context) => const UserScreenDeck(),
        "/home/settings": (context) => SettingsScreen(
              settings: settings,
            ),
      },
    );
  }
}
