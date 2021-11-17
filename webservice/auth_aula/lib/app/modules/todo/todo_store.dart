import 'package:auth_aula/app/shared/config/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'dart:developer' as dev;

class TodoStore {
  void getTodos() async {
    try {
      var response = await Modular.get<CustomDio>().i.get('/todo');
      dev.log("$response", name: "SERVICO");
    } catch (e) {
      print(e);
    }
  }

  void addTodos() async {
    try {
      var response = await Modular.get<CustomDio>()
          .i
          .get('/register', queryParameters: {"name": "ELIAS"});
      dev.log("$response", name: "SERVICO");
    } catch (e) {
      print(e);
    }
  }
}
