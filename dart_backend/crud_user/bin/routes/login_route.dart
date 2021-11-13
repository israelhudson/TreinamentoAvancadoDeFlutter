import 'dart:convert';
import 'dart:io';
import 'package:get_server/get_server.dart';
import 'package:jaguar_jwt/jaguar_jwt.dart';

class LoginRoute extends StatelessWidget {
  @override
  Widget build(BuildContext context) {
        final claimSet = JwtClaim(
      expiry: DateTime.now().add(Duration(seconds: 150)),
      issuer: 'get is awesome',
      issuedAt: DateTime.now(),
    );

    var token = TokenUtil.generateToken(claim: claimSet);

    return Json({"sucess": true, "token": token});
  }
}