import 'package:flutter/material.dart';
import 'package:flutter_firebase_aula/app/modules/home/home_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  String text = "nada";
  String idDoc = "Y3yEk4CcfufFOqaHanHo";

  final edtController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Column(
        children: [
          TextField(
            controller: edtController,
            autofocus: true,
            decoration: const InputDecoration(
                border: InputBorder.none,
                icon: Icon(Icons.person),
                hintText: 'Informe o todo'),
          ),
          // ElevatedButton(
          //     onPressed: () =>
          //         store.createFeito(title: edtController.text, isDone: false),
          //     child: Text("Create")),
          // ElevatedButton(
          //     onPressed: () => store.readFeito(idDoc: idDoc),
          //     child: Text("Read")),
          // ElevatedButton(
          //     onPressed: () => store.updateFeito(
          //         idDoc: idDoc,
          //         data: {'titulo': edtController.text, 'feito': true}),
          //     child: Text("Update")),
          // ElevatedButton(
          //     onPressed: () => store.deleteFeito(idDoc: idDoc),
          //     child: Text("Delete")),
          ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/todo'),
              child: Text("IR PARA TODO PAGE")),
          ElevatedButton(
              onPressed: () => Modular.to.pushNamed('/login'),
              child: Text("IR PARA LOGIN PAGE")),
          Text('$text'),
          ElevatedButton(
              onPressed: () => store.logout(), child: Text("LOGOUT")),
        ],
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //store.createTodo();
          // store.readFeito(idDoc: idDoc).then((value) {
          //   setState(() {
          //     text = value;
          //   });
          // });
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
