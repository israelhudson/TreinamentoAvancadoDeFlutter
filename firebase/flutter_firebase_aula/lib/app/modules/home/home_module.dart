import 'package:flutter_firebase_aula/app/modules/data/feito_service.dart';
import 'package:flutter_firebase_aula/app/modules/data/todo_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

import '../home/home_store.dart';
import 'home_page.dart';

class HomeModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton(
        (i) => HomeStore(i.get<TodoService>(), i.get<FeitoService>(), i.get())),
    Bind.lazySingleton((i) => TodoService()),
    Bind.lazySingleton((i) => FeitoService()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute(Modular.initialRoute, child: (_, args) => HomePage()),
  ];
}
