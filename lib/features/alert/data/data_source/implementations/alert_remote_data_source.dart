import 'package:coin_dino/core/constants/response_types.dart';
import 'package:coin_dino/core/network/network_clients/coin_gecko_client.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/features/alert/data/data_source/contracts/i_alert_remote_data_source.dart';
import 'package:coin_dino/features/alert/data/exception_handling/exceptions/alert_exceptions.dart';
import 'package:coin_dino/features/alert/data/model/alert_coin_model.dart';
import 'package:dio/dio.dart';

class AlertRemoteDataSource implements IAlertRemoteDataSource {
  var _executer = NetworkExecuter();

  @override
  Future<List<AlertCoinModel>> getGivenCoins(
      {required List<String> coinIds, required String vsCurrency}) async {
    try {
      var alertCoins =
          await _executer.execute<AlertCoinModel, List<AlertCoinModel>>(
              responseType: DefaultResponseTypes.shared.alertCoinModel,
              options: CoinGeckoClient.getAlertCoins(coinIds, vsCurrency));
      if (alertCoins == null) {
        throw DioError(requestOptions: RequestOptions(path: ''));
      }
      return alertCoins;
    } on DioError catch (e) {
      throw AlertException.alertFetchingRemoteException();
    }
  }
}
