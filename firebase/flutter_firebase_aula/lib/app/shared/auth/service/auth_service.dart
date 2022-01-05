import 'package:firebase_auth/firebase_auth.dart';
import 'package:flutter_firebase_aula/app/shared/tools/log_tool.dart';

const email = "hudson@gmail.com";
const password = "123456";

class AuthService {
  final FirebaseAuth _auth = FirebaseAuth.instance;

  Future<void> login() async {
    _auth
        .signInWithEmailAndPassword(email: email, password: password)
        .then((firebaseUser) {
      log.i("sucesso! ${firebaseUser.user!.email}");
      return null;
    }).catchError((e) {
      log.e(e);
    });
  }

  Future<bool> checkingIfUserIsLogged() async {
    User? fbUser = _auth.currentUser;
    if (fbUser != null) {
      log.i("USUÁRIO ${fbUser.email} LOGADO!");
      return true;
    } else {
      log.w("NENHUM USUÁRIO LOGADO");
      return false;
    }
  }

  Future<void> logoff() async {
    await _auth.signOut();
  }
}
