import 'package:auth_aula/app/shared/config/interceptor_auth.dart';
import 'package:dio/dio.dart';

class CustomDio {
  late Dio _dio;

  CustomDio(this._dio);

  Dio get i {
    _dio.interceptors.add(InterceptorAuth());
    return _dio;
  }
}
