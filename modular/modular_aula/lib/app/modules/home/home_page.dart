import 'package:flutter/material.dart';
import 'package:flutter_mobx/flutter_mobx.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:modular_aula/app/modules/home/home_store.dart';

class HomePage extends StatefulWidget {
  final String title;
  const HomePage({Key? key, this.title = "Home"}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends ModularState<HomePage, HomeStore> {
  @override
  void initState() {
    super.initState();
    store.reaction();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Counter'),
      ),
      body: Center(
        child: Column(
          children: [
            Observer(
              builder: (context) => Text(
                '${store.counter}',
                style: TextStyle(fontSize: 22),
              ),
            ),
            Observer(
              builder: (context) => Text(
                '${store.isPar.value}',
                style: TextStyle(fontSize: 22),
              ),
            ),
            ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/contact'),
                child: Text('Contato')),
            ElevatedButton(
                onPressed: () => Modular.to.pushNamed('/catalog'),
                child: Text('Catalogo')),
          ],
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          //dev.log('INCREMENTOU');
          //dev.debugger();
          store.increment();
        },
        child: Icon(Icons.add),
      ),
    );
  }
}
