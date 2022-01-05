import 'package:flutter_firebase_aula/app/modules/data/feito_service.dart';
import 'package:flutter_firebase_aula/app/modules/data/todo_service.dart';
import 'package:flutter_firebase_aula/app/shared/auth/service/auth_service.dart';

class HomeStore {
  final TodoService _todoService;
  final FeitoService _feitoService;
  final AuthService _authService;

  HomeStore(this._todoService, this._feitoService, this._authService);

  Future<void> logout() async {
    await _authService.logoff();
  }

  // Future<void> createTodo() async {
  //   await _todoService.create();
  // }
  //
  // Future<String> readTodo() async {
  //   return await _todoService.read();
  // }
  //
  // Future<void> updateTodo() async {
  //   return await _todoService.update();
  // }
  //
  // Future<void> deleteTodo() async {
  //   return await _todoService.delete();
  // }
  //
  // Future<void> createFeito({required String title, bool isDone = false}) async {
  //   await _feitoService.create(title: title, isDone: isDone);
  // }
  //
  // Future<String> readFeito({required String idDoc}) async {
  //   return await _feitoService.read(idDoc: idDoc);
  // }
  //
  // Future<void> updateFeito(
  //     {required String idDoc, required Map<String, Object?> data}) async {
  //   return await _feitoService.update(idDoc: idDoc, data: data);
  // }
  //
  // Future<void> deleteFeito({required String idDoc}) async {
  //   return await _feitoService.delete(idDoc: idDoc);
  // }
}
