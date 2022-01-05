import 'package:flutter/material.dart';
import 'package:flutter_widget_test_aula/controller/home_controller.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  final controller = HomeController();
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Home Page'),
        ),
        body: Container(
          alignment: Alignment.center,
          child: Column(
            children: [
              Text(
                "${controller.counter}",
                style: TextStyle(fontSize: 24),
              ),
              const FlutterLogo(
                key: Key('segunda'),
              ),
              Image.network(
                'https://s1.static.brasilescola.uol.com.br/be/e/image/urso.jpg',
                errorBuilder: (_, __, ___) {
                  return Text('Error');
                },
              ),
            ],
          ),
        ),
        floatingActionButton: FloatingActionButton(
          onPressed: () {
            setState(() {
              controller.increment();
            });
          },
          tooltip: 'Increment',
          child: const Icon(Icons.add),
        ));
  }
}
