import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

void main() {
  runApp(GetServerApp(
    jwtKey:
        "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
    getPages: [
      GetPage(name: '/', page: () => Home(), needAuth: true),
      GetPage(name: '/login', page: () => Login()),
    ],
  ));
}

class Home extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    return Text("Welcome to GetX");
  }
}

class Login extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
    final claimSet = JwtClaim(
      expiry: DateTime.now().add(Duration(seconds: 30)),
      issuer: 'get is awesome',
      issuedAt: DateTime.now(),
    );

    var token = TokenUtil.generateToken(claim: claimSet);

    return Json({"sucess": true, "token": token});
  }
}
