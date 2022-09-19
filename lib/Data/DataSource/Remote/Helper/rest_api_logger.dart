import 'package:flutter/foundation.dart';
import 'package:get/get.dart';
import 'package:get/get_connect/http/src/request/request.dart';
import 'package:get/get_connect/http/src/response/response.dart';

class RestApiLogger {
  Duration _computeTime = const Duration();
  Stopwatch stopwatch = Stopwatch()..start();

  Request onRequestLogger(Request request) {
    debugPrint(
        '\x1B[36mREQUEST[${request.method}] => PATH: ${request.url}\x1B[0m');
    debugPrint(
        '\x1B[36mREQUEST[${request.method}] => PATH: ${request.headers}\x1B[0m');

    if (request.url.queryParameters.isNotEmpty) {
      debugPrint(
        '\x1B[36mREQUEST[${request.method}] => QUERY-PARAMETERS: ${request.url.queryParameters}\x1B[0m',
      );
    }

    return request;
  }

  Response onResponseLogger(Response response) {
    debugPrint(
      '\x1B[36mRESPONSE[${response.statusCode}] => PATH: ${response.request?.url}\x1B[0m',
    );
    _computeTime = _computeTime + stopwatch.elapsed;
    debugPrint(
      '\x1B[33mCOMPUTE TIME : ${stopwatch.elapsed} - TOTAL : ${_computeTime.toString()}\x1B[0m',
    );
    _computeTime = const Duration();
    return response;
  }

  Response onErrorLogger(Response response) {
    debugPrint(
      '\x1B[31mERROR[${response.statusCode}] => PATH: ${response.request?.url}\x1B[0m',
    );
    _computeTime = _computeTime + stopwatch.elapsed;
    debugPrint('\x1B[33mCOMPUTE TIME : ${stopwatch.elapsed}\x1B[0m');
    _computeTime = const Duration();
    return response;
  }
}
