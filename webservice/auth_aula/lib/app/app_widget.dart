import 'dart:async';

import 'package:auth_aula/app/modules/login/login_store.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, Widget? child) {
        const oneSec = Duration(seconds: 10);
        Timer.periodic(oneSec, (Timer t) => LoginStore().renewAuth()); //REFRESH
        return child!;
      },
    ).modular();
  }
}
