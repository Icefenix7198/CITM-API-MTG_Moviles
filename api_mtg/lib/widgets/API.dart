import 'dart:convert';

import 'package:api_mtg/Model/Carta.dart';
import 'package:http/http.dart' as http;

Future<List<Carta>> apiLoadUsers() async {
  final uri = Uri.parse("https://api.scryfall.com/cards/search?order=set&q=e%3Aone");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonUserList = json["data"];
  final List<Carta> userList = [];
  for (final jsonUser in jsonUserList) {
    final user = Carta.fromJson(jsonUser);
    userList.add(user);
  }
  return userList;
}
