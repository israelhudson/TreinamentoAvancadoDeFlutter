import 'package:modular_aula/app/modules/contact/contact_Page.dart';
import 'package:modular_aula/app/modules/contact/contact_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ContactModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ContactStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ContactPage()),
  ];
}
