import 'package:mobx/mobx.dart';
import 'package:mobx_aula/model/model.dart';
import 'package:meta/meta.dart';
part 'todo_store.g.dart';

class TodoStore = TodoStoreBase with _$TodoStore;

abstract class TodoStoreBase with Store {

  @observable
  var list = ObservableList<TodoModel>();

  @action
  void addToList(TodoModel model){
    list.add(model);
  }

  @action
  void removeToList({required int index}){
    list.removeAt(index);
  }

  @action
  void markisDone(int index, TodoModel model){
    list.removeAt(index);
    model.isDone = !model.isDone;
    list.insert(index, model);
  }

  @action
  void upateDesc({required TodoModel model, required int index}){
    list.removeAt(index);
    list.insert(index, model);
  }

}