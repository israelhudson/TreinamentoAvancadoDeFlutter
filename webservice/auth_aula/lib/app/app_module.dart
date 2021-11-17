import 'package:auth_aula/app/modules/login/login_module.dart';
import 'package:auth_aula/app/modules/todo/todo_module.dart';
import 'package:auth_aula/app/shared/config/custom_dio.dart';
import 'package:auth_aula/app/shared/local/local_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Dio()),
    Bind.singleton((i) => CustomDio(i.get<Dio>())),
    Bind.lazySingleton((i) {
      final local = LocalToken();
      local.token = "";
      return local;
    })
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: LoginModule()),
    ModuleRoute("/home", module: HomeModule()),
    ModuleRoute("/todo", module: TodoModule()),
  ];
}
