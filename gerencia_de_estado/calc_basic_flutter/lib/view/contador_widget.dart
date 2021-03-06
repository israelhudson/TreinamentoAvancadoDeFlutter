import 'package:calc_basic_flutter/controller/calc_controller.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

class ContadorWidget extends StatelessWidget {
  ContadorWidget({Key? key}) : super(key: key);

  Controller controller = GetIt.I<Controller>();

  @override
  Widget build(BuildContext context) {
    return AnimatedBuilder(
        animation: controller,
        builder: (_, __) {
          return Text(
            '${controller.counter}',
            style: const TextStyle(fontSize: 20),
          );
        }
    );
  }
}
