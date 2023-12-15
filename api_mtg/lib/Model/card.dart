import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';

class MtgCard {
  String name;
  String type;
  String artist;
  String manaCost;
  num convManaCost;
  String colors;
  String rules;
  String cardImg;
  String cropImg;
  num moneyUSD;
  num moneyEUR;
  num moneyTIX;

  MtgCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["type_line"],
        manaCost = json["mana_cost"],
        convManaCost = json["cmc"],
        colors = json["colors"][0],
        artist = json["artist"],
        rules = json["oracle_text"],
        cardImg = json["image_uris"]["border_crop"],
        cropImg = json["image_uris"]["art_crop"],
        moneyUSD = double.parse(json["prices"]["usd"]),
        moneyEUR = double.parse(json["prices"]["eur"]),
        moneyTIX = double.parse(json["prices"]["tix"]);

  Map<String, dynamic> toJson() => {
        "name": name,
        "type_line": type,
        "mana_cost": manaCost,
        "cmc": convManaCost,
        "colors": colors,
        "artist": artist,
        "oracle_text": rules,
        "image_uris": cardImg,
        "crop_image_uris": cropImg,
        "usd": moneyUSD,
        "eur": moneyEUR, 
        "tix": moneyTIX,
      };
}

Future<void> saveFavortieList(List<MtgCard> favoriteList) async {
  //final dir = await getApplicationDocumentsDirectory();
  final jsonList = jsonEncode(favoriteList);
  final file = File("${Directory.current.path}\\favorite-list.json");
  await file.writeAsString(jsonList);
}

Future<List<MtgCard>> loadFavoriteList() async {
  //final dir = await getApplicationDocumentsDirectory();
  final file = File("${Directory.current.path}\\favorite-list.json");
  final content = await file.readAsString();
  final List jsonList = jsonDecode(content);
  return jsonList.map((favoriteJson) => MtgCard.fromJson(favoriteJson)).toList();
}
