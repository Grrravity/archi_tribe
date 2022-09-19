import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';
import 'package:flutter/foundation.dart';
import 'package:get/get.dart';

class ConnectivityChecker extends GetxController {
  ///NOTE 0 = Pas d'internet, 1 = WIFI ,2 = Mobile data, 3 = Ethernet.
  int connectionType = 0;
  final Connectivity _connectivity = Connectivity();
  // Stream pour écouter le changement d'état
  late StreamSubscription _streamSubscription;

  @override
  void onInit() {
    getConnectionType();
    _streamSubscription =
        _connectivity.onConnectivityChanged.listen(_updateState);
    super.onInit();
  }

  // Check l'état de la connection et mets à jour le status
  Future<void> getConnectionType() async {
    ConnectivityResult connectivityResult;
    try {
      connectivityResult = await (_connectivity.checkConnectivity());
    } catch (exception) {
      debugPrint(exception.toString());
      return;
    }
    return _updateState(connectivityResult);
  }

  /// Update [connectionType] suivant la valeure du réseau
  /// 0 = Pas d'internet, 1 = WIFI ,2 = Mobile data, 3 = Ethernet.
  _updateState(ConnectivityResult result) {
    if (kDebugMode) {
      connectionType = 1;
    } else {
      switch (result) {
        case ConnectivityResult.wifi:
          connectionType = 1;
          update();
          break;
        case ConnectivityResult.mobile:
          connectionType = 2;
          update();
          break;
        case ConnectivityResult.ethernet:
          connectionType = 3;
          update();
          break;
        case ConnectivityResult.none:
          connectionType = 0;
          update();
          break;
        default:
          Get.snackbar('Network Error', 'Failed to get Network Status');
          break;
      }
    }
  }

  @override
  void onClose() {
    // Ferme le stream
    _streamSubscription.cancel();
  }
}
