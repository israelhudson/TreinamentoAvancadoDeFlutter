import 'package:flutter_firebase_aula/app/shared/auth/service/auth_service.dart';
import 'package:flutter_modular/flutter_modular.dart';

class FirebaseAuthGuard extends RouteGuard {
  FirebaseAuthGuard() : super(redirectTo: '/login');
  @override
  Future<bool> canActivate(String path, ModularRoute router) {
    final _auth = Modular.get<AuthService>();

    return Future.value(_auth.checkingIfUserIsLogged());
  }
}
