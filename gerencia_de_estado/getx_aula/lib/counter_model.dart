import 'package:get/get.dart';

class CounterModel {
  var counter = 0.obs;
  var nome = "".obs;
  void increment()=>counter.value++;
  void setNome(String newName)=>nome.value = newName;
}