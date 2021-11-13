import 'dart:developer' as dev;

import 'package:auth_aula/app/shared/config/custom_dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomeStore {
  void loginAuth() async {
    try {
      var response = await Modular.get<CustomDio>().i.post('/login');
      //Modular.get<LocalToken>().token = response.data["token"];
      dev.log("$response", name: "LOGIN");
    } catch (e) {
      dev.log("${e}", name: "LOGIN ERRO");
    }
  }
}
