import 'package:mobx/mobx.dart';

class CounterStore {
  late Action increment;
  final _counter = Observable(0);

  CounterStore() {
    increment = Action(_increment);
  }

  int get counter => _counter.value;

  set counter(int newValue) => _counter.value = newValue;

  void _increment() {
    _counter.value++;
  }
}
