import 'package:coin_dino/features/market/data/models/market_coin_category.model.dart';
import 'package:coin_dino/features/market/data/models/market_coin_model.dart';
import 'package:coin_dino/features/market/domain/entities/market_coin_category_entity.dart';

abstract class IRemoteMarketDataSource {
  Future<List<MarketCoinModel>> getCryptoCurrencies(String date, String sort, String? category);
  Future<List<MarketCoinCategoryModel>> getAllCategories();
}
