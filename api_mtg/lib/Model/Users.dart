import 'dart:math';

class User {
  String firstName, secondName;
  String avatar;
  String status = Random().nextInt((2)).toString();

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["name"]["first"],
        secondName = json["name"]["last"],
        avatar = json["picture"]["large"];
}
