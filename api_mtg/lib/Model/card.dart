
import 'package:path_provider/path_provider.dart';
import 'dart:convert';
import 'dart:io';



class MtgCard {
  String name;
  String type;
  String artist;
  String manaCost;
  num convManaCost;
  List<String> colors;
  String rules;
  ImageUris imageUris;
  Prices prices;
  bool isFav;

  MtgCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["type_line"],
        manaCost = json["mana_cost"],
        convManaCost = json["cmc"],
        colors = List<String>.from(json["colors"].map((x) => x)),
        artist = json["artist"],
        rules = json["oracle_text"],
        imageUris = ImageUris.fromJson(json["image_uris"]),
        prices = Prices.fromJson(json["prices"]),
        isFav = json["isFav"] ?? false;

  Map<String, dynamic> toJson() => {
        "name": name,
        "type_line": type,
        "mana_cost": manaCost,
        "cmc": convManaCost,
        "colors": List<dynamic>.from(colors.map((x) => x)),
        "artist": artist,
        "oracle_text": rules,
        "image_uris": imageUris.toJson(),
        "prices": prices.toJson(),
        "isFav": isFav,
      };
}

Future<void> saveFavoriteList(List<MtgCard> favoriteList) async {
  final dir = await getApplicationDocumentsDirectory();
  final jsonList = jsonEncode(favoriteList);
  final file = File("${dir.absolute.path}\\favorite-list.json");
  await file.writeAsString(jsonList);
}

Future<List<MtgCard>> loadFavoriteList() async {
  final dir = await getApplicationDocumentsDirectory();
  final file = File("${dir.absolute.path}\\favorite-list.json");
  final content = await file.readAsString();
  final List jsonList = jsonDecode(content);
  return jsonList
      .map((favoriteJson) => MtgCard.fromJson(favoriteJson))
      .toList();
}

void addCard(List<MtgCard> listCards, MtgCard favCard) {
  listCards.add(favCard);
  saveFavoriteList(listCards);
}

void deleteCard(List<MtgCard> listCards,MtgCard favCard) {
  listCards.removeWhere((element) => element.name == favCard.name);
  saveFavoriteList(listCards);
}

class ImageUris {
  String cardImg;
  String cropImg;

  ImageUris({
    required this.cardImg,
    required this.cropImg,
  });

  factory ImageUris.fromJson(Map<String, dynamic> json) => ImageUris(
        cardImg: json["border_crop"],
        cropImg: json["art_crop"],
      );

  Map<String, dynamic> toJson() => {
        "border_crop": cardImg,
        "art_crop": cropImg,
      };
}

class Prices {
  num usd;
  num eur;
  num tix;

  Prices({
    required this.usd,
    required this.eur,
    required this.tix,
  });

  factory Prices.fromJson(Map<String, dynamic> json) => Prices(
        usd: double.parse(json["usd"].toString()),
        eur: double.parse(json["eur"].toString()),
        tix: double.parse(json["tix"].toString()),
      );

  Map<String, dynamic> toJson() => {
        "usd": usd,
        "eur": eur,
        "tix": tix,
      };
}
