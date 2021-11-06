import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/app/modules/catalog/catalog_store.dart';

class CatalogPage extends StatefulWidget {
  final String title;
  const CatalogPage({Key? key, this.title = 'CatalogPage'}) : super(key: key);
  @override
  CatalogPageState createState() => CatalogPageState();
}

class CatalogPageState extends State<CatalogPage> {
  final CatalogStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: ListView.builder(
          itemCount: store.fotos.length,
          itemBuilder: (context, index) {
            final foto = store.fotos[index];
            return InkWell(
                onTap: () {
                  Modular.to.pushNamed('/catalog/image_detail');
                },
                child: Card(child: Image.network(foto)));
          }),
    );
  }
}
