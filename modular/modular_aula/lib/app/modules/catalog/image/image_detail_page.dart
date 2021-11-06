import 'package:flutter/material.dart';

class ImageDetailPage extends StatefulWidget {
  final String title;
  const ImageDetailPage({Key? key, this.title = 'ImageDetailPage'}) : super(key: key);
  @override
  ImageDetailPageState createState() => ImageDetailPageState();
}
class ImageDetailPageState extends State<ImageDetailPage> {
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