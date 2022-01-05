import 'package:flutter_firebase_aula/app/shared/auth/service/auth_service.dart';

class LoginStore {
  final AuthService _authService;

  LoginStore(this._authService);

  Future<void> loginUser() async {
    return await _authService.login();
  }

  Future<void> checkUser() async {
    await _authService.checkingIfUserIsLogged();
  }

  Future<void> logout() async {
    await _authService.logoff();
  }
}
