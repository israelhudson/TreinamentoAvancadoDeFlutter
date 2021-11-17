import 'dart:developer' as dev;

import 'package:auth_aula/app/shared/local/local_token.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AuthGuard extends RouteGuard {
  AuthGuard() : super(redirectTo: '/');

  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    dev.log(path, name: "GUARDA");
    return Future.value(Modular.get<LocalToken>().isLogged);
  }
}
