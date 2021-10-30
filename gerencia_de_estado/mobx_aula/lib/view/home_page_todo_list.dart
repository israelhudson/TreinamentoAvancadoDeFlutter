import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:mobx_aula/model/model.dart';
import 'package:mobx_aula/store/store.dart';

class HomePageTodoList extends StatelessWidget {
  HomePageTodoList({Key? key}) : super(key: key);

  final store = TodoStore();

  @override
  Widget build(BuildContext context) {
    store.addToList(TodoModel(1, 'Fazer merenda', false));
    return Scaffold(
      appBar: AppBar(
        title: Text('Todo List'),
      ),
      body: Container(
        child: Observer(builder: (context) {
          return ListView.builder(
              itemCount: store.list.length,
              itemBuilder: (BuildContext context, int index) {
                final model = store.list[index];

                return Card(
                  child: ListTile(
                      title: Text("${model.id} ${model.desc} ${model.isDone}"),
                      onTap: (){
                        store.removeToList(index: index);
                      },
                  ),
                );
              });
        }),
      ),
      floatingActionButton: FloatingActionButton(
        child: Icon(Icons.add),
        onPressed: () {
          store.addToList(TodoModel(store.list.length + 1, 'Escovar os dentes', true));
        },
      ),
    );
  }
}
