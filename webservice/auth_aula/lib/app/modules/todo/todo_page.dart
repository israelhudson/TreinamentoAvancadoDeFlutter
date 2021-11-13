import 'package:auth_aula/app/modules/todo/todo_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class TodoPage extends StatefulWidget {
  final String title;
  const TodoPage({Key? key, this.title = 'TodoPage'}) : super(key: key);
  @override
  TodoPageState createState() => TodoPageState();
}

class TodoPageState extends State<TodoPage> {
  final TodoStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          Text("TODO"),
          ElevatedButton(
              onPressed: () => store.getTodos(), child: Text("GET TODOS")),
          ElevatedButton(
              onPressed: () => store.addTodos(), child: Text("ADD TODOS"))
        ],
      ),
    );
  }
}
