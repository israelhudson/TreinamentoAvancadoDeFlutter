import 'package:flutter_test/flutter_test.dart';
import 'package:modular_practices/app/modules/products/products_store.dart';
 
void main() {
  late ProductsStore store;

  setUpAll(() {
    store = ProductsStore();
  });

  test('increment count', () async {
    expect(store.value, equals(0));
    store.increment();
    expect(store.value, equals(1));
  });
}