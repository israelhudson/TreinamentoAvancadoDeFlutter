import 'package:get_server/get_server.dart';

import '../controller/todo_controller.dart';
import '../data/todo_dao.dart';
import '../model/todo_model.dart';

class TodoRoute extends GetView {
  final dao = TodoDao();
  List<TodoModel>? list;
  String body = "teste";
  late TodoController controller;

  TodoRoute() {
    controller = TodoController();
    controller.getAllTodos().then((data) {
      body = data;
    });
  }

  @override
  Widget build(BuildContext context) {
    print(context.request.query); //QueryParams
    return Text(body);
  }
}
