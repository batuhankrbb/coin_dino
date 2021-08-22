import '../../../../../core/utils/string_helper.dart';
import 'package:dio/dio.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/coin_gecko_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
import '../../exception_handling/exceptions/alert_exceptions.dart';
import '../../model/alert_coin_model.dart';
import '../contracts/i_alert_remote_data_source.dart';

class AlertRemoteDataSource implements IAlertRemoteDataSource {
  var _executer = NetworkExecuter();

  @override
  Future<List<AlertCoinModel>> getGivenCoins(
      {required List<String> coinIds, required String vsCurrency}) async {
    try {
      var coinsString = StringHelper.shared.convertListToCommaString(coinIds);
      var alertCoins =
          await _executer.execute<AlertCoinModel, List<AlertCoinModel>>(
        responseType: DefaultResponseTypes.shared.alertCoinModel,
        options: CoinGeckoClient.getAlertCoins(coinsString, vsCurrency),
      );

      if (alertCoins == null) {
        throw DioError(requestOptions: RequestOptions(path: ''));
      }

     var sortedAlertCoins = coinIds.map((e) {
        return alertCoins.firstWhere((element) => element.id == e);
      }).toList();

      return sortedAlertCoins;
    } on DioError catch (e) {
      throw AlertException.alertFetchingRemoteException();
    }
  }
}
