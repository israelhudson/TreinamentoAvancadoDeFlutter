import 'package:mobx/mobx.dart';

part 'counter_store.g.dart';

class CounterStore = CounterStoreBase with _$CounterStore;

abstract class CounterStoreBase with Store {
  @observable
  var counter = 0;

  @action
  increment(int newValue)=>counter = counter + newValue;
}
