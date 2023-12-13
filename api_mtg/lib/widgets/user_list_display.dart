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
      tileColor: const Color.fromRGBO(33, 30, 30, 0.965),
      title: Text(
        "${user.firstName} ${user.secondName}",
        style: const TextStyle(color: Colors.white),
      ),
      subtitle: Text(
        userStatus(user.status),
        style: TextStyle(
          color: userOnline(user.status) == true ? Colors.green : Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(user.avatar),
      ),
      trailing: ElevatedButton(
        style: ElevatedButton.styleFrom(
          primary: const Color.fromARGB(255, 53, 50, 50),
        ),
        onPressed: () {
          Navigator.of(context).pushNamed("/home/api");
        },
        child: const Icon(
          Icons.arrow_forward_ios_rounded,
          color: Colors.white38,
        ),
      ),
      isThreeLine: true,
    );
  }
}

String userStatus(String status) {
  String online = "";

  if (status == "0") {
    online = "Offline";
  }

  if (status == "1") {
    online = "Online";
  }

  return online;
}

bool userOnline(String isOnline) {
  bool online = false;

  if (isOnline == "0") {
    online = false;
  }

  if (isOnline == "1") {
    online = true;
  }

  return online;
}
