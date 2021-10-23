import 'package:calc_basic_flutter/controller/calc_controller.dart';
import 'package:calc_basic_flutter/view/contador_widget.dart';
import 'package:flutter/material.dart';

class HomePage extends StatefulWidget {
  const HomePage({Key? key}) : super(key: key);

  @override
  _HomePageState createState() => _HomePageState();
}

class _HomePageState extends State<HomePage> {
  Controller controller = Controller();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Calc Basic"),
        centerTitle: true,
      ),
      body: Container(
        alignment: Alignment.center,
        child: Column(
          children: [
            ContadorWidget(),
            ElevatedButton(
                child: const Icon(Icons.add_circle_outline_sharp),
                onPressed: () {
                  controller.add();
                }),
            ElevatedButton(
                child: const Text("-"),
                onPressed: () {
                  controller.decrement();
                }),
          ],
        ),
      ),
    );
  }
}
