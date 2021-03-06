import '../../models/market_coin_category.model.dart';
import '../../../domain/entities/market_coin_category_entity.dart';

import '../../models/market_coin_model.dart';

abstract class IMarketRemoteDataSource {
  Future<List<MarketCoinModel>> getCryptoCurrencies(
      String date, String sort, String? category, String vsCurrency, int page);
  Future<List<MarketCoinCategoryModel>> getAllCategories();
}
