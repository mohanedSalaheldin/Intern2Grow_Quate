// import 'package:internet_connection_checker/internet_connection_checker.dart';
import 'package:connectivity_plus/connectivity_plus.dart';

abstract class NetworkInfo {
  Future<bool> get isConnected;
}

class NetworkInfoImpl implements NetworkInfo {
  // final hasConnection;
  // @override
  // Future<bool> get isConnected async =>
  //     await InternetConnectionChecker().hasConnection;
  @override
  Future<bool> get isConnected async {
    final connectivityResult = await (Connectivity().checkConnectivity());
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}

/*
import 'package:connectivity_plus/connectivity_plus.dart';

final connectivityResult = await (Connectivity().checkConnectivity());
if (connectivityResult == ConnectivityResult.mobile) {
  // I am connected to a mobile network.
} else if (connectivityResult == ConnectivityResult.wifi) {
  // I am connected to a wifi network.
} else if (connectivityResult == ConnectivityResult.ethernet) {
  // I am connected to a ethernet network.
} else if (connectivityResult == ConnectivityResult.vpn) {
  // I am connected to a vpn network.
  // Note for iOS and macOS:
  // There is no separate network interface type for [vpn].
  // It returns [other] on any device (also simulator)
} 

 */

