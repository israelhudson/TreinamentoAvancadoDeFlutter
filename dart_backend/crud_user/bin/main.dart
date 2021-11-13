import 'package:get_server/get_server.dart';

import 'routes/routes.dart';

void main() {
  runApp(GetServer(
      jwtKey:
          "eyJhbGciOiJIUzI1NiIsInR5cCI6IkpXVCJ9.eyJzdWIiOiIxMjM0NTY3ODkwIiwibmFtZSI6IkpvaG4gRG9lIiwiaWF0IjoxNTE2MjM5MDIyfQ.SflKxwRJSMeKKF2QT4fwpMeJf36POk6yJV_adQssw5c",
      getPages: [
        GetPage(name: '/', page: () => Home()),
        GetPage(name: '/login', page: () => LoginRoute(), method: Method.post),
        GetPage(name: '/register', page: () => RegisterRoute()),
        GetPage(
            name: '/todo',
            page: () => TodoRoute(),
            method: Method.get,
            needAuth: true),
      ]));
}
