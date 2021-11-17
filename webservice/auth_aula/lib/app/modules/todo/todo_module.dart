import 'package:auth_aula/app/modules/todo/todo_Page.dart';
import 'package:auth_aula/app/modules/todo/todo_store.dart';
import 'package:auth_aula/app/shared/config/guard/auth_guard.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TodoStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => TodoPage(), guards: [AuthGuard()]),
  ];
}
