import 'dart:developer' as dev;

import 'package:auth_aula/app/shared/config/custom_dio.dart';
import 'package:auth_aula/app/shared/local/local_token.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginStore {
  void loginAuth() async {
    final auth = Modular.get<LocalToken>();
    try {
      var response = await Modular.get<CustomDio>().i.post('/login');
      dev.log("$response", name: "LOGIN");
      auth
        ..token = response.data["token"]
        ..isLogged = true;
      Modular.to.pushNamed("/home");
    } catch (e) {
      auth.isLogged = false;
      dev.log("${e}", name: "LOGIN ERRO");
    }
  }

  void renewAuth() async {
    final auth = Modular.get<LocalToken>();
    try {
      var response = await Modular.get<CustomDio>().i.post('/renew');
      dev.log("$response", name: "RENEW");
      auth
        ..token = response.data["token"]
        ..isLogged = true;
    } catch (e) {
      auth.isLogged = false;
      dev.log("${e}", name: "RENEW ERRO");
    }
  }
}
