import 'dart:convert';
import 'dart:io';
import 'package:get_server/get_server.dart';

import '../data/todo_dao.dart';
import '../model/todo_model.dart';

class Home extends StatelessWidget {
  final dao = TodoDao();
  @override
  Widget build(BuildContext context) {
    dao.insert(TodoModel(name: "Merendar", isDone: false));
    return Text('Welcome to HOME!');
  }
}
