import 'package:flutter/material.dart';
import 'package:flutter_firebase_aula/app/modules/login/login_store.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginPage extends StatefulWidget {
  final String title;
  const LoginPage({Key? key, this.title = 'LoginPage'}) : super(key: key);
  @override
  LoginPageState createState() => LoginPageState();
}

class LoginPageState extends State<LoginPage> {
  final LoginStore store = Modular.get();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.title),
      ),
      body: Column(
        children: <Widget>[
          ElevatedButton(
              onPressed: () {
                store.loginUser();
              },
              child: Text("Login")),
          ElevatedButton(
              onPressed: () {
                store.checkUser();
              },
              child: Text("Check Login")),
          ElevatedButton(
              onPressed: () {
                store.logout();
              },
              child: Text("Logout User")),
        ],
      ),
    );
  }
}
