import 'package:flutter_test/flutter_test.dart';
import 'package:modular_aula/app/modules/catalog/catalog_store.dart';

void main() {
  late CatalogStore store;

  setUpAll(() {
    store = CatalogStore();
  });
}
