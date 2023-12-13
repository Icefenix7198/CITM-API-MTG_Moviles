
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
        cardImg = json["image_uris"]["large"],
        cropImg = json["image_uris"]["art_crop"],
        moneyUSD = double.parse(json["prices"]["usd"]),
        moneyEUR = double.parse(json["prices"]["eur"]),
        moneyTIX = double.parse(json["prices"]["tix"]);
}
