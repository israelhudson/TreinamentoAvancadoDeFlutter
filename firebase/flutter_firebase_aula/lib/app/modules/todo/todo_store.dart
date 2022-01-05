import 'package:flutter_firebase_aula/app/modules/data/todo_service.dart';
import 'package:flutter_firebase_aula/app/modules/todo/model/todo_model.dart';
import 'package:mobx/mobx.dart';

class TodoStore {
  final TodoService _todoService;

  ObservableList<TodoModel> todoList = ObservableList();

  TodoStore(this._todoService);

  void addTodoList() {
    runInAction(() {
      todoList.add(TodoModel(title: 'Hulk', isDone: false));
    });
  }

  void removeTodoitem({required int index}) {
    runInAction(() {
      todoList.removeAt(index);
    });
  }

  Future<void> createTodo({required TodoModel todoModel}) async {
    await _todoService.create(todoModel: todoModel);
  }

  Future<TodoModel> readTodo({required String idDoc}) async {
    return await _todoService.read(idDoc: idDoc);
  }

  Future<void> updateTodo(
      {required String idDoc, required TodoModel todoModel}) async {
    return await _todoService.update(idDoc: idDoc, todoModel: todoModel);
  }

  Future<void> deleteTodo({required String idDoc}) async {
    return await _todoService.delete(idDoc: idDoc);
  }

  Future<List<TodoModel>> moblistTodos() async {
    final list = await _todoService.list();
    runInAction(() {
      todoList.clear();
      list.forEach((element) {
        todoList.add(element);
      });
    });
    return todoList;
  }
}
