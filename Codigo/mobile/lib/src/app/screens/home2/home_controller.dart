import 'package:connectivity/connectivity.dart';
import 'package:mobx/mobx.dart';

part 'home_controller.g.dart';

class HomeController2 = _HomeController6 with _$HomeController2;

abstract class _HomeController6 with Store {
  @observable
  bool isConnected = true;

  _HomeController6() {
    this._isConnectedListener();
  }
  _isConnectedListener() {
    Connectivity().onConnectivityChanged.listen((connection) {
      print('_isConnectedListener: $connection');
      if (connection == ConnectivityResult.none) {
        this.isConnected = false;
      } else {
        this.isConnected = true;
      }
    });
  }
}
