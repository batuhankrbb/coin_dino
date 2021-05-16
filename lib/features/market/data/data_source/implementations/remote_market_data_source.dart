
import 'package:coin_dino/features/market/data/data_source/contracts/i_remote_market_data_source.dart';
import 'package:coin_dino/features/market/data/models/market_coin_model.dart';

class RemoteMarketDataSource implements IRemoteMarketDataSource{
  @override
  Future<List<MarketCoinModel>> getCryptoCurrencies(String date, String sort, String? category, String vsCurrency) {
    // TODO: implement getCryptoCurrencies SERCAN
    throw UnimplementedError();
  }

}