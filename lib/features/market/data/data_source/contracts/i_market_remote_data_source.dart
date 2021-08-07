import '../../models/market_coin_model.dart';

abstract class IMarketRemoteDataSource {
  Future<List<MarketCoinModel>> getCryptoCurrencies(
      String date, String sort, String? category, String vsCurrency, int page);
}
