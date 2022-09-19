import 'dart:async';

import 'package:dartz/dartz.dart';
import 'package:dio/dio.dart' as dio;
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

import '../../../../Core/Routes/route.dart';
import '../../../../Core/Services/connectivity_checker.dart';
import 'rest_api_toast.dart';

abstract class RestApiRepository {
  final dio.Dio client;
  @protected
  final String _controller;
  ConnectivityChecker networkManager =
      Get.find<ConnectivityChecker>(tag: "connectivity");

  String get controller => _controller;

  RestApiRepository({
    required String controller,
    required this.client,
  }) : _controller = controller;

  Future<Either<dynamic, dynamic>> handlingGetResponse({
    required String queryRoute,
    Map<String, dynamic>? queryParameters,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    if (networkManager.connectionType != 0) {
      try {
        dio.Response kResponse = await client.get(
          queryRoute,
          queryParameters: queryParameters,
        );
        return _verifError(
          response: kResponse,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } on dio.DioError catch (exception, stackTrace) {
        if (exception.response != null) {
          return _verifError(
            response: exception.response!,
            showError: showError!,
            showSuccess: showSuccess!,
            isCustomResponse: isCustomResponse!,
            overrideSuccessMessage: overrideSuccessMessage,
            overrideErrorMessage: overrideErrorMessage,
          );
        } else {
          String kFailure = "API injoignable. base locale consommée";
          if (showError!) {
            _flushToast(
              method: exception.requestOptions.method,
              isSuccess: false,
              isError: true,
              showSuccess: showSuccess!,
              showError: showError,
              customErrorMessage: kFailure,
            );
          }
        }
        return left(stackTrace.toString());
      } catch (exception, stackTrace) {
        return left(stackTrace.toString());
      }
    } else {
      Get.toNamed(Routes.todo);
      return left('Aucune connection');
    }
  }

  Future<Either<dynamic, dynamic>> handlingPutResponse({
    required String queryRoute,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    if (networkManager.connectionType != 0) {
      try {
        dio.Response kResponse = await client.put(
          queryRoute,
          queryParameters: queryParameters,
          data: body,
        );

        return _verifError(
          response: kResponse,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } on dio.DioError catch (exception, stackTrace) {
        if (exception.response != null) {
          return _verifError(
            response: exception.response!,
            showError: showError!,
            showSuccess: showSuccess!,
            isCustomResponse: isCustomResponse!,
            overrideSuccessMessage: overrideSuccessMessage,
            overrideErrorMessage: overrideErrorMessage,
          );
        } else {
          String kFailure = "API injoignable. base locale consommée";
          if (showError!) {
            _flushToast(
              method: exception.requestOptions.method,
              isSuccess: false,
              isError: true,
              showSuccess: showSuccess!,
              showError: showError,
              customErrorMessage: kFailure,
            );
          }
        }
        return left(stackTrace.toString());
      } catch (exception, stackTrace) {
        return left(stackTrace.toString());
      }
    } else {
      Get.toNamed(Routes.todo);
      return left('Aucune connection');
    }
  }

  Future<Either<dynamic, dynamic>> handlingPatchResponse({
    required String queryRoute,
    required dynamic body,
    Map<String, dynamic>? queryParameters,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    if (networkManager.connectionType != 0) {
      try {
        dio.Response kResponse = await client.patch(
          queryRoute,
          queryParameters: queryParameters,
          data: body,
        );

        return _verifError(
          response: kResponse,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } on dio.DioError catch (exception, stackTrace) {
        if (exception.response != null) {
          return _verifError(
            response: exception.response!,
            showError: showError!,
            showSuccess: showSuccess!,
            isCustomResponse: isCustomResponse!,
            overrideSuccessMessage: overrideSuccessMessage,
            overrideErrorMessage: overrideErrorMessage,
          );
        } else {
          String kFailure = "API injoignable. base locale consommée";
          if (showError!) {
            _flushToast(
              method: exception.requestOptions.method,
              isSuccess: false,
              isError: true,
              showSuccess: showSuccess!,
              showError: showError,
              customErrorMessage: kFailure,
            );
          }
        }
        return left(stackTrace.toString());
      } catch (exception, stackTrace) {
        return left(stackTrace.toString());
      }
    } else {
      Get.toNamed(Routes.todo);
      return left('Aucune connection');
    }
  }

  Future<Either<dynamic, dynamic>> handlingPostResponse({
    required String queryRoute,
    dynamic body,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? header,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    if (networkManager.connectionType != 0) {
      try {
        dio.Response kResponse = await client.post(
          queryRoute,
          options: dio.Options(
            validateStatus: (status) =>
                status != null && (status >= 200 && status < 300) ||
                status == 422,
          ),
          queryParameters: queryParameters,
          data: body,
        );

        return _verifError(
          response: kResponse,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } on dio.DioError catch (exception, stackTrace) {
        if (exception.response != null) {
          return _verifError(
            response: exception.response!,
            showError: showError!,
            showSuccess: showSuccess!,
            isCustomResponse: isCustomResponse!,
            overrideSuccessMessage: overrideSuccessMessage,
            overrideErrorMessage: overrideErrorMessage,
          );
        } else {
          String kFailure = "API injoignable. base locale consommée";
          if (showError!) {
            _flushToast(
              method: exception.requestOptions.method,
              isSuccess: false,
              isError: true,
              showSuccess: showSuccess!,
              showError: showError,
              customErrorMessage: kFailure,
            );
          }
        }
        return left(stackTrace.toString());
      } catch (exception, stackTrace) {
        return left(stackTrace.toString());
      }
    } else {
      Get.toNamed(Routes.todo);
      return left('Aucune connection');
    }
  }

  Future<Either<dynamic, dynamic>> handlingDeleteResponse({
    required String queryRoute,
    Map<String, dynamic>? queryParameters,
    Map<String, String>? headers,
    dynamic body,
    dio.Options? options,
    bool? showError = true,
    bool? showSuccess = true,
    bool? isCustomResponse = false,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) async {
    if (networkManager.connectionType != 0) {
      try {
        dio.Response kResponse = await client.delete(
          queryRoute,
          queryParameters: queryParameters,
          data: body,
          options: options,
        );
        return _verifError(
          response: kResponse,
          showError: showError!,
          showSuccess: showSuccess!,
          isCustomResponse: isCustomResponse!,
          overrideSuccessMessage: overrideSuccessMessage,
          overrideErrorMessage: overrideErrorMessage,
        );
      } on dio.DioError catch (exception, stackTrace) {
        if (exception.response != null) {
          return _verifError(
            response: exception.response!,
            showError: showError!,
            showSuccess: showSuccess!,
            isCustomResponse: isCustomResponse!,
            overrideSuccessMessage: overrideSuccessMessage,
            overrideErrorMessage: overrideErrorMessage,
          );
        } else {
          String kFailure = "API injoignable. base locale consommée";
          if (showError!) {
            _flushToast(
              method: exception.requestOptions.method,
              isSuccess: false,
              isError: true,
              showSuccess: showSuccess!,
              showError: showError,
              customErrorMessage: kFailure,
            );
          }
        }
        return left(stackTrace.toString());
      } catch (exception, stackTrace) {
        _flushToast(
          showError: true,
          method: 'EXCEPTION',
          showSuccess: false,
          isSuccess: false,
          isError: true,
        );
        return left(stackTrace.toString());
      }
    } else {
      Get.toNamed(Routes.todo);
      return left('Aucune connection');
    }
  }

  /// Vérifie si la réponse contient des erreurs, renvoie un Either en fonction
  Either<dynamic, dynamic> _verifError({
    required dio.Response response,
    required bool showError,
    required bool showSuccess,
    required bool isCustomResponse,
    String? overrideSuccessMessage,
    String? overrideErrorMessage,
  }) {
    bool kIsSuccess = (response.statusCode ?? 520) >= 200 &&
        (response.statusCode ?? 520) <= 206;
    try {
      if (kIsSuccess) {
        if (isCustomResponse) {
          _flushToast(
            method: response.requestOptions.method,
            isSuccess: kIsSuccess,
            isError: false,
            showSuccess: showSuccess,
            showError: showError,
            customSuccessMessage:
                overrideSuccessMessage ?? response.data['message'],
          );
          return right(response.data);
        } else {
          _flushToast(
            method: response.requestOptions.method,
            isSuccess: kIsSuccess,
            isError: false,
            showSuccess: showSuccess,
            showError: showError,
            customSuccessMessage: overrideSuccessMessage,
          );
          if (!response.data.containsKey("data")) {
            response.data["data"] = "{}";
          }
          if (response.data.containsKey('meta')) {
            List<dynamic> element = response.data['data'];
            for (var value in element) {
              value.addAll(
                {'meta': response.data['meta']},
              );
            }
          }
          return right(response.data["data"]);
        }
      } else {
        debugPrint("isCustomResponse: ${response.data}");
        if (isCustomResponse) {
          if (showError) {
            String customMessage = response.data['message'];
            _flushToast(
              method: response.requestOptions.method,
              isSuccess: kIsSuccess,
              isError: true,
              showSuccess: showSuccess,
              showError: showError,
              customErrorMessage: overrideErrorMessage ?? customMessage,
            );
          }
          return left(response.data);
        }
        return left("[${response.statusCode}] ${response.data}");
      }
    } catch (exception) {
      String kFailure = "API injoignable. base locale consommée";
      if (showError) {
        _flushToast(
          method: response.requestOptions.method,
          isSuccess: kIsSuccess,
          isError: true,
          showSuccess: showSuccess,
          showError: showError,
          customErrorMessage: kFailure,
        );
      }
      return left(kFailure);
    }
  }
}

void _flushToast({
  required String method,
  required bool isSuccess,
  required bool isError,
  required bool showSuccess,
  required bool showError,
  String? customSuccessMessage,
  String? customErrorMessage,
}) {
  String kMessage = "";
  switch (method) {
    case "GET":
      kMessage = isSuccess
          ? customSuccessMessage ?? "Récupération effectuée"
          : customErrorMessage ?? "Récupération échouée";
      break;
    case "POST":
      kMessage = isSuccess
          ? customSuccessMessage ?? "Création effectuée"
          : customErrorMessage ?? "Création échouée";
      break;
    case "PUT":
      kMessage = isSuccess
          ? customErrorMessage ?? "Mise à jour effectuée"
          : customErrorMessage ?? "Mise à jour échouée";
      break;
    case "DELETE":
      kMessage = isSuccess
          ? customErrorMessage ?? "Suppression effectuée"
          : customErrorMessage ?? "Suppression échouée";
      break;
    case "PATCH":
      kMessage = isSuccess
          ? customErrorMessage ?? "Patch effectuée"
          : customErrorMessage ?? "Patch echoué";
      break;
    case "EXCEPTION":
      kMessage = "Erreur inatendue";
      break;
  }
  if (Get.context != null) {
    if (isSuccess && showSuccess) {
      Toast.showSnackBar(
          context: Get.context!, snackBar: Toast.success(message: kMessage));
    } else if (showError && isError) {
      Toast.showSnackBar(
          context: Get.context!, snackBar: Toast.error(message: kMessage));
    }
  }
}
