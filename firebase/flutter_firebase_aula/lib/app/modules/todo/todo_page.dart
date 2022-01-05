import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_aula/app/modules/todo/model/todo_model.dart';
import 'package:flutter_firebase_aula/app/modules/todo/todo_store.dart';
import 'package:flutter_firebase_aula/app/modules/todo/widget/alert.dart';
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
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: InkWell(
            onTap: () => store.moblistTodos(), child: Text(widget.title)),
      ),
      body: StreamBuilder(
        stream: FirebaseFirestore.instance.collection('todos').snapshots(),
        builder: (context, AsyncSnapshot<QuerySnapshot> streamSnapshot) {
          return ListView.builder(
            itemCount: streamSnapshot.data!.docs.length,
            itemBuilder: (ctx, index) => Card(
                child: ListTile(
              title: Text(streamSnapshot.data!.docs[index]['title']),
              trailing: Container(
                width: 100,
                height: 100,
                child: Row(
                  children: [
                    IconButton(
                      icon: Icon(Icons.restore_from_trash_outlined),
                      onPressed: () => store.deleteTodo(
                          idDoc: streamSnapshot.data!.docs[index].id),
                    ),
                    IconButton(
                      icon: Icon(Icons.edit),
                      onPressed: () {
                        final model = TodoModel(
                            title: streamSnapshot.data!.docs[index]['title'],
                            isDone: streamSnapshot.data!.docs[index]['isDone']);

                        model.id = streamSnapshot.data!.docs[index].id;

                        return alertDialog(context, todoModel: model);
                      },
                    ),
                  ],
                ),
              ),
            )),
          );
        },
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          alertDialog(context);
        },
      ),
      // body: ListView(
      //   children: [
      //     ElevatedButton(
      //         onPressed: () => store.createTodo(
      //             todoModel: TodoModel(title: 'SuperMan', isDone: false)),
      //         child: Text("Create")),
      //     ElevatedButton(
      //         onPressed: () {
      //           store.readTodo(idDoc: '0qR8Sft84GtFYXTIo56i').then((value) {
      //             setState(() {
      //               text = value.title;
      //             });
      //           }).onError((e, s) {
      //             setState(() {
      //               text = 'Erro';
      //             });
      //           });
      //         },
      //         child: Text("Read")),
      //     ElevatedButton(
      //         onPressed: () => store.updateTodo(
      //             idDoc: '0qR8Sft84GtFYXTIo56i',
      //             todoModel: TodoModel(title: 'Clark Kent', isDone: true)),
      //         child: Text("Update")),
      //     ElevatedButton(
      //         onPressed: () => store.deleteTodo(idDoc: '2Oc5e1V8KzkD0btsLbgF'),
      //         child: Text("Delete")),
      //     Text('$text')
      //   ],
      // ),
    );
  }
}
//Observer(builder: (context) {
//         return Center(
//           child: ListView.builder(
//             itemCount: store.todoList.length,
//             itemBuilder: (BuildContext context, int index) {
//               return Text(store.todoList[index].title);
//             },
//           ),
//         );
