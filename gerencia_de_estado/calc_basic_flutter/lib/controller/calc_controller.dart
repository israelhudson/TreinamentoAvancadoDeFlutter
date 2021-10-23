import 'package:flutter/cupertino.dart';

class Controller extends ChangeNotifier {
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