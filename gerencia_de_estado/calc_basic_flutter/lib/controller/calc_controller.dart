import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
  static Controller? _instance;

  Controller._();//unica instancia

  static Controller get instance => _instance ??= Controller._();

  int counter = 0;

  add(){
    counter++;

    notifyListeners();
  }

  decrement(){
    counter--;

    notifyListeners();
  }
}