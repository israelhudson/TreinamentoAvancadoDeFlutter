import 'dart:convert';

import 'package:flutter_test_aula/app/shared/model/user_model.dart';
import 'package:http/http.dart';

class UserService {
  final Client client;

  UserService({required this.client});

  Future<List<UserModel>> getUsers() async {
    final response = await client
        .get(Uri.parse("https://jsonplaceholder.typicode.com/users"));

    if (response.statusCode == 200) {
      final jsonList = json.decode(response.body) as List;
      return jsonList.map((e) => UserModel.fromMap(e)).toList();
    } else if (response.statusCode == 404) {
      throw UserEmptyList();
    } else {
      throw Exception('Falha ao executar a açao');
    }
  }
}

class UserException implements Exception {}

class UserEmptyList extends UserException {}
