import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/app/modules/catalog/catalog_Page.dart';
import 'package:modular_aula/app/modules/catalog/catalog_store.dart';
import 'package:modular_aula/app/modules/catalog/image/image_detail_id_page.dart';
import 'package:modular_aula/app/modules/catalog/image/image_detail_page.dart';

class CatalogModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => CatalogStore()),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => CatalogPage()),
    ChildRoute('/image_detail',
        child: (_, args) => ImageDetailPage(imageModel: args.data)),
    ChildRoute('/image_detail_id/:id',
        child: (_, args) => ImageDetailIdPage(id: args.params["id"])),
  ];
}
