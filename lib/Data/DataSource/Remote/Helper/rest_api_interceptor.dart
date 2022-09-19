import 'package:dio/dio.dart';
import 'package:flutter/foundation.dart';
import 'package:get/route_manager.dart';

import '../../../../Core/Routes/route.dart';

class RestApiInterceptor extends Interceptor {
  bool withAuth;

  RestApiInterceptor({required this.withAuth});

  @override
  void onRequest(RequestOptions options, RequestInterceptorHandler handler) {
    debugPrint(
        '\x1B[36mREQUEST[${options.method}] => PATH: ${options.path}\x1B[0m');
    if (options.queryParameters.isNotEmpty) {
      debugPrint('\x1B[34mQUERYPARAMS => ${options.queryParameters}\x1B[0m');
    }
    if (options.data != null) {
      if (options.data is FormData) {
        debugPrint(
            '\x1B[33mREQUEST FORMDATA BODY FIELDS => ${options.data.fields.toList().toString()}\x1B[0m');
      } else {
        debugPrint('\x1B[33mREQUEST BODY => ${options.data}\x1B[0m');
      }
    }
    if (withAuth) {
      options.headers["Authorization"] = "monjwt";
    }
    return super.onRequest(options, handler);
  }

  @override
  void onResponse(Response response, ResponseInterceptorHandler handler) {
    debugPrint(
        '\x1B[36mRESPONSE[${response.statusCode}] => PATH: ${response.requestOptions.baseUrl} -- ${response.requestOptions.path}\x1B[0m');
    super.onResponse(response, handler);
  }

  @override
  void onError(DioError err, ErrorInterceptorHandler handler) {
    if (err.response?.statusCode == 401) {
      Get.offAllNamed(Routes.todo);
    }
    debugPrint(
        '\x1B[31mERROR[${err.response?.statusCode}] => PATH: ${err.requestOptions.baseUrl} -- ${err.requestOptions.path}\x1B[0m');
    debugPrint('\x1B[31mRESPONSE[${err.response?.data}]\x1B[0m');
    super.onError(err, handler);
  }
}
