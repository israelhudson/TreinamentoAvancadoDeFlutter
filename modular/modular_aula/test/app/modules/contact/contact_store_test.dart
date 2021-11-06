import 'package:flutter_test/flutter_test.dart';
import 'package:modular_aula/app/modules/contact/contact_store.dart';
 
void main() {
  late ContactStore store;

  setUpAll(() {
    store = ContactStore();
  });
}