import 'dart:developer' as dev;

import 'package:auth_aula/app/shared/local/local_token.dart';
import 'package:dio/dio.dart';
import 'package:flutter/material.dart';
import 'package:flutter_modular/flutter_modular.dart';

class InterceptorAuth extends InterceptorsWrapper {
  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    final local = Modular.get<LocalToken>();

    options.headers["Authorization"] = "Bearer ${local.token}";
    options.baseUrl = "http://0.0.0.0:8080";
    dev.log("${local.token}", name: "onRequest Token");
    super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    dev.log("${response.data}", name: "onResponse");
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    dev.log("${err.type.index}", name: "onError");
    if (err.response!.statusCode == 401) {
      Modular.get<LocalToken>().isLogged = false;
      Modular.to.popUntil(ModalRoute.withName("/"));
    }
    super.onError(err, handler);
  }
}
