import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter/material.dart';
import 'package:flutter_firebase_aula/app/shared/tools/log_tool.dart';
import 'package:flutter_modular/flutter_modular.dart';

class AppWidget extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Slidy',
      theme: ThemeData(primarySwatch: Colors.blue),
      builder: (context, child) {
        FirebaseAuth.instance.authStateChanges().listen((User? user) {
          if (user == null) {
            log.i("GLOBAL: User SAIU");
            Modular.to.popAndPushNamed('/login');
          } else {
            log.i("GLOBAL: User LOGGER ${user.email}");
          }
        });
        return child!;
      },
    ).modular();
  }
}
