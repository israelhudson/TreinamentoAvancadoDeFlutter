import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';

class TodoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;

  Future<void> create() async {
    try {
      await _firestore
          .collection('todos')
          .doc('testTodos')
          .set({'title': 'HONORATO'});
    } on Exception catch (e) {
      dev.log(e.toString(), name: "CREATE SERVICE");
    }
  }

  Future<String> read() async {
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot =
          await _firestore.collection('todos').doc('testTodos').get();
      return documentSnapshot.data().toString();
    } on Exception catch (e) {
      dev.log(e.toString(), name: "READ SERVICE");
      return e.toString();
    }
  }

  Future<void> update() async {
    try {
      _firestore.collection('todos').doc('testTodos').update({'title': 'Hulk'});
    } catch (e) {
      dev.log(e.toString(), name: "UPDATE SERVICE");
    }
  }

  Future<void> delete() async {
    try {
      _firestore.collection('todos').doc('testTodos').delete();
    } catch (e) {
      dev.log(e.toString(), name: "DELETE SERVICE");
    }
  }
}
