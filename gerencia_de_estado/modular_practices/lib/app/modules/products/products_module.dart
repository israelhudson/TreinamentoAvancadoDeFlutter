import 'package:modular_practices/app/modules/products/products_Page.dart';
import 'package:modular_practices/app/modules/products/products_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class ProductsModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => ProductsStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => ProductsPage()),
  ];
}
