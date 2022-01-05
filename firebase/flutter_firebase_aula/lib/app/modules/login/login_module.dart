import 'package:flutter_firebase_aula/app/modules/login/login_Page.dart';
import 'package:flutter_firebase_aula/app/modules/login/login_store.dart';
import 'package:flutter_firebase_aula/app/shared/auth/service/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class LoginModule extends Module {
  @override
  final List<Bind> binds = [
    Bind.lazySingleton((i) => LoginStore(i.get<AuthService>())),
  ];

  @override
  final List<ModularRoute> routes = [
    ChildRoute('/', child: (_, args) => LoginPage()),
  ];
}
