import 'package:flutter_modular/flutter_modular.dart';
import 'package:flutter_test_aula/app/modules/home/home_module.dart';
import 'package:flutter_test_aula/app/shared/data/user_service.dart';
import 'package:http/http.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.singleton((i) => Client()),
    Bind.singleton((i) => UserService(client: i.get<Client>()))
  ];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
  ];
}
