import 'package:api_mtg/Model/Users.dart';
import 'package:flutter/material.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      tileColor: Color.fromARGB(246, 33, 30, 30),
      title: Text(
        "${user.firstName} ${user.secondName}",
        style: TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        UserStatus(user.status),
        style: TextStyle(
          color: UserOnline(user.status) == true ? Colors.green : Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
    );
  }
}

String UserStatus(String Status) {
  String online = "";

  if (Status == "0") {
    online = "Offline";
  }

  if (Status == "1") {
    online = "Online";
  }

  return online;
}

bool UserOnline(String isOnline) {
  bool online = false;

  if (isOnline == "0") {
    online = false;
  }

  if (isOnline == "1") {
    online = true;
  }

  return online;
}
