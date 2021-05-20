import '../../models/market_coin_category.model.dart';

abstract class IMarketLocalDataSource {
  Future<List<MarketCoinCategoryModel>> getAllCategories();
}
