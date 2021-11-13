import 'package:get_server/get_server.dart';
import '../data/todo_dao.dart';
import 'dart:convert';

class TodoController extends GetxController {

  Future<String> getAllTodos() async {
    final dao = TodoDao();

    await Future.value(Duration(seconds: 1));
    final list = await dao.getAllSortedByName();
    var body = jsonEncode(list.map((i) => i.toMap()).toList()).toString();
    return body;
  }
}
