import 'package:api_mtg/Model/Users.dart';
import 'package:api_mtg/Model/global_provider.dart';
import 'package:flutter/material.dart';
import 'package:provider/provider.dart';

class UsersListItem extends StatelessWidget {
  const UsersListItem({
    super.key,
    required this.user,
  });

  final User user;

  @override
  Widget build(BuildContext context) {
    String network = "https";

    final globalInfo = context.watch<GlobalInfo>();
    return ListTile(
      tileColor: (globalInfo.darkMode)
          ? const Color.fromRGBO(33, 30, 30, 0.965)
          : const Color.fromARGB(255, 233, 233, 233),
      title: Text(
        "${user.firstName} ${user.secondName}",
        style: TextStyle(
          color: (globalInfo.darkMode) ? Colors.white : Colors.black,
        ),
      ),
      subtitle: Text(
        userStatus(user.status),
        style: TextStyle(
          color: userOnline(user.status) == true ? Colors.green : Colors.grey,
        ),
      ),
      leading: CircleAvatar(
        backgroundImage:
            user.avatar.contains(network) ? NetworkImage(user.avatar) : null,
        child: user.avatar.contains(network) ? null : Image.asset(user.avatar),
      ),
      /*trailing: ElevatedButton(
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
      ),*/
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
