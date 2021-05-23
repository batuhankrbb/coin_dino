import '../../model/alert_coin_model.dart';

abstract class IAlertRemoteDataSource {
  Future<List<AlertCoinModel>> getGivenCoins({required List<String> coinIds, required String vsCurrency});
}
