import 'package:api_mtg/Model/Carta.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.carta,
  });

  final Carta carta;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${carta.firstName} ${carta.lastName}"),
      subtitle: Text(carta.email),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(carta.avatarUrl),
      ),
    );
  }
}
