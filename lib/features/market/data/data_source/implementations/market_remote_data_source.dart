import 'package:dio/dio.dart';

import '../../../../../core/constants/response_types.dart';
import '../../../../../core/network/network_clients/coin_gecko_client.dart';
import '../../../../../core/network/network_fetching/network_executer.dart';
import '../../../../../core/utils/error_printer.dart';
import '../../exception_handling/exceptions/market_exceptions.dart';
import '../../models/market_coin_model.dart';
import '../contracts/i_market_remote_data_source.dart';

class MarketRemoteDataSource implements IMarketRemoteDataSource {
  var _executer = NetworkExecuter();

  int? page;
  @override
  Future<List<MarketCoinModel>> getCryptoCurrencies(
      String date, String sort, String? category, String vsCurrency, int page) async {
    try {
      var response =
          await _executer.execute<MarketCoinModel, List<MarketCoinModel>>(
              responseType: DefaultResponseTypes.shared.marketCoinModel,
              options: CoinGeckoClient.coinsMarket(
                  date, sort, category, vsCurrency, page));

      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError("MarketRemoteDataSource/getCryptoCurrencies", e);
      throw MarketException.cryptoCurrencyFetchingException();
    }
  }
}
