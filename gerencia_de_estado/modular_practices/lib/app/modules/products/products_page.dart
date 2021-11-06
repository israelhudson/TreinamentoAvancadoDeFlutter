import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_practices/app/modules/products/products_store.dart';
import 'package:flutter/material.dart';

class ProductsPage extends StatefulWidget {
  final String title;
  const ProductsPage({Key? key, this.title = 'ProductsPage'}) : super(key: key);
  @override
  ProductsPageState createState() => ProductsPageState();
}
class ProductsPageState extends State<ProductsPage> {
  final ProductsStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[],
      ),
    );
  }
}