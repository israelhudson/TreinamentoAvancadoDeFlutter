import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/app/modules/catalog/catalog_module.dart';
import 'package:modular_aula/app/modules/contact/contact_module.dart';

import 'modules/home/home_module.dart';

class AppModule extends Module {
  @override
  final List<Bind> binds = [];

  @override
  final List<ModularRoute> routes = [
    ModuleRoute(Modular.initialRoute, module: HomeModule()),
    ModuleRoute('/contact', module: ContactModule()),
    ModuleRoute('/catalog', module: CatalogModule()),
  ];
}
