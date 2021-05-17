import 'package:coin_dino/core/network/network_clients/network_clients.dart';
import 'package:coin_dino/core/network/network_fetching/network_executer.dart';
import 'package:coin_dino/core/utils/error_printer.dart';
import 'package:coin_dino/features/market/data/data_source/contracts/i_remote_market_data_source.dart';
import 'package:coin_dino/features/market/data/models/market_coin_model.dart';
import 'package:dio/dio.dart';


class RemoteMarketDataSource implements IRemoteMarketDataSource {
  var _executer = NetworkExecuter();

  int? page;
  @override
  Future<List<MarketCoinModel>> getCryptoCurrencies(
      String date, String sort, String? category, String vsCurrency) async {
    try {
      var response = await _executer.execute<MarketCoinModel, MarketCoinModel>(
          responseType: MarketCoinModel(
              ath: 0,
              athChangePercentage: 0,
              atl: 0,
              atlChangePercentage: 0,
              circulatingSupply: 0,
              currentPrice: 0,
              fullyDilutedValuation: 1,
              high24H: 10,
              id: "",
              image: "",
              low24H: 0,
              marketCap: 1,
              marketCapChange24H: 0,
              marketCapChangePercentage24H: 0,
              marketCapRank: 0,
              priceChange24H: 0,
              name: "",
              priceChangePercentage1HInCurrency: 0,
              priceChangePercentage24H: 1,
              priceChangePercentage24HInCurrency: 0,
              priceChangePercentage30DInCurrency: 0,
              priceChangePercentage7DInCurrency: 0,
              symbol: "",
              totalSupply: 0,
              totalVolume: 0,
              athDate: DateTime(1991),
              atlDate: DateTime(1991),
              lastUpdated: DateTime(1991),
              maxSupply: 0,
              roi: Roi(currency: "", percentage: 1, times: 1)),
          options:
              NetworkClients.coinsMarket(date, sort, category, vsCurrency));

      if (response != null) {
        return [response];
      } else {
        throw DioError(requestOptions: RequestOptions(path: ""));
      }
    } on DioError catch (e) {
      ErrorHelper().printError(
          "ActivityRemoteDataSourceImplementation/getActivityByType", e);
      // TODO : değişecek
      throw "";
    }
  }
}
