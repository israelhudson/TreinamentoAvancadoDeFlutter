import 'package:calc_basic_flutter/controller/calc_controller.dart';
import 'package:calc_basic_flutter/view/home_page.dart';
import 'package:flutter/material.dart';
import 'package:get_it/get_it.dart';

void main() {
  GetIt.I.registerSingleton<Controller>(Controller());

  runApp(const MaterialApp(
    title: 'Calc Basic',
    themeMode: ThemeMode.dark,
    home: HomePage()
  ));
}