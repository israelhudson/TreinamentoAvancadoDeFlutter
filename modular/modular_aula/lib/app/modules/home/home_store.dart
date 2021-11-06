import 'package:mobx/mobx.dart';

class HomeStore {
  final _counter = Observable(0);

  int get counter => _counter.value;
  set counter(int value) => _counter.value = value;

  void increment() {
    runInAction(() {
      counter++;
    });
  }

  Computed<bool> get isPar => Computed<bool>(() {
        if (counter % 2 == 0) {
          return true;
        } else {
          return false;
        }
      });

  reaction() {
    return autorun((fn) {
      print('LEAD ${isPar.value}');
    });
  }
}
