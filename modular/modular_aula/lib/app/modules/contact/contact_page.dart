import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/app/modules/contact/contact_store.dart';
import 'package:flutter/material.dart';

class ContactPage extends StatefulWidget {
  final String title;
  const ContactPage({Key? key, this.title = 'ContactPage'}) : super(key: key);
  @override
  ContactPageState createState() => ContactPageState();
}
class ContactPageState extends State<ContactPage> {
  final ContactStore store = Modular.get();

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