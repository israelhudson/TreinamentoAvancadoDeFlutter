import 'package:get_storage/get_storage.dart';

class LocalToken {
  final box = GetStorage();

  bool get isLogged => box.read("isLogged");

  set isLogged(bool value) {
    box.write('isLogged', value);
  }

  String get token => box.read("token");

  set token(String value) {
    box.write('token', value);
  }
}
