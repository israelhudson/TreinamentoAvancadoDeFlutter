import 'package:dio/dio.dart';

import 'interceptor_auth.dart';

class CustomDio {
  late Dio _dio;

  CustomDio(this._dio);

  Dio get i {
    _dio.interceptors.add(InterceptorAuth());
    return _dio;
  }
}
