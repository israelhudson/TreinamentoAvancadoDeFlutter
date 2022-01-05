import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_aula/app/modules/home/home_controller.dart';
import 'package:flutter_test_aula/app/shared/data/user_service.dart';

import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => HomeController(service: i.get<UserService>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
