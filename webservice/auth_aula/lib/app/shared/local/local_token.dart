import 'package:get_storage/get_storage.dart';

class LocalToken {
  //final box = Hive.box('auth');
  final box = GetStorage();

  String get token => box.read("token");

  set token(String value) {
    box.write('token', value);
  }
}
