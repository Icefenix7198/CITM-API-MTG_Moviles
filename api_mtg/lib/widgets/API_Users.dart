// ignore: file_names
import 'dart:convert';

import 'package:api_mtg/Model/Users.dart';
import 'package:http/http.dart' as http;

Future<List<User>> apiLoadUsers() async {
  final uri = Uri.parse("https://randomuser.me/api/?results=50");
  final response = await http.get(uri);
  final json = jsonDecode(response.body);
  final jsonUserList = json["results"];
  final List<User> userList = [];
  for (final jsonUser in jsonUserList) {
    final user = User.fromJson(jsonUser);
    userList.add(user);
  }
  return userList;
}
