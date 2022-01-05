import 'package:flutter/cupertino.dart';
import 'package:flutter_test_aula/app/shared/data/user_service.dart';
import 'package:flutter_test_aula/app/shared/model/user_model.dart';

class HomeController extends ChangeNotifier {
  UserService service;

  HomeController({required this.service});

  int counter = 0;

  void increment() {
    counter = counter + 1;
    notifyListeners();
  }

  void decrement() {
    counter = counter - 1;
    notifyListeners();
  }

  Future<List<UserModel>> fetchUsers() async {
    return await service.getUsers();
  }
}
