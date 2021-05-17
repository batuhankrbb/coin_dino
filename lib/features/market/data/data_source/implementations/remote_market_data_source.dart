import 'package:coin_dino/core/constants/response_types.dart';
import 'package:coin_dino/core/network/network_clients/network_clients.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/core/utils/error_printer.dart';
import 'package:coin_dino/features/market/data/data_source/contracts/i_remote_market_data_source.dart';
import 'package:coin_dino/features/market/data/exception_handling/exceptions/market_exceptions.dart';
import 'package:coin_dino/features/market/data/models/market_coin_model.dart';
import 'package:dio/dio.dart';

class RemoteMarketDataSource implements IRemoteMarketDataSource {
  var _executer = NetworkExecuter();

  int? page;
  @override
  Future<List<MarketCoinModel>> getCryptoCurrencies(
      String date, String sort, String? category, String vsCurrency) async {
    try {
      var response =
          await _executer.execute<MarketCoinModel, List<MarketCoinModel>>(
              responseType: DefaultResponseTypes.shared.marketCoinModel,
              options:
                  NetworkClients.coinsMarket(date, sort, category, vsCurrency));

      if (response != null) {
        return response;
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "RemoteMarketDataSource/getCryptoCurrencies", e);
      throw MarketException.cryptoCurrencyFetchingException();
    }
  }
}
