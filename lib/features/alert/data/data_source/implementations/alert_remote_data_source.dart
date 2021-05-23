import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';
import 'package:coin_dino/features/alert/data/model/alert_coin_model.dart';

class AlertRemoteDataSource implements IAlertRemoteDataSource {
  @override
  Future<List<AlertCoinModel>> getGivenCoins(
      {required List<String> coinIds, required String vsCurrency}) {
    try {
      //TODO İMPLEMENT EDİLECEK
      throw "";
    } catch (e) {
      throw AlertException.alertFetchingRemoteException();
    }
  }
}
