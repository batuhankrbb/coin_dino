import 'package:connectivity/connectivity.dart';

import 'network_checker_contract.dart';

class NetworkCheckerImplementation extends NetworkCheckerContract {
  final Connectivity connectivity;

  NetworkCheckerImplementation({required this.connectivity});

  @override
  Future<bool> isConnected() async {
    var connectivityResult = await connectivity.checkConnectivity();
    if (connectivityResult == ConnectivityResult.mobile ||
        connectivityResult == ConnectivityResult.wifi) {
      return true;
    } else {
      return false;
    }
  }
}
