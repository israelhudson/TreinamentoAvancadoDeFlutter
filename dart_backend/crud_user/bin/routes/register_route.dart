import 'dart:convert';
import 'dart:io';
import 'package:get_server/get_server.dart';
import '../data/todo_dao.dart';
import '../model/todo_model.dart';
import 'dart:developer' as dev;

class RegisterRoute extends StatelessWidget {
  final dao = TodoDao();
  String param = "texto";
  @override
  Widget build(BuildContext context) {
    print(context.request.query); //QueryParams
    if (context.request.query["name"] != null &&
        context.request.query["name"]!.isNotEmpty) {
      param = context.request.query["name"].toString();
    }
    dev.log(param, name: "PARAMS");
    dao.insert(TodoModel(name: param, isDone: false));

    return Text('Welcome to Register!');
  }
}
