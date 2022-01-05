import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter_firebase_aula/app/modules/todo/model/todo_model.dart';

class TodoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference todos = FirebaseFirestore.instance.collection('todos');

  Future<void> create({required TodoModel todoModel}) async {
    try {
      await todos.add(todoModel.toMap());
    } on Exception catch (e) {
      dev.log(e.toString(), name: "CREATE SERVICE");
    }
  }

  Future<TodoModel> read({required String idDoc}) async {
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot = await _firestore
          .collection('todos')
          .doc('0qR8Sft84GtFYXTIo56i')
          .get();

      dev.log(documentSnapshot.data().toString(), name: 'RESULTS');
      final todoModel = TodoModel.fromMap({
        'title': documentSnapshot.get('title'),
        'isDone': documentSnapshot.get('isDone')
      });
      return todoModel;
    } on Exception catch (e) {
      dev.log(e.toString(), name: "READ SERVICE");
      throw e.toString();
    }
  }

  Future<void> update(
      {required String idDoc, required TodoModel todoModel}) async {
    try {
      _firestore.collection('todos').doc('$idDoc').update(todoModel.toMap());
    } catch (e) {
      dev.log(e.toString(), name: "UPDATE SERVICE");
    }
  }

  Future<void> delete({required String idDoc}) async {
    try {
      _firestore.collection('todos').doc('$idDoc').delete();
    } catch (e) {
      dev.log(e.toString(), name: "DELETE SERVICE");
    }
  }

  Future<List<TodoModel>> list() async {
    List<TodoModel> listModel = [];
    final moviesRef = FirebaseFirestore.instance
        .collection('todos')
        .withConverter<TodoModel>(
          fromFirestore: (snapshot, _) => TodoModel.fromMap(snapshot.data()!),
          toFirestore: (todo, _) => todo.toMap(),
        );

    List<QueryDocumentSnapshot<TodoModel>> todo =
        await moviesRef.get().then((snapshot) => snapshot.docs);

    todo.forEach((element) {
      listModel.add(element.data());
    });

    return listModel;
  }
}
