
class MtgCard {
  String name;
  String type;
  String artist;
  num convManaCost;
  String colors;
  String rules;
  String avatarUrl;
  num moneyUSD;
  num moneyEUR;
  num moneyTIX;

  MtgCard.fromJson(Map<String, dynamic> json)
      : name = json["name"],
        type = json["type_line"],
        convManaCost = json["cmc"],
        colors = json["colors"][0],
        artist = json["artist"],
        rules = json["oracle_text"],
        avatarUrl = json["image_uris"]["large"],
        moneyUSD = double.parse(json["prices"]["usd"]),
        moneyEUR = double.parse(json["prices"]["eur"]),
        moneyTIX = double.parse(json["prices"]["tix"]);
}
