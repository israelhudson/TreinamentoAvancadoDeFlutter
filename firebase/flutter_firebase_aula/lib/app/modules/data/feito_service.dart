import 'dart:developer' as dev;

import 'package:cloud_firestore/cloud_firestore.dart';

class FeitoService {
  final FirebaseFirestore _firestore = FirebaseFirestore.instance;
  CollectionReference tarefas =
      FirebaseFirestore.instance.collection('tarefas');

  Future<void> create({required String title, bool isDone = false}) async {
    try {
      await tarefas.add({'titulo': '$title', 'feito': isDone});
    } on Exception catch (e) {
      dev.log(e.toString(), name: "CREATE SERVICE");
    }
  }

  Future<String> read({required String idDoc}) async {
    DocumentSnapshot documentSnapshot;

    try {
      documentSnapshot =
          await _firestore.collection('tarefas').doc('$idDoc').get();
      return documentSnapshot.data().toString();
    } on Exception catch (e) {
      dev.log(e.toString(), name: "READ SERVICE");
      return e.toString();
    }
  }

  Future<void> update(
      {required String idDoc, required Map<String, Object?> data}) async {
    try {
      _firestore.collection('tarefas').doc('$idDoc').update(data);
    } catch (e) {
      dev.log(e.toString(), name: "UPDATE SERVICE");
    }
  }

  Future<void> delete({required String idDoc}) async {
    try {
      _firestore.collection('tarefas').doc('$idDoc').delete();
    } catch (e) {
      dev.log(e.toString(), name: "DELETE SERVICE");
    }
  }
}
