import 'package:flutter/material.dart';
import 'package:modular_aula/app/modules/catalog/catalog_store.dart';
import 'package:modular_aula/app/modules/catalog/model/image_model.dart';

class ImageDetailPage extends StatefulWidget {
  final ImageModel imageModel;
  const ImageDetailPage({Key? key, required this.imageModel}) : super(key: key);
  @override
  ImageDetailPageState createState() => ImageDetailPageState();
}

class ImageDetailPageState extends State<ImageDetailPage> {
  final catalogStore = CatalogStore();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.imageModel.title),
      ),
      body: Column(
        children: <Widget>[
          Hero(
              tag: widget.imageModel.title,
              child: Image.network(widget.imageModel.url)),
        ],
      ),
    );
  }
}
