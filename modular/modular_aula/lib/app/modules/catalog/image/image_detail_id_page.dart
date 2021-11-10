import 'package:flutter/material.dart';
import 'package:modular_aula/app/modules/catalog/catalog_store.dart';
import 'package:modular_aula/app/modules/catalog/model/image_model.dart';

class ImageDetailIdPage extends StatefulWidget {
  final String id;
  const ImageDetailIdPage({Key? key, this.id = 'ImageDetailIdPage'})
      : super(key: key);
  @override
  ImageDetailIdPageState createState() => ImageDetailIdPageState();
}

class ImageDetailIdPageState extends State<ImageDetailIdPage> {
  final catalogStore = CatalogStore();
  ImageModel? imageModel;
  @override
  void initState() {
    super.initState();

    if (widget.id == "1") {
      imageModel = catalogStore.photos[0];
    } else if (widget.id == "2") {
      imageModel = catalogStore.photos[1];
    }
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.id),
      ),
      body: Column(
        children: <Widget>[
          Image.network(imageModel!.url),
        ],
      ),
    );
  }
}
