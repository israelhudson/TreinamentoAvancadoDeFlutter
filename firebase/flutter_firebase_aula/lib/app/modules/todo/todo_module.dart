import 'package:flutter_firebase_aula/app/modules/data/todo_service.dart';
import 'package:flutter_firebase_aula/app/modules/todo/todo_Page.dart';
import 'package:flutter_firebase_aula/app/modules/todo/todo_store.dart';
import 'package:flutter_firebase_aula/app/shared/guard/firebase_auth_guard.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => TodoService()),
    Bind.lazySingleton((i) => TodoStore(i.get<TodoService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/',
        child: (_, args) => TodoPage(), guards: [FirebaseAuthGuard()]),
  ];
}
