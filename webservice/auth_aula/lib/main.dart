import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';
import 'package:get_storage/get_storage.dart';

import 'app/app_module.dart';
import 'app/app_widget.dart';

void main() async {
  await GetStorage.init();

  runApp(ModularApp(module: AppModule(), child: AppWidget()));
}
