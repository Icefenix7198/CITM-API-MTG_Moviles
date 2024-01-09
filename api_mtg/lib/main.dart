import 'package:api_mtg/Model/providerThing.dart';
import 'package:api_mtg/Screens/card_screen.dart';
import 'package:api_mtg/Screens/settings_screen.dart';
import 'package:api_mtg/Screens/social_screen.dart';
import 'package:api_mtg/Screens/user_deck_screen.dart';
import 'package:api_mtg/Screens/user_screen.dart';
import 'package:api_mtg/Screens/home.dart';
import 'package:api_mtg/Screens/cover.dart';
import 'package:api_mtg/Screens/card_searcher.dart';
import 'package:flutter/material.dart';

//Provider
import 'package:provider/provider.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return ChangeNotifierProvider(
      create: (_) => GlobalInfo(
        name: "Name",
        username: "Username",
        private: false,
        darkMode: true,
        language: Idioma.english,
      ),
      child: MaterialApp(
        routes: {
          "/": (context) => const PortadaScreen(),
          "/home": (context) => HomeScreen(),
          "/home/api": (_) => ApiDataLoadApp(),
          "/home/social": (context) => SocialScreen(),
          "/home/api/card": (context) => CardScreen(),
          "/home/user": (context) => UserScreen(),
          "/home/user/deck": (context) => UserScreenDeck(),
          "/home/settings": (context) => SettingsScreen(),
        },
      ),
    );
  }
}
