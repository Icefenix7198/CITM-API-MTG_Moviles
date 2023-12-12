import 'package:api_mtg/widgets/API.dart';
import 'package:api_mtg/widgets/ListaCartas.dart';
import 'package:flutter/material.dart';
import 'package:api_mtg/Model/Carta.dart';

class ApiDataLoadApp extends StatelessWidget {
  const ApiDataLoadApp({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: FutureBuilder(
        future: apiLoadUsers(),
        builder: (
          BuildContext context,
          AsyncSnapshot<List<Carta>> snapshot,
        ) {
          if (!snapshot.hasData) {
            return const Center(
              child: CircularProgressIndicator(),
            );
          }
          final userList = snapshot.data!;
          return ListView.builder(
            itemCount: userList.length,
            itemBuilder: (BuildContext context, int index) {
              return UserListItem(carta: userList[index]);
            },
          );
        },
      ),
    );
  }
}
