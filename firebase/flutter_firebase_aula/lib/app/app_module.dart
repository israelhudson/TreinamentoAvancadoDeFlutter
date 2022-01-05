import 'package:flutter_firebase_aula/app/modules/login/login_module.dart';
import 'package:flutter_firebase_aula/app/modules/todo/todo_module.dart';
import 'package:flutter_firebase_aula/app/shared/auth/service/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [Bind.singleton((i) => AuthService())];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/todo', module: TodoModule()),
    ModuleRoute('/login', module: LoginModule())
  ];
}
