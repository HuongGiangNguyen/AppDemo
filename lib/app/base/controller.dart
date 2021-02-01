import 'dart:async';

import 'package:connectivity/connectivity.dart';
import 'package:get/get.dart';
enum Status { loading, success, error }

abstract class Controller extends GetxController {
  StreamSubscription<ConnectivityResult> subscription;
  final status = Status.loading.obs;

  void listenConnectivityStatus() {
    subscription = Connectivity()
        .onConnectivityChanged
        .listen((ConnectivityResult result) {
      _updateConnectionStatus(result);
    });
  }

  void cancelConnectivitySubscription() {
    subscription.cancel();
  }

  Future<void> _updateConnectionStatus(ConnectivityResult result) async {
    switch (result) {
      case ConnectivityResult.wifi:
        onConnected();
        printInfo(info: 'ConnectivityResult.wifi');
        break;

      case ConnectivityResult.mobile:
        printInfo(info: 'ConnectivityResult.mobile');
        onConnected();
        break;

      case ConnectivityResult.none:
        printInfo(info: 'ConnectivityResult.none');
        onDisconnect();
        break;
    }
  }

  void onConnected() {}

  void onDisconnect() {}
}
