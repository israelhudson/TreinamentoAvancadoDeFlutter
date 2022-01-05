import 'package:flutter/material.dart';
import 'package:flutter_firebase_aula/app/modules/todo/model/todo_model.dart';
import 'package:flutter_firebase_aula/app/modules/todo/todo_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

alertDialog(BuildContext context, {TodoModel? todoModel}) {
  final todoStore = Modular.get<TodoStore>();
  final edtController = TextEditingController();

  if (todoModel != null) edtController.text = todoModel.title;

  showDialog(
    context: context,
    builder: (BuildContext context) {
      return AlertDialog(
        title: todoModel == null
            ? Text("Adicione um Todo")
            : Text("Editar um Todo"),
        content: TextField(
          controller: edtController,
          decoration: const InputDecoration(
              border: OutlineInputBorder(), hintText: 'todo'),
        ),
        actions: <Widget>[
          // define os botões na base do dialogo
          FlatButton(
            child: todoModel == null ? Text("Adicionar") : Text("Editar"),
            onPressed: () {
              if (todoModel == null) {
                todoStore.createTodo(
                    todoModel:
                        TodoModel(title: edtController.text, isDone: false));
              } else {
                todoStore.updateTodo(
                    idDoc: todoModel.id!,
                    todoModel:
                        TodoModel(title: edtController.text, isDone: false));
              }
              Navigator.of(context).pop();
            },
          ),
        ],
      );
    },
  );
}
