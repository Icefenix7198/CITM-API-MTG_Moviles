// ignore: file_names
import 'dart:math';

class User {
  String firstName, secondName;
  String avatar;
  String status = Random().nextInt(2).toString();

  User(this.firstName, this.secondName, this.avatar);

  User.fromJson(Map<String, dynamic> json)
      : firstName = json["name"]["first"],
        secondName = json["name"]["last"],
        avatar = json["picture"]["large"];
}
