import 'dart:async';

import 'package:connectivity_plus/connectivity_plus.dart';

class NetworkService {
  static final Connectivity _connectivity = Connectivity();
  static final StreamController<bool> _connectionController =
      StreamController<bool>.broadcast();

  static Stream<bool> get onConnectionChange => _connectionController.stream;

  static Future<bool> hasInternetConnection() async {
    var result = await _connectivity.checkConnectivity();
    return result != ConnectivityResult.none;
  }

  static void listenToConnectionChanges(Function() onConnected) {
    _connectivity.onConnectivityChanged.listen((result) {
      bool isConnected = result != ConnectivityResult.none;
      _connectionController.add(isConnected);
      if (isConnected) {
        onConnected();
      }
    });
  }
}
