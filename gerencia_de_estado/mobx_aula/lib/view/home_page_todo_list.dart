import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/model/model.dart';
import 'package:mobx_aula/store/store.dart';

class HomePageTodoList extends StatelessWidget {
  HomePageTodoList({Key? key}) : super(key: key);

  final store = TodoStore();

  @override
  Widget build(BuildContext context) {
    store.addToList(TodoModel(0, 'Fazer merenda', false));
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
        actions: [
          Observer(
            builder: (context) {
              int counterDone = 0;
              store.list.forEach((element) {
                if(element.isDone == true){
                  counterDone++;
                }

              });

              return Text('$counterDone');
            }
          )
        ],
      ),
      body: Container(
        child: Observer(builder: (context) {
          return ListView.builder(
              itemCount: store.list.length,
              itemBuilder: (BuildContext context, int index) {
                final model = store.list[index];

                return Card(
                  color: model.isDone ? Colors.indigo : Colors.white,
                  child: Observer(
                    builder: (context) {
                      return ListTile(
                          title: Text("${model.id} ${model.desc} ${model.isDone}"),
                          onTap: (){
                            store.markisDone(index, model);
                          },
                      );
                    }
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          addOrEditTodo(context);
        },
      ),
    );
  }

  void addOrEditTodo(BuildContext context) {
    showDialog(
        context: context,
        builder: (context){

          //controlador de valores do campo de texto
          var edit = TextEditingController();

          return AlertDialog(
            title: Text("Adicionando Tarefa"),
            content: TextField(
              controller: edit,
            ),
            actions: <Widget>[
              FlatButton(
                child: Text("CADASTRAR"),
                onPressed: (){
                  store.addToList(TodoModel(store.list.length + 1, edit.text, false));

                  Navigator.pop(context);
                },
              ),
            ],
          );
        }
    );
  }
}
