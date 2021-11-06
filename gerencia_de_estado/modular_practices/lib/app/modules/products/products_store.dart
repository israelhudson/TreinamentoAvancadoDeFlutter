import 'package:mobx/mobx.dart';

part 'products_store.g.dart';

class ProductsStore = _ProductsStoreBase with _$ProductsStore;
abstract class _ProductsStoreBase with Store {

  @observable
  int value = 0;

  @action
  void increment() {
    value++;
  } 
}