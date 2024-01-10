import 'dart:convert';

import 'package:api_mtg/Model/card.dart';
import 'package:http/http.dart' as http;

Future<List<MtgCard>> apiLoadTSP() async {
  final uri =
      Uri.parse("https://api.scryfall.com/cards/search?order=set&q=e%3Atsp");
  await Future.delayed(const Duration(
      seconds: 2)); //delay for rate limit of calls (just to be safe)
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonlistTSP = json["data"];
  final List<MtgCard> listTSP = [];
  for (final jsonCardmtg in jsonlistTSP) {
    final cardmtg = MtgCard.fromJson(jsonCardmtg);
    listTSP.add(cardmtg);
  }
  return listTSP;
}

Future<List<MtgCard>> apiLoadLRW() async {
  final uri =
      Uri.parse("https://api.scryfall.com/cards/search?order=set&q=e%3Alrw");
  await Future.delayed(const Duration(seconds: 2));
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonlistLRW = json["data"];
  final List<MtgCard> listLRW = [];
  for (final jsonCardmtg in jsonlistLRW) {
    final cardmtg = MtgCard.fromJson(jsonCardmtg);
    listLRW.add(cardmtg);
  }
  return listLRW;
}

Future<List<MtgCard>> apiLoadALA() async {
  final uri =
      Uri.parse("https://api.scryfall.com/cards/search?order=set&q=e%3Aala");
  await Future.delayed(const Duration(seconds: 2));
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonlistALA = json["data"];
  final List<MtgCard> listALA = [];
  for (final jsonCardmtg in jsonlistALA) {
    final cardmtg = MtgCard.fromJson(jsonCardmtg);
    listALA.add(cardmtg);
  }
  return listALA;
}

Future<List<MtgCard>> apiLoadNPH() async {
  final uri =
      Uri.parse("https://api.scryfall.com/cards/search?order=set&q=e%3Anph");
  await Future.delayed(const Duration(seconds: 2));
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonlistNPH = json["data"];
  final List<MtgCard> listNPH = [];
  for (final jsonCardmtg in jsonlistNPH) {
    final cardmtg = MtgCard.fromJson(jsonCardmtg);
    listNPH.add(cardmtg);
  }
  return listNPH;
}
