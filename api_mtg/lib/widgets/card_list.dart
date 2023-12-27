import 'package:api_mtg/Model/card.dart';
import 'package:flutter/material.dart';

class UserListItem extends StatelessWidget {
  const UserListItem({
    super.key,
    required this.mtgCard,
  });

  final MtgCard mtgCard;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      title: Text("${mtgCard.name} ${mtgCard.artist}"),
      subtitle: Text(mtgCard.type),
      leading: CircleAvatar(
        backgroundImage: NetworkImage(mtgCard.imageUris.cardImg),
      ),
    );
  }
}
